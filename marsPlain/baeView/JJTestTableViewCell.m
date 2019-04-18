//
//  JJTestTableViewCell.m
//  marsPlain
//
//  Created by Brian on 2019/4/18.
//  Copyright © 2019 Brian. All rights reserved.
//

#import "JJBaseHeader.h"
#import "JJTestTableViewCell.h"

@interface JJTestTableViewCell ()

@property (nonatomic,strong)UILabel     *titleLabel;
@property (nonatomic,strong)UIImageView *conentImv;
@property (nonatomic,strong)UIButton    *actionBtn;
@property (nonatomic,strong)UIView      *backView;

@end

#pragma mark -public
@implementation JJTestTableViewCell

+ (JJTestTableViewCell *)getCellWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"JJTestTableViewCell";
    JJTestTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if ( !cell )
    {
        cell = [[JJTestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell setupSubViews];
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)configJJTestTableViewCellWithDic:(NSDictionary *)dic arrdata:(NSMutableArray *)arrData indexPath:(NSIndexPath *)indexPath
{
    self.titleLabel =dic[@"title"];
    self.conentImv.image =[UIImage imageNamed:dic[@"icon"]];
    //case1
    [self.actionBtn setImage:[UIImage imageNamed:dic[@"imageName"]] forState:UIControlStateNormal];
    //case2
    [self.actionBtn setTitle:dic[@"btnTitle"] forState:UIControlStateNormal];
}

- (CGFloat)getCellHeight
{
    return 0;
}

#pragma mark -private
- (void)setupSubViews
{
    self.conentImv =[UIImageView MAGetImageViewWith:@"" superView:self.contentView masonrySet:^(UIImageView *currentImageView, MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).mas_offset(0);
        make.top.equalTo(self.contentView.mas_top).mas_offset(0);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
        
    }];
    
    self.titleLabel =[UILabel MAGetLabelWithFont:FONT(14) text:@"" textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft superView:self.contentView masonrySet:^(UILabel *currentLabel, MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).mas_offset(0);
        make.top.equalTo(self.contentView.mas_top).mas_offset(0);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
        
    }];
    
    //case 1 Image
    self.actionBtn =[UIButton MAGetButtonWithImage:@"" superView:self.contentView target:self action:@selector(btnClickAction:) masonrySet:^(UIButton *currentBtn, MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).mas_offset(0);
        make.top.equalTo(self.contentView.mas_top).mas_offset(0);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
        
    }];
    
    //case 2  title
    self.actionBtn =[UIButton MAGetButtonWithTitle:@"" font:FONT(12) textColor:[UIColor whiteColor] backGroundColor:[UIColor whiteColor] corners:4 superView:self.contentView target:self action:@selector(btnClickAction:) masonrySet:^(UIButton *currentBtn, MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).mas_offset(0);
        make.top.equalTo(self.contentView.mas_top).mas_offset(0);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
        
    }];
    
    self.backView =[UIView MAGetUIViewWithBackgroundColor:[UIColor whiteColor] superView:self.contentView masonrySet:^(UIView *currentView, MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).mas_offset(0);
        make.top.equalTo(self.contentView.mas_top).mas_offset(0);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
    }];
    
    
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

- (void)btnClickAction:(UIButton*)sender
{
    
    
}
@end
