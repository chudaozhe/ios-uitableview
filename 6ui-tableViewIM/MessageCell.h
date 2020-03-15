//
//  MessageCell.h
//  6ui-tableViewIM
//
//  Created by wei cui on 2019/11/17.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerView;
/** message数据赋值 */
@property (nonatomic, strong) Message *message;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
