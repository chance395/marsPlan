//
//  JJAVViewController.m
//  marsPlain
//
//  Created by Brian on 2019/5/2.
//  Copyright © 2019 Brian. All rights reserved.
//

#import "JJAVViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface JJAVViewController ()<AVCaptureVideoDataOutputSampleBufferDelegate>

@end

@implementation JJAVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)viewWillAppear:(BOOL)animated
{
    UIButton *videoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    videoBtn.frame = CGRectMake(0, 0, 100, 50);
    videoBtn.center = self.view.center;
    [videoBtn setTitle:@"视频流" forState:UIControlStateNormal];
    [videoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [videoBtn addTarget:self action:@selector(videoBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:videoBtn];
    // Do any additional setup after loading the view, typically from a nib.
//    [self videoBtnAction];
    
}
//创建并配置一个捕获会话并启用它


-(void)videoBtnAction
{
    //捕获视频流的方法写在这里
    NSError *error = nil;
    // Create the session创建session
    AVCaptureSession *session = [[AVCaptureSession alloc] init];//负责输入和输出设置之间的数据传递
    // Configure the session to produce lower resolution video frames, if your
    // processing algorithm can cope. We'll specify medium quality for the
    // chosen device.可以配置session以产生解析度较低的视频帧，如果你的处理算法能够应付（这种低解析度）
    //我们将选择的设备指定为高质量
    session.sessionPreset = AVCaptureSessionPresetMedium;//设置分辨率
    // Find a suitable AVCaptureDevice找到一个合适的AVCaptureDevice
    AVCaptureDevice *device = [AVCaptureDevice
                               defaultDeviceWithMediaType:AVMediaTypeVideo];//这里默认是使用后置摄像头，你可以改成前置摄像头
    // Create a device input with the device and add it to the session.
    //找到一个合适的AVCaptureDevice
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device
                                                                        error:&error];
    if (!input) {
        // Handling the error appropriately.处理相应的错误
    }
    [session addInput:input];
    // Create a VideoDataOutput and add it to the session创建一个VideoDataOutput对象，将其添加到session
    AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];//创建一个视频数据输出流
    [session addOutput:output];
    // Configure your output.配置output对象
    dispatch_queue_t queue = dispatch_queue_create("myQueue", NULL);
    [output setSampleBufferDelegate:self queue:queue];
    // Specify the pixel format指定像素格式
    output.videoSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                            [NSNumber numberWithInt:kCVPixelFormatType_32BGRA], kCVPixelBufferPixelFormatTypeKey,
                            [NSNumber numberWithInt: 1920], (id)kCVPixelBufferWidthKey,
                            [NSNumber numberWithInt: 1080], (id)kCVPixelBufferHeightKey,nil];
    AVCaptureVideoPreviewLayer* preLayer = [AVCaptureVideoPreviewLayer layerWithSession: session];//相机拍摄预览图层
    //preLayer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    preLayer.frame = CGRectMake(0, 0, 1920, 1080);
    preLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:preLayer];
    // If you wish to cap the frame rate to a known value, such as 15 fps, set
    // minFrameDuration.
    //如果你想将视频的帧数指定一个顶值，例如15fps
    //可以设置minFrameDuration(该属性在ios5.0中启用)
    output.minFrameDuration = CMTimeMake(1, 30);
    // Start the session running to start the flow of data启动session以启动数据流
    [session startRunning];
    // Assign session to an ivar.将session赋给实例变量
    //[self setSession:session];
    
    
}
// Delegate routine that is called when a sample buffer was written
// 抽样缓存写入时所调用的委托程序
-(void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
fromConnection:(AVCaptureConnection *)connection
{
    // Create a UIImage from the sample buffer data 通过抽样缓冲数据创建一个UIImage对象
    UIImage *image = [self imageFromSampleBuffer:sampleBuffer];
    //--此处添加使用该image对象的代码-->
    NSData *mData = UIImageJPEGRepresentation(image, 0.5);
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    NSLog(@"%llu", recordTime);
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss:SSS"];
    NSString *date = [formatter stringFromDate:[NSDate date]];
    NSString *timeLocal = [[NSString alloc] initWithFormat:@"%@", date];
    NSLog(@"%@", timeLocal);
    
    
}
// Create a UIImage from sample buffer data
//通过抽样缓存数据创建一个UIImage对象
-(UIImage *) imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer
{
    // Get a CMSampleBuffer's Core Video image buffer for the media data
    //为媒体数据设置一个CMSampleBuffer的Core Video图像缓存对象
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    // Lock the base address of the pixel buffer锁定pixel buffer的基地址
    CVPixelBufferLockBaseAddress(imageBuffer, 0);
    // Get the number of bytes per row for the pixel buffer得到pixel buffer的基地址
    void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
    // Get the number of bytes per row for the pixel buffer得到pixel buffer的行字节数
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    // Get the pixel buffer width and height得到pixel buffer的宽和高
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    // Create a device-dependent RGB color space创建一个依赖于设备的rgb颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    // Create a bitmap graphics context with the sample buffer data用抽样缓存的数据创建一个位图格式的图形上下文（graphics context）对象
    CGContextRef context = CGBitmapContextCreate(baseAddress, width, height, 8,
                                                 bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    // Create a Quartz image from the pixel data in the bitmap graphics context根据这个位图的context中的像素数据创建一个Quartz image对象
    CGImageRef quartzImage = CGBitmapContextCreateImage(context);
    // Unlock the pixel buffer解锁pixel buffer
    CVPixelBufferUnlockBaseAddress(imageBuffer,0);
    // Free up the context and color space释放context和颜色空间
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    // Create an image object from the Quartz image用Quartz image创建一个UIImage对象image
    UIImage *image = [UIImage imageWithCGImage:quartzImage];
    // Release the Quartz image释放Quartz image对象
    CGImageRelease(quartzImage);
    return (image);
}



@end
