//
//  JJBaseViewModel.h
//  XueHua_SCI
//
//  Created by Brian on 2019/4/25.
//  Copyright © 2019 Symbio. All rights reserved.
//

#import "RVMViewModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol JJDataReloading <NSObject>

- (void)setNeedsReloadData;

- (void)reloadDataIfNeeded;

// This method has to be override by subclass
- (void)reloadData;

- (void)beginReloadingData;

- (void)finishReloadingData;

@end
@interface JJBaseViewModel : RVMViewModel <JJDataReloading>
{
    BOOL mNeedsReloadData;
    
    RACSignal    *mDataChangedSignal;
    RACSignal    *mContentUpdateSingal;
}
@property (nonatomic, readonly) RACSignal    *dataChangedSignal;
@property (nonatomic, readonly) RACSignal    *contentUpdateSignal;

- (void)sendDataChangedSignal;
- (void)sendContentUpdateSignal;

- (void)sendDataChangedCompletedSignal;
- (void)sendContentChangedCompletedSignal;

@end

NS_ASSUME_NONNULL_END
