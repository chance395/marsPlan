//
//  XHBaseTableViewCell.h
//  marsPlain
//
//  Created by Brian on 2019/4/18.
//  Copyright © 2019 Brian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHBaseTableViewCell : UITableViewCell

+ (XHBaseTableViewCell *)getCellWithTableView:(UITableView *)tableView;
/**
 configDataSource
 
 @param dic currentCellData
 @param arrData theDataArray
 @param indexPath indexPatch
 */
- (void)configXHBaseTableViewCellWithDic:(NSDictionary *)dic arrdata:(NSMutableArray *)arrData indexPath:(NSIndexPath *)indexPath;

@end
