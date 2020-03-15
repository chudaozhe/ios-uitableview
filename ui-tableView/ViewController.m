//
//  ViewController.m
//  ui-tableView
//
//  Created by wei cui on 2019/11/11.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"
#import "Cars.h"
#import "Car.h"
#import <MJExtension/MJExtension.h>
@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 备注 */
@property (nonatomic, strong) NSMutableArray *groupCar;
@end

@implementation ViewController
-(NSMutableArray *)groupCar{
    if (_groupCar==nil) {
          NSBundle *bundle=[NSBundle mainBundle];
          NSString *filepath=[bundle pathForResource:@"cars_total" ofType:@"plist"];
          //NSLog(@"bundle:%@", filepath);
          NSArray *dict=[NSArray arrayWithContentsOfFile:filepath];
          _groupCar=[Cars mj_objectArrayWithKeyValuesArray:dict];
          for (Cars *item in _groupCar) {
             NSLog(@"title=%@", item.title);
//              NSMutableArray *c2=[Car mj_objectArrayWithKeyValuesArray:item.cars];
//              for (Car *item in c2) {
//                  NSLog(@"name:%@ ,icon:%@", item.name, item.icon);
//              }
          }
    }
    return _groupCar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置数据源
    self.tableView.dataSource=self;
    self.tableView.rowHeight=60;//设置行高
    
    //注册某个标识对应的cell，仅限默认cell样式 UITableViewCellStyleDefault
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"a"];
    //分割线颜色
    //self.tableView.separatorColor=[UIColor redColor];
    //隐藏分割线
    //self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}
/**
 告诉tableview共有几组
 可选
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groupCar.count;
}
/**
 每组几行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Cars *group = self.groupCar[section];
    return group.cars.count;
}

// 根据分组，返回每个cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //第一组indexPath.section==0
    //第一行indexPath.row==0
    //UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];//非循环利用
    //重用标识
    if (indexPath.section %2 ==0) {
        return [self cell1:tableView cellForRowAtIndexPath:indexPath];
    }else return [self cell2:tableView cellForRowAtIndexPath:indexPath];
    
}
- (NSString *)tableViewBak:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"本次用不到..";
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Cars *cars =self.groupCar[section];
    return cars.title;
}
/**
 和cell2完全一样，除了id=a
 */
- (UITableViewCell *)cell1:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID=@"a";//被static修饰的局部变量只会初始化一次
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];//循环利用
    // 优化3，如果storyboard里设置了identifier, 即使viewDidLoad未注册，这块也可以不要
    //    if (cell==nil) {//如果在viewDidLoad注册，这里也可以不要
    //        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    //    }
    Cars *group = self.groupCar[indexPath.section];
    Car *car=[Car mj_objectArrayWithKeyValuesArray:group.cars][indexPath.row];
        
    NSLog(@"%@, rows=%zd, cell=%p", car.name, indexPath.row, cell);
    cell.textLabel.text=car.name;
    cell.imageView.image=[UIImage imageNamed:car.icon];
    //cell.detailTextLabel.text=@"ddd";
    //隐藏选择cell颜色
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    //设置选中颜色
    UIView *selectbg=[[UIView alloc] init];
    selectbg.backgroundColor=[UIColor redColor];
    cell.selectedBackgroundView=selectbg;
    //右侧指示器
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
/**
 和cell1完全一样，除了id=a2
 */
- (UITableViewCell *)cell2:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        static NSString *ID=@"a2";//被static修饰的局部变量只会初始化一次
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];//循环利用
    // 优化3，如果storyboard里设置了identifier, 即使viewDidLoad未注册，这块也可以不要
    //    if (cell==nil) {//如果在viewDidLoad注册，这里也可以不要
    //        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    //    }
        Cars *group = self.groupCar[indexPath.section];
        Car *car=[Car mj_objectArrayWithKeyValuesArray:group.cars][indexPath.row];
        
        NSLog(@"%@, rows=%zd, cell=%p", car.name, indexPath.row, cell);
        cell.textLabel.text=car.name;
        cell.imageView.image=[UIImage imageNamed:car.icon];
        //cell.detailTextLabel.text=@"ddd";
        
        return cell;
}
@end
