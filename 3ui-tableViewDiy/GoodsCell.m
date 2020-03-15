//
//  GoodsCell.m
//  3ui-tableViewDiy
//
//  Created by wei cui on 2019/11/14.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "GoodsCell.h"
#import "Goods.h"
@implementation GoodsCell
+(instancetype)cellWithTableView:(UITableView *)tableView {
    //NSLog(@"当前类名：%@", NSStringFromClass(self));
    static NSString *ID=@"goods";
    GoodsCell *cell= [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
    }
    return cell;
}
-(void)setGoods:(Goods *)goods
{
    _goods=goods;
    self.iconView.image=[UIImage imageNamed:goods.icon];
    self.titleLabel.text=goods.title;
    self.priceLabel.text=[NSString stringWithFormat:@"¥%@", goods.price];
    self.buyLabel.text=[NSString stringWithFormat:@"%@人购买", goods.buyCount];;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
