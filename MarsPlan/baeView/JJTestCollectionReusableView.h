//
//  JJTestCollectionReusableView.h
//  marsPlain
//
//  Created by Brian on 2019/4/19.
//  Copyright © 2019 Brian. All rights reserved.
//

#import <JJTools/JJTools.h>

@interface JJTestCollectionReusableView : JJBaseCollectionReusableView

/**
 init collection the method is needed
 
 @param frame frame
 @return cell
 */
- (instancetype)initWithFrame:(CGRect)frame;

/**
 cofig cell
 
 @param dic dic
 @param arrData data
 @param indexPath index
 */
- (void)configJJTestCollectionReusableViewWithDic:(NSDictionary *)dic arrdata:(NSMutableArray *)arrData indexPath:(NSIndexPath *)indexPath;

/**
 HeaderFooterView height
 
 @return height
 */
-(CGFloat)getCellHeight;

@end
