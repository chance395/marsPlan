//
//  JJCustomView.h
//  marsPlain
//
//  Created by Brian on 2019/4/16.
//  Copyright © 2019 Brian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveObjC.h"
NS_ASSUME_NONNULL_BEGIN

@interface JJCustomView : UIView
@property (nonatomic, strong) RACSubject *subject;
@end

NS_ASSUME_NONNULL_END
