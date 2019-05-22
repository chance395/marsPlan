//
//  JJTestViewController.m
//  marsPlain
//
//  Created by Brian on 2019/4/16.
//  Copyright © 2019 Brian. All rights reserved.
//

#import "JJTestViewController.h"
#import "ReactiveObjC.h"
#import "JJCustomView.h"

@interface JJTestViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *actionBtn;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong ,nonatomic)JJCustomView *customView;

@end

@implementation JJTestViewController


/*
 1. RAC(TARGET, [KEYPATH, [NIL_VALUE]]):用于给某个对象的某个属性绑定。
 
 // 只要文本框文字改变，就会修改label的文字
 RAC(self.labelView,text) = _textField.rac_textSignal;
 2. RACObserve(self, name):监听某个对象的某个属性,返回的是信号。
 
 [RACObserve(self.view, center) subscribeNext:^(id x) {
 NSLog(@”%@”,x);
 }];
 3. @weakify(Obj)和@strongify(Obj)
 
 一般两个都是配套使用,在主头文件(ReactiveCocoa.h)中并没有导入，需要自己手动导入，RACEXTScope.h才可以使用。但是每次导入都非常麻烦，只需要在主头文件自己导入就好了。
 4. RACTuplePack：把数据包装成RACTuple（元组类）
 
 // 把参数中的数据包装成元组
 RACTuple *tuple = RACTuplePack(@10,@20);
 5. RACTupleUnpack：把RACTuple（元组类）解包成对应的数据。
 
 // 把参数中的数据包装成元组
 RACTuple *tuple = RACTuplePack(@”xmg”,@20);
 // 解包元组，会把元组的值，按顺序给参数里面的变量赋值
 // name = @”xmg” age = @20
 RACTupleUnpack(NSString *name,NSNumber *age) = tuple;
 **/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self theUseOfMap];
    //RAC使用案例
    
//1.代替KVO

    [[self.contentView rac_valuesForKeyPath:@"backgroundColor" observer:self]subscribeNext:^(id  _Nullable x) {
        NSLog(@"valueForKeyPath.backgroundColor->%@",x);
        
    }];
 
    
    [RACObserve(self.contentView, backgroundColor)subscribeNext:^(id  _Nullable x) {
        NSLog(@"RACObserve.backgrondColor->%@",x);
    }];


 //2..监听事件
    [[self.actionBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"self.actionBtn.rac_signalclicked%@",x);
    }];
    
    [[self.textField rac_textSignal]subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"self.textField.rac_textSignal%@",x);
    }];
    
    [self theUseOfRACSubject];
    //fitter 条件判断
    [[self.textField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        return [value isEqualToString:@"666"]; // 表示输入文字==666 时才会调用下面的 block
    }]subscribeNext:^(NSString * _Nullable x) {
        self.view.backgroundColor =[UIColor greenColor];
    }];
 
  //代替通知
    
    NSString * const kNotificationName = @"kNotificationName";
    
    [[[NSNotificationCenter defaultCenter]rac_addObserverForName:kNotificationName object:nil]subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"rac_addobserveForName%@",x);
    }];
    
    [[self.btn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        [[NSNotificationCenter defaultCenter]postNotificationName:kNotificationName object:nil userInfo:@{@"key":@"123"}];
        
    }];
    
//代替代理
    
     self.customView= [[JJCustomView alloc] initWithFrame:CGRectMake(30, 350, 300, 30)];
    [self.view addSubview:self.customView];
    
    SEL sel =NSSelectorFromString(@"customBtnClick:");
    @weakify(self);
    [[self.customView rac_signalForSelector:sel]subscribeNext:^(RACTuple * _Nullable x) {
    @strongify(self);
        NSLog(@"JJCustomView.Btn.rac_signal%@",x);
        RACTupleUnpack(UIButton *sender) =x;
        self.view.backgroundColor =sender.backgroundColor;
    }];

    //RAC 动态绑定  组合,只有两个信号都有值,才可以组合
