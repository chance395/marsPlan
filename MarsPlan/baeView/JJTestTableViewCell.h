//
//  JJTestTableViewCell.h
//  marsPlain
//
//  Created by Brian on 2019/4/19.
//  Copyright © 2019 Brian. All rights reserved.
//

#import <JJTools/JJTools.h>

@interface JJTestTableViewCell : JJBaseTableViewCell

/**
 init cell
 
 @param tableView tableView
 @return cell
 */

+ (JJTestTableViewCell *)getCellWithTableView:(UITableView *)tableView;
/**
 configDataSource
 
 @param dic currentCellData
 @param arrData theDataArray
 @param indexPath indexPatch
 */
- (void)configJJTestTableViewCellWithDic:(NSDictionary *)dic arrdata:(NSMutableArray *)arrData indexPath:(NSIndexPath *)indexPath;

/**
 cell height
 
 @return height
 */
-(CGFloat)getCellHeight;

@end
