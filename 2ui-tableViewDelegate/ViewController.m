//
//  ViewController.m
//  2ui-tableViewDelegate
//
//  Created by wei cui on 2019/11/13.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"
#import "Heroes.h"
#import <MJExtension/MJExtension.h>

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
/** tableView */
@property (nonatomic, strong) UITableView *tableView;
//要加载的数据
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation ViewController
-(NSMutableArray *)data{
    if (_data==nil) {
          NSBundle *bundle=[NSBundle mainBundle];
          NSString *filepath=[bundle pathForResource:@"heroes" ofType:@"plist"];
          //NSLog(@"bundle:%@", filepath);
          NSArray *dict=[NSArray arrayWithContentsOfFile:filepath];
          _data=[Heroes mj_objectArrayWithKeyValuesArray:dict];
          //for (Heroes *item in _groupCar) {
             //NSLog(@"title=%@", item.title);
          //}
    }
    return _data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleInsetGrouped];
    self.tableView.frame=self.view.bounds;
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    //self.tableView.rowHeight=100;
    [self.view addSubview:self.tableView];
}
/**
 几组，可选
 */
- (IBAction)update:(id)sender {
}
- (IBAction)ff:(id)sender {
}
- (IBAction)update:(id)sender {
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}/**
 总条数
 */
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}
/**
 给cell赋值
 */
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    Heroes *heroes=self.data[indexPath.row];
    cell.textLabel.text=heroes.name;
    cell.imageView.image=[UIImage imageNamed:heroes.icon];
    cell.detailTextLabel.text=heroes.intro;
    return cell;
}
//点击某个celld时调用
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Heroes *heroes=self.data[indexPath.row];
    
    NSLog(@"点击了：%@", heroes.name);
}
//取消选中某一行调用
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Heroes *heroes=self.data[indexPath.row];
    NSLog(@"点击后离开了：%@", heroes.name);
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row %2) {
        return 60;
    }
    return 40;
}
//组头部 高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}
//组头部 文字
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"组头部";
}
//组头部 控件
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return [UIButton buttonWithType:UIButtonTypeContactAdd];
//}
//tableview的滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"---%@", scrollView);
}

@end
