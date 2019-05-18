//
//  ViewController.m
//  marsPlain
//
//  Created by Brian on 2019/4/15.
//  Copyright © 2019 Brian. All rights reserved.
//

#import "ViewController.h"
#import "JJTestViewController.h"
#import "UITextView+MasonryLayout.h"
#import  <JJTools/JJTools.h>
#import "JJTestComponent.h"
#import "JJAVViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UILabel *tes3 =[UILabel MAGetLabelWithFont:FONT(12) text:@"CCCC" textColor:[UIColor redColor] textAlignment:NSTextAlignmentLeft superView:self.view masonrySet:^(UILabel *currentLabel, MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];



//    UITextField *textField =[UITextField MAGetTextFieldWithFont:FONT(12) textColor:[UIColor lightTextColor] placeHolder:@")))))))" corner:2 keybordType:UIKeyboardTypeDefault isSecurity:NO superView:self.view masonrySet:^(UITextField *currentTextField, MASConstraintMaker *make) {
//                make.centerX.equalTo(self.view);
//                make.centerY.equalTo(self.view);
//                make.height.mas_equalTo(40);
//                make.width.mas_equalTo(200);
//    }];
    
    
//    JJCustombutton *custom =[JJCustombutton MAGetCustomButtonWithTitleEdge:UIEdgeInsetsMake(5, 20, 5, 200) imageEdge:UIEdgeInsetsMake(5, 100, 5, 50) imageDirection:SAImageEdgeTopRight imageName:@"pic_default" Font:FONT(12) TextColor:[UIColor redColor] backGroundColor:[UIColor purpleColor] corners:4 superView:self.view target:nil action:nil masonrySet:^(UIButton *currentBtn, MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.height.mas_equalTo(40);
//        make.width.mas_equalTo(200);
//    }];
//
//    JJTestComponent *comp =[JJTestComponent MAGetComponentWithBackgroundColor:Color_WhiteColor paramDic:nil superView:self.view masonrySet:^(UIView *currentView, MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.width.and.height.mas_equalTo(100);
//    }];
//    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(50, 90, 300, 30)];
//    label.text =@"sdfasdfasdf333333333333333";
//    label.textColor =[UIColor purpleColor];
//    label.font =FONT(14);
//    [self.view addSubview:label];
    
    JJTestViewController *test =[[JJTestViewController alloc]init];
    [self presentViewController:test animated:YES completion:nil];
    
//    JJAVViewController *test =[[JJAVViewController alloc]init];
//    [self presentViewController:test animated:YES completion:nil];
    

}

-(void)injected{
    [self viewDidLoad];
    
}

@end
