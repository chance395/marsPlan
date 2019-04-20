//
//  JJTestComponent.m
//  marsPlain
//
//  Created by Brian on 2019/4/19.
//  Copyright © 2019 Brian. All rights reserved.
//

#import "JJTestComponent.h"

@interface JJTestComponent ()
/**
 add private property
 */
@end

@implementation JJTestComponent

+(JJTestComponent*)MAGetComponentWithBackgroundColor:(UIColor*)viewColor paramDic:(NSDictionary*)paramDic superView:(UIView*)superView masonrySet:(void(^)(UIView*currentView,MASConstraintMaker*make))block
{
    JJTestComponent *component = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
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
    
    
}


@end
