//
//  JJBaseTableViewModel.m
//  Victoria
//
//  Created by Brian on 2019/5/19.
//  Copyright © 2019 Brian. All rights reserved.
//

#import "JJBaseTableViewModel.h"
#import "JJTestTableViewCell.h"
@interface JJBaseTableViewModel () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) NSUInteger                   Sections;
@property (nonatomic, assign) NSUInteger                   Rows;
@property (nonatomic, assign) CGFloat                      RowHeight;


@end

@implementation JJBaseTableViewModel

#pragma mark--init

- (instancetype)initTableViewModelWithTableViewStyle:(UITableViewStyle)style SuperView:(UIView*)superView MasonrySet:(void(^)(JJBaseTableView *currentTableView,MASConstraintMaker*make))block
{
    self = [super init];
    if (self) {
        self.mainTableView =[[JJBaseTableView alloc]initWithFrame:CGRectZero style:style];
        [superView addSubview:self.mainTableView];
        self.mainTableView.delegate =self;
        self.mainTableView.dataSource =self;
        self.mainTableView.backgroundColor =[UIColor redColor];
        [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (block) {
                block(self.mainTableView,make);
            }
        }];
    }
    return self;
}

-(callTableViewModelBlock)tableViewModelBlock
{
    @weakify(self);
    return ^(NSUInteger sections ,NSUInteger rows, CGFloat rowHeight ,UITableViewCell* cell)
    {
    @strongify(self);
        self.Sections = sections ? sections :0;
        self.Rows =rows ? rows :1;
        self.RowHeight =rowHeight ? rowHeight :0.f;
        self.Cell =cell ? cell  :nil;
    };
}


#pragma mark--datasource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    return self.Sections;
    return 6;
}

- (NSInteger)tableView:( UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.Rows;
    return 1;
}

- ( UITableViewCell *)tableView:( UITableView *)tableView cellForRowAtIndexPath:( NSIndexPath *)indexPath {
//    NSString *ID =@"adf";
//    Class AAA =NSClassFromString(ID);
//    if ([AAA isKindOfClass:[JJBaseTableViewCell class] ]) {
////        (JJBaseTableViewCell*)AAA =[aaa]
//    }
////    JJTestTableViewCell *cell =[JJTestTableViewCell getCellWithTableView:tableView];
//
    return self.Cell;
}

#pragma mark--delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.RowHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- ( UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
- ( UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
