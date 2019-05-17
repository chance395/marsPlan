//
//  JJTestTableViewHeaderFooterView.m
//  marsPlain
//
//  Created by Brian on 2019/4/19.
//  Copyright © 2019 Brian. All rights reserved.
//

#import "JJTestTableViewHeaderFooterView.h"

@interface JJTestTableViewHeaderFooterView ()

@property (nonatomic, strong)UILabel     *titleLabel;
@property (nonatomic, strong)UILabel     *subTitleLabel;
@property (nonatomic, strong)UIButton    *actionBtn;
@property (nonatomic, strong)UIView      *backView;

@end

#pragma mark -public
@implementation JJTestTableViewHeaderFooterView

+ (JJTestTableViewHeaderFooterView *)getHeaderFooterViewWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"JJTestTableViewHeaderFooterView";
    JJTestTableViewHeaderFooterView * HeaderFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if ( !HeaderFooterView )
    {
        HeaderFooterView = [[JJTestTableViewHeaderFooterView alloc] initWithReuseIdentifier:ID];
        [HeaderFooterView setupSubViews];
        HeaderFooterView.backgroundColor = [UIColor whiteColor];
    }
    
    return HeaderFooterView;
    
}

- (void)configJJTestTableViewHeaderFooterViewWithDic:(NSDictionary *)dic arrdata:(NSMutableArray *)arrData indexPath:(NSIndexPath *)indexPath
{
    self.titleLabel =dic[@"title"];
    self.subTitleLabel =dic[@"subTitle"];
    //case1
    [self.actionBtn setImage:[UIImage imageNamed:dic[@"imageName"]] forState:UIControlStateNormal];
    //case2
    [self.actionBtn setTitle:dic[@"btnTitle"] forState:UIControlStateNormal];
}

- (CGFloat)getHeaderFooterViewHeight
{
    return 0;
}

#pragma mark -private
- (void)setupSubViews
{
    UIView *superView =self.contentView;
    
    self.backView =[UIView MAGetUIViewWithBackgroundColor:[UIColor JJRandomColor] superView:superView masonrySet:^(UIView *currentView, MASConstraintMaker *make) {
        make.edges.equalTo(superView);
    }];
    
    
    self.titleLabel =[UILabel MAGetLabelWithFont:FONT(14) text:@"" textColor:[UIColor JJRandomColor] textAlignment:NSTextAlignmentLeft superView:superView masonrySet:^(UILabel *currentLabel, MASConstraintMaker *make) {
        make.left.equalTo(superView.mas_left).mas_offset(0);
        make.top.equalTo(superView.mas_top).mas_offset(0);
    }];
    
    self.subTitleLabel =[UILabel MAGetLabelWithFont:FONT(14) text:@"" textColor:[UIColor JJRandomColor] textAlignment:NSTextAlignmentLeft superView:superView masonrySet:^(UILabel *currentLabel, MASConstraintMaker *make) {
        make.left.equalTo(superView.mas_left).mas_offset(0);
        make.top.equalTo(superView.mas_top).mas_offset(0);
    }];
    
    //case 1 Image
    self.actionBtn =[UIButton MAGetButtonWithImage:@"" superView:superView target:self action:@selector(btnClickAction:) masonrySet:^(UIButton *currentBtn, MASConstraintMaker *make) {
        make.left.equalTo(superView.mas_left).mas_offset(0);
        make.top.equalTo(superView.mas_top).mas_offset(0);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
        
    }];
    
    //case 2  title
    self.actionBtn =[UIButton MAGetButtonWithTitle:@"" font:FONT(12) textColor:[UIColor whiteColor] backGroundColor:[UIColor whiteColor] corners:4 superView:superView target:self action:@selector(btnClickAction:) masonrySet:^(UIButton *currentBtn, MASConstraintMaker *make) {
        make.left.equalTo(superView.mas_left).mas_offset(0);
        make.top.equalTo(superView.mas_top).mas_offset(0);
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


#pragma mark -btnAction or delegate

- (void)btnClickAction:(UIButton*)sender
{
    
    
}

@end
