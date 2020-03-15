//
//  GoodsCell.h
//  3ui-tableViewDiy
//
//  Created by wei cui on 2019/11/14.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goods.h"
NS_ASSUME_NONNULL_BEGIN

@interface GoodsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyLabel;
/** 备注 */
@property (nonatomic, strong) Goods *goods;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
