//
//  Message.h
//  6ui-tableViewIM
//
//  Created by wei cui on 2019/11/17.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    MessageMe=0,
    MessageOther=1
} MessageType;
@interface Message : NSObject
/** 备注 */
@property (nonatomic, strong) NSString *content;
/** 备注 */
@property (nonatomic, strong) NSString *time;
/** 角色 */
@property (nonatomic, assign) MessageType type;

/** 每个cell高度 */
@property (nonatomic, assign) CGFloat cellHeight;
@end

NS_ASSUME_NONNULL_END
