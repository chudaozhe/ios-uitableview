//
//  CWIndexViewController.m
//  3ui-tableViewDiy
//
//  Created by wei cui on 2019/11/14.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "CWIndexViewController.h"
#import "Goods.h"
#import <MJExtension/MJExtension.h>
#import "GoodsCell.h"

@interface CWIndexViewController ()

//要加载的数据
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation CWIndexViewController
-(NSMutableArray *)data{
    if (_data==nil) {
          NSBundle *bundle=[NSBundle mainBundle];
          NSString *filepath=[bundle pathForResource:@"goods" ofType:@"plist"];
          //NSLog(@"bundle:%@", filepath);
          NSArray *dict=[NSArray arrayWithContentsOfFile:filepath];
          _data=[Goods mj_objectArrayWithKeyValuesArray:dict];
          //for (Heroes *item in _groupCar) {
             //NSLog(@"title=%@", item.title);
          //}
    }
    return _data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight=70;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GoodsCell *cell=[GoodsCell cellWithTableView:tableView];
    cell.goods=self.data[indexPath.row];
    return cell;
}



@end