//
//    RAC(self.customView,backgroundColor)=[RACSignal combineLatest:@[self.label.text,self.textField.rac_textSignal] reduce:^id (NSString *text,NSString*value){
//        if ([value isEqualToString:@"666"]) {
//            return [UIColor redColor];
//        }
//        return nil;
//    }];
    [self.btn setTitle:@"???？？AAhh" forState:UIControlStateNormal];
    [self.btn setImage:[UIImage imageNamed:@"pic_default"] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(testTT) forControlEvents:UIControlEventTouchUpInside];
   
}

-(void)injected
{
    [self viewDidLoad];
}

-(void)testTT
{
    
}

-(void)theUseOfMap
{
    RACSignal *singalA =[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"AAA"];
        [subscriber sendCompleted];
        return nil;
    }];
    //对值进行判定
    RAC(self.textField,text) =[singalA map:^id _Nullable(id  _Nullable value) {
        if ([value isEqualToString:@"AAA"]) {
            return @"666";
        }
        return @"";
    }];
}

-(void)theUseOfRACSignal
{
    //创建信号
    RACSignal *singal =[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"BBB"];
        [subscriber sendCompleted];
        return nil;
    }];
    //订阅信号
    RACDisposable *disposable =[singal subscribeNext:^(id  _Nullable x) {
        NSLog(@"信号内容%@",x);
    }];
    //取消订阅
    [disposable dispose];
}

/*
 通常用于取代代理方法
 */
-(void)theUseOfRACSubject
{
    self.customView.subject =[RACSubject subject];
    [self.customView.subject subscribeNext:^(id  _Nullable x) {
       //block
    }];
}

/*
 数组和字典
 */
-(void)theUseOfArrayAndDic
{
    RACTuple *tuple =[RACTuple tupleWithObjects:@"1",@"2",@"3", nil];
    //从别的数组获取
    RACTuple *tuple1 =[RACTuple tupleWithObjectsFromArray:@[@"1",@"2",@"3"]];
    //利用rac宏快速封装
    RACTuple *tuple2 =RACTuplePack(@"1",@"2",@"3");
    
    /* 遍历数组 */
    NSArray *array =@[@"1",@"2",@"3"];
    [array.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    /* 遍历字典 */
    NSDictionary *dictionary = @{@"key1":@"value1", @"key2":@"value2", @"key3":@"value3"};
    [dictionary.rac_sequence.signal subscribeNext:^( RACTuple * x) {
        RACTupleUnpack(NSString *key,NSString*value) =x;
        NSLog(@"%@%@",key,value);
    }];
    
}
/*
 两个信号串联,两个管串联,一个管处理完自己的东西,下一个管才开始处理自己的东西
 */
-(void)theUseOfSeries
{
    RACSignal *A =[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"吃饭"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *B =[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"睡觉"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    //串联管A和管B
    RACSignal *C =[A concat:B];
    
        //串联后的接收端处理 ,两个事件,走两次,第一个打印siggnalA的结果,第二次打印siganlB的结果
    [C subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    
}

-(void)theUseOfParallel
{
    //创建信号A
    RACSignal *siganlA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"纸厂污水"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    //创建信号B
    RACSignal *siganlB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@"电镀厂污水"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    //并联两个信号,根上面一样,分两次打印
    RACSignal *mergeSiganl = [RACSignal merge:@[siganlA,siganlB]];
    [mergeSiganl subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
        
    }];
}

-(void)theUseOfBoth
{
    //定义2个自定义信号
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];
    
    //组合信号
    [[RACSignal combineLatest:@[letters,numbers] reduce:^(NSString *letter, NSString *number){
        
        return [letter stringByAppendingString:number];
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
        
    }];
    
    
    //自己控制发生信号值
    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [numbers sendNext:@"1"]; //打印B1
    [letters sendNext:@"C"];//打印C1
    [numbers sendNext:@"2"];//打印C2
}

@end
