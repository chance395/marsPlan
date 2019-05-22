//
//  JJBaseTableViewModel.h
//  Victoria
//
//  Created by Brian on 2019/5/19.
//  Copyright © 2019 Brian. All rights reserved.
//
#import "JJBaseViewModel.h"
#import "JJTools.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//@protocol tableViewModleDelegate <NSObject>
//
//@required
//-(UITableViewCell*)getWith:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath;
//
//@end

typedef void(^callTableViewModelBlock)(NSUInteger sections ,NSUInteger rows, CGFloat rowHeight ,UITableViewCell* cell );

@interface JJBaseTableViewModel : JJBaseViewModel

@property (nonatomic, strong) JJBaseTableView             *mainTableView;
@property (nonatomic, strong) UITableViewCell             *Cell;
@property (nonatomic, copy)   callTableViewModelBlock      tableViewModelBlock;
//@property (nonatomic, weak) id <tableViewModleDelegate>    modelDelegate;
-(instancetype)init NS_UNAVAILABLE;
- (instancetype)initTableViewModelWithTableViewStyle:(UITableViewStyle)style SuperView:(UIView*)superView MasonrySet:(void(^)(JJBaseTableView *currentTableView,MASConstraintMaker*make))block NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
