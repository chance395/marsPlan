//
//  JJTestTableViewHeaderFooterView.h
//  marsPlain
//
//  Created by Brian on 2019/4/19.
//  Copyright © 2019 Brian. All rights reserved.
//

#import <JJTools/JJTools.h>

@interface JJTestTableViewHeaderFooterView : JJBaseTableViewHeaderFooterView

/**
 init HeaderFooterView
 
 @param tableView tableView
 @return HeaderFooterView
 */

+ (JJTestTableViewHeaderFooterView *)getHeaderFooterViewWithTableView:(UITableView *)tableView;
/**
 configDataSource
 
 @param dic currentCellData
 @param arrData theDataArray
 @param indexPath indexPatch
 */
- (void)configJJTestTableViewHeaderFooterViewWithDic:(NSDictionary *)dic arrdata:(NSMutableArray *)arrData indexPath:(NSIndexPath *)indexPath;

/**
 HeaderFooterView height
 
 @return height
 */
-(CGFloat)getHeaderFooterViewHeight;

@end
