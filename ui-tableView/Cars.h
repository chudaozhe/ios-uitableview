//
//  Cars.h
//  ui-tableView
//
//  Created by wei cui on 2019/11/12.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cars : NSObject
/** 组title */
@property (nonatomic, strong) NSString *title;
/** car列表  */
@property (nonatomic, strong) NSArray *cars;
@end

NS_ASSUME_NONNULL_END
