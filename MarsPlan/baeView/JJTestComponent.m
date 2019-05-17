//
//  JJTestComponent.m
//  marsPlain
//
//  Created by Brian on 2019/4/23.
//  Copyright © 2019 Brian. All rights reserved.
//

#import "JJTestComponent.h"

@interface JJTestComponent ()
@property (nonatomic, strong)UILabel     *titleLabel;
@property (nonatomic, strong)UILabel     *subTitleLabel;
@end

IB_DESIGNABLE
@implementation JJTestComponent

+(JJTestComponent*)MAGetComponentWithBackgroundColor:(UIColor*)viewColor paramDic:(NSDictionary*)paramDic superView:(UIView*)superView masonrySet:(void(^)(UIView*currentView,MASConstraintMaker*make))block
{
    JJTestComponent *component =[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    if (viewColor) {
        component.backgroundColor =viewColor;
    }
    [superView addSubview:component];
    [component mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(component,make);
        }
    }];
    [component setupSubViewsWithParamDic:paramDic];
    
    return component;
}

-(void)setupSubViewsWithParamDic:(NSDictionary*)dic
{
    UIView *superView =self;
    
    self.titleLabel =[UILabel MAGetLabelWithFont:FONT(14) text:@"Title" textColor:[UIColor JJRandomColor] textAlignment:NSTextAlignmentLeft superView:superView masonrySet:^(UILabel *currentLabel, MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(superView.mas_top).mas_offset(10);
    }];
    
    self.subTitleLabel =[UILabel MAGetLabelWithFont:FONT(14) text:@"subtitle" textColor:[UIColor JJRandomColor] textAlignment:NSTextAlignmentLeft superView:superView masonrySet:^(UILabel *currentLabel, MASConstraintMaker *make) {
         make.centerX.equalTo(self);
        make.top.equalTo(self.titleLabel.mas_bottom).mas_offset(35);
    }];
    self.subTitleLabel.font =FONT(20);
}


@end
