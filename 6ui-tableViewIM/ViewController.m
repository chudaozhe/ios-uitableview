//
//  ViewController.m
//  6ui-tableViewIM
//
//  Created by wei cui on 2019/11/17.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"
#import <MJExtension/MJExtension.h>
#import "MessageCell.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


//要加载的数据
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation ViewController
-(NSMutableArray *)data{
    if (_data==nil) {
          NSBundle *bundle=[NSBundle mainBundle];
          NSString *filepath=[bundle pathForResource:@"messages" ofType:@"plist"];
          //NSLog(@"bundle:%@", filepath);
          NSArray *dict=[NSArray arrayWithContentsOfFile:filepath];
          _data=[Message mj_objectArrayWithKeyValuesArray:dict];
          for (Message *item in _data) {
             NSLog(@"title=%@", item.time);
          }
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.tableView.rowHeight=120;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%zd", self.data.count);
    return self.data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell *cell=[MessageCell cellWithTableView:tableView];
    cell.message=self.data[indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
/**
 设置cell的真实高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Message *message=self.data[indexPath.row];
    return message.cellHeight;
}
//每行的估计高度
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}
@end
