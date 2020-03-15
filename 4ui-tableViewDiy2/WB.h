//
//  WB.h
//  4ui-tableViewDiy2
//
//  Created by wei cui on 2019/11/16.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WB : NSObject
/** 头像图片 */
@property (nonatomic, strong) NSString *header;
/** 昵称 */
@property (nonatomic, strong) NSString *name;
/** 是否vip */
@property (nonatomic, assign) NSNumber *vip;
/** 内容图片 */
@property (nonatomic, strong) NSString *picture;
/** 内容 */
@property (nonatomic, strong) NSString *content;
/** 每个cell高度 */
@property (nonatomic, assign) CGFloat cellHeight;
@end

NS_ASSUME_NONNULL_END
