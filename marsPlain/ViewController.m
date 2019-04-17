//
//  ViewController.m
//  marsPlain
//
//  Created by Brian on 2019/4/15.
//  Copyright © 2019 Brian. All rights reserved.
//

#import "ViewController.h"
#import "JJTestViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    JJTestViewController *test =[[JJTestViewController alloc]init];
    [self presentViewController:test animated:YES completion:nil];
    
}

@end
