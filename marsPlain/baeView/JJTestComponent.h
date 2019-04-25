//
//  JJTestComponent.h
//  marsPlain
//
//  Created by Brian on 2019/4/23.
//  Copyright © 2019 Brian. All rights reserved.
//

#import <JJTools/JJTools.h>
#import "Masonry.h"
@interface JJTestComponent : UIView

/**
 return a custom component
 
 @param viewColor BackgroundColor
 @param paramDic paramDic
 @param superView superview
 @param block block
 @return component
 */
+(JJTestComponent*)MAGetComponentWithBackgroundColor:(UIColor*)viewColor paramDic:(NSDictionary*)paramDic superView:(UIView*)superView masonrySet:(void(^)(UIView*currentView,MASConstraintMaker*make))block;

@end
