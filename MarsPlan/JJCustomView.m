//
//  JJCustomView.m
//  marsPlain
//
//  Created by Brian on 2019/4/16.
//  Copyright © 2019 Brian. All rights reserved.
//

#import "JJCustomView.h"

@interface JJCustomView ()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@end
@implementation JJCustomView
/**
 XIB创建会调用
 */
- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUI];
    }
    return self;
}

/**
 代码创建会调用
 */
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

/**
 初始化
 */
- (void)setUI{
    [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    [self addSubview:self.contentView];
}

/**
 自动适配大小
 */
- (void)drawRect:(CGRect)rect{
    self.contentView.frame = self.bounds;
}

- (IBAction)customBtnClick:(id)sender {
    
}

/**
 直接代替了代理也可以在控制器中使用
 */
- (IBAction)testBtnDidClick:(id)sender {
    if (self.subject) {
        [self.subject sendNext:sender];
    }
}

@end
