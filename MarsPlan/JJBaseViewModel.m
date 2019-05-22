//
//  JJBaseViewModel.m
//  XueHua_SCI
//
//  Created by Brian on 2019/4/25.
//  Copyright © 2019 Symbio. All rights reserved.
//

#import "JJBaseViewModel.h"
#import "NSObject+RateLimiting.h"

@interface JJBaseViewModel ()

@property (nonatomic, assign) BOOL shouldActiveInForeground;

@end

@implementation JJBaseViewModel

@synthesize dataChangedSignal        = mDataChangedSignal;
@synthesize contentUpdateSignal        = mContentUpdateSingal;

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        // If app is put to background, 2FA locked storage need reload after come back
        [notificationCenter addObserver:self
                               selector:@selector(applicationDidEnterBackground:)
                                   name:UIApplicationDidEnterBackgroundNotification
                                 object:nil];
        
        [notificationCenter addObserver:self
                               selector:@selector(applicationDidBecomeActive:)
                                   name:UIApplicationDidBecomeActiveNotification
                                 object:nil];
        
        mNeedsReloadData = YES;
        
        mDataChangedSignal        = [RACSubject subject];
        mContentUpdateSingal    = [RACSubject subject];
        
        @weakify(self);
        [self.didBecomeActiveSignal subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            
            [self reloadDataIfNeeded];
        }];
        
    }
    
    return self;
}

#pragma mark - Confirm DataReloading
- (void)setNeedsReloadData
{
    mNeedsReloadData = YES;
}

- (void)reloadDataIfNeeded
{
    if (mNeedsReloadData && self.isActive)
    {
        [self debounce:@selector(reloadData)
            withObject:nil
              duration:1.0];
    }
}

- (void)reloadData
{
    [self sendDataChangedSignal];
}

- (void)beginReloadingData
{
    
}

- (void)finishReloadingData
{
    mNeedsReloadData = NO;
}

#pragma mark - Signal changed
- (void)sendDataChangedSignal
{
    [(RACSubject *)mDataChangedSignal sendNext:nil];
}

- (void)sendContentUpdateSignal
{
    [(RACSubject *)mContentUpdateSingal sendNext:nil];
}

- (void)sendDataChangedCompletedSignal
{
    [(RACSubject *)mDataChangedSignal sendCompleted];
}

- (void)sendContentChangedCompletedSignal
{
    [(RACSubject *)mContentUpdateSingal sendCompleted];
}

#pragma mark - UIApplication Notifications

- (void)applicationDidEnterBackground:(NSNotification *)note
{
    self.shouldActiveInForeground = self.active;
    
    self.active = NO;
    
    [self setNeedsReloadData];
}

- (void)applicationDidBecomeActive:(NSNotification *)note
{
    [self setNeedsReloadData];
    self.active = self.shouldActiveInForeground;
}


@end
