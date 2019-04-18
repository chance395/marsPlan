//
//  JJTesttComponent.m
//  marsPlain
//
//  Created by Brian on 2019/4/18.
//  Copyright © 2019 Brian. All rights reserved.
//

#import "JJBaseHeader.h"
#import "JJTesttComponent.h"

@interface JJTesttComponent ()
/**
 add private property
 */
@end

@implementation JJTesttComponent

+(JJTesttComponent*)MAGetComponentWithBackgroundColor:(UIColor*)viewColor paramDic:(NSDictionary*)paramDic superView:(UIView*)superView masonrySet:(void(^)(UIView*currentView,MASConstraintMaker*make))block
{
    JJTesttComponent *component =[[JJTesttComponent alloc]init];
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
    self.iconImageView =[UIImageView MAGetImageViewWith:dic[@"imageStr"] superView:self masonrySet:^(UIImageView *currentImageView, MASConstraintMaker *make) {
        make.left.and.top.equalTo(self);
        make.height.and.width.mas_equalTo(40);
    }];
    
    self.titleLabel =[UILabel MAGetLabelWithFont:FONT(16) text:dic[@"title"] textColor:[UIColor JJColorWithHexStr:@"#353030"] textAlignment:NSTextAlignmentLeft superView:self masonrySet:^(UILabel *currentLabel, MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).mas_offset(18);
        make.top.equalTo(self.iconImageView);
        
    }];
    
    self.subTitleLabel =[UILabel MAGetLabelWithFont:FONT(11) text:dic[@"subTitle"] textColor:[UIColor JJColorWithHexStr:@"#808080"] textAlignment:NSTextAlignmentRight superView:self masonrySet:^(UILabel *currentLabel, MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.bottom.equalTo(self.iconImageView);
    }];
    
}


@end
