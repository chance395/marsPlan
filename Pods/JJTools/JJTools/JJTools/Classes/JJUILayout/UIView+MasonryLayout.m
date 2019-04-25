//
//  UIView+MasonryLayout.m
//  qhg_ios
//
//  Created by Brain on 2018/9/9.
//  Copyright © 2018 In-next. All rights reserved.
//

#import "UIView+MasonryLayout.h"
#import "UIColor+JJTools.h"

@implementation UIView (MasonryLayout)

+ (UIView*)MAGetUIViewWithBackgroundColor:(UIColor*)viewColor superView:(UIView*)superView masonrySet:(void(^)(UIView*currentView,MASConstraintMaker*make))block
{
    UIView *view =[[UIView alloc]init];
    if (viewColor) {
        view.backgroundColor =viewColor;
    }
    view.translatesAutoresizingMaskIntoConstraints =NO;
    [superView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(view,make);
        }
    }];
    return view;
}

+ (UIView*)MAGetUIViewWithHexBackgroundColor:(NSString*)hexStr superView:(UIView*)superView masonrySet:(void(^)(UIView*currentView,MASConstraintMaker*make))block
{
   return   [UIView MAGetUIViewWithBackgroundColor:[UIColor JJColorWithHexStr:hexStr] superView:superView masonrySet:block];
}


@end
