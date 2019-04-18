//
//  JJTesttComponent.h
//  marsPlain
//
//  Created by Brian on 2019/4/18.
//  Copyright © 2019 Brian. All rights reserved.
//

#import <JJTools/JJTools.h>
#import "JJBaseHeader.h"
@interface JJTesttComponent : JJBaseComponent

@property(nonatomic,strong) UIImageView                 * iconImageView;
@property(nonatomic,strong) UILabel                     * titleLabel;
@property(nonatomic,strong) UILabel                     * subTitleLabel;

/**
 return a custom component
 
 @param viewColor BackgroundColor
 @param paramDic paramDic
 @param superView superview
 @param block block
 @return component
 */

+(JJTesttComponent*)MAGetComponentWithBackgroundColor:(UIColor*)viewColor paramDic:(NSDictionary*)paramDic superView:(UIView*)superView masonrySet:(void(^)(UIView*currentView,MASConstraintMaker*make))block;

@end
