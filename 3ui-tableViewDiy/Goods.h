//
//  Goods.h
//  3ui-tableViewDiy
//
//  Created by wei cui on 2019/11/14.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Goods : NSObject

/** 备注 */
@property (nonatomic, strong) NSString *title;
/** 备注 */
@property (nonatomic, strong) NSString *icon;
/** 备注 */
@property (nonatomic, strong) NSString *price;
/** 备注 */
@property (nonatomic, strong) NSString *buyCount;
@end

NS_ASSUME_NONNULL_END
