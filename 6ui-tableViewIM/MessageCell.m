//
//  MessageCell.m
//  6ui-tableViewIM
//
//  Created by wei cui on 2019/11/17.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "MessageCell.h"
#import "Message.h"
#define MAS_SHORTHAND //定义这个宏就不用加mas_前缀
//#define MAS_SHORTHAND_GLOBALS //自动包装
#import <Masonry/Masonry.h>
@implementation MessageCell
+(instancetype)cellWithTableView:(UITableView *)tableView {
    //NSLog(@"当前类名：%@", NSStringFromClass(self));
    static NSString *ID=@"message";
    MessageCell *cell= [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
    }
    return cell;
}
-(void)setMessage:(Message *)message
{
    _message=message;
    self.timeLabel.text=message.time;
    [self.contentLabel setTitle:message.content forState:UIControlStateNormal];
    
    //强制更新
    [self.contentLabel layoutIfNeeded];
    
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        CGFloat buttonH=self.contentLabel.titleLabel.frame.size.height+10;
        make.height.mas_equalTo(buttonH);
    }];
    //再次强制更新
    [self.contentLabel layoutIfNeeded];
    
    //计算cell的高度
    CGFloat buttonMaxY=CGRectGetMaxY(self.contentLabel.frame);//文本内容高度
    CGFloat headerMaxY=CGRectGetMaxY(self.headerView.frame);//头像高度
    message.cellHeight=MAX(buttonMaxY, headerMaxY)+30;//求两个的最大值，即cell的高度
}
//一次性设置
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentLabel.titleLabel.numberOfLines=0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
