//
//  JJTestTableViewCell.m
//  marsPlain
//
//  Created by Brian on 2019/4/19.
//  Copyright © 2019 Brian. All rights reserved.
//

#import "JJTestTableViewCell.h"

@interface JJTestTableViewCell ()

@end

#pragma mark -public
@implementation JJTestTableViewCell

+ (JJTestTableViewCell *)getCellWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"JJTestTableViewCell";
    JJTestTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if ( !cell )
    {
        /** remember set the Identifie in xib
         */
        cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
        [cell setupSubViews];
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)configJJTestTableViewCellWithDic:(NSDictionary *)dic arrdata:(NSMutableArray *)arrData indexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)getCellHeight
{
    return 0;
}

#pragma mark -private
- (void)setupSubViews
{
   
}
#pragma mark -Getter


#pragma mark -Setter


#pragma mark--override
- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}


#pragma mark -btnAction or delegate


@end
