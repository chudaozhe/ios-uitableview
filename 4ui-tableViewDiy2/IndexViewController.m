//
//  IndexViewController.m
//  4ui-tableViewDiy2
//
//  Created by wei cui on 2019/11/16.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "IndexViewController.h"
#import "WB.h"
#import <MJExtension/MJExtension.h>
#import "WBViewCell.h"
@interface IndexViewController ()

//要加载的数据
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation IndexViewController
-(NSMutableArray *)data{
    if (_data==nil) {
          NSBundle *bundle=[NSBundle mainBundle];
          NSString *filepath=[bundle pathForResource:@"wb" ofType:@"plist"];
          //NSLog(@"bundle:%@", filepath);
          NSArray *dict=[NSArray arrayWithContentsOfFile:filepath];
          _data=[WB mj_objectArrayWithKeyValuesArray:dict];
          //for (Heroes *item in _groupCar) {
             //NSLog(@"title=%@", item.title);
          //}
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.rowHeight=200;
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}
//cellForRowAtIndexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WBViewCell *cell=[WBViewCell cellWithTableView:tableView];
    cell.wb=self.data[indexPath.row];
    //NSLog(@"%@", cell.wb);
    return cell;
}
/**
 设置cell的真实高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WB *wb=self.data[indexPath.row];
    return wb.cellHeight;
}
//每行的估计高度：用于性能优化，不设置的话 系统会先拿到所有cell的高度再渲染
//只要设置了 估计高度，就会先调用cellForRowAtIndexPath创建cell，再调用heightForRowAtIndexPath设置当前cell的实际高度
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
@end
