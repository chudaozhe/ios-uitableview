//
//  WBViewCell.m
//  4ui-tableViewDiy2
//
//  Created by wei cui on 2019/11/16.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "WBViewCell.h"
@implementation WBViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView {
    //NSLog(@"当前类名：%@", NSStringFromClass(self));
    static NSString *ID=@"wb";
    WBViewCell *cell= [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
    }
    return cell;
}
-(void)setWb:(WB *)wb
{
    _wb=wb;
    NSLog(@"header:%@",wb.header);
    NSLog(@"name:%@", wb.name);
    self.headerView.image=[UIImage imageNamed:wb.header];
    self.nameLabel.text=wb.name;
    if ([wb.vip isEqualToNumber:@1]) self.isVipView.image=[UIImage imageNamed:@"vip"];
    self.contentLabel.text=wb.content;
    if (nil!=wb.picture) self.pictureView.image=[UIImage imageNamed:wb.picture];
    
    //强制布局
    [self layoutIfNeeded];
    //计算cell的高度
    if (nil==wb.picture) {
        wb.cellHeight=CGRectGetMaxY(self.contentLabel.frame)+10;
    }else wb.cellHeight=CGRectGetMaxY(self.pictureView.frame)+10;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    //设置contentLabel最大宽度
    self.contentLabel.preferredMaxLayoutWidth=[UIScreen mainScreen].bounds.size.width -20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
