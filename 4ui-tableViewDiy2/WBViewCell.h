//
//  WBViewCell.h
//  4ui-tableViewDiy2
//
//  Created by wei cui on 2019/11/16.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WB.h"
NS_ASSUME_NONNULL_BEGIN

@interface WBViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *isVipView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;

/** wb数据赋值 */
@property (nonatomic, strong) WB *wb;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
