//
//  ViewController.m
//  5ui-tableViewData
//
//  Created by wei cui on 2019/11/17.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"
#import "T.h"
#import <MJExtension/MJExtension.h>
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//要加载的数据
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation ViewController
-(NSMutableArray *)data{
    if (_data==nil) {
          NSBundle *bundle=[NSBundle mainBundle];
          NSString *filepath=[bundle pathForResource:@"t" ofType:@"plist"];
          //NSLog(@"bundle:%@", filepath);
          NSArray *dict=[NSArray arrayWithContentsOfFile:filepath];
          _data=[T mj_objectArrayWithKeyValuesArray:dict];
          //for (Heroes *item in _groupCar) {
             //NSLog(@"title=%@", item.title);
          //}
    }
    return _data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)add:(id)sender {
    //UIAlertView 已过时的
    NSLog(@"xx");
    //UIAlertControllerStyleActionSheet 底部弹出，不支持文本输入
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"请输入" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSString *name=[alert.textFields[0] text];
        NSLog(@"name:%@", name);
        T *t= [[T alloc] init];
        t.name=name;
        [self.data insertObject:t atIndex:0];
        [self.tableView reloadData];
    }]];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder=@"请输入name:";
    }];
    [self presentViewController:alert animated:YES completion:nil];
    /*
    T *t= [[T alloc] init];
    t.name=[NSString stringWithFormat:@"测试%d", arc4random_uniform(50)];
    //[self.data addObject:t];//末尾
    [self.data insertObject:t atIndex:0];//首位
    //[self.tableView reloadData];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation: UITableViewRowAnimationLeft];
     */
}
//刷新特定行
- (IBAction)update:(id)sender {
    T *t=self.data[0];
    t.name=[NSString stringWithFormat:@"xx%d", arc4random_uniform(50)];
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}

- (IBAction)remove:(id)sender {
    //一次删2个
    [self.data removeObjectAtIndex:0];
    [self.data removeObjectAtIndex:0];
    //[self.tableView reloadData];
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0], [NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    T *t = self.data[indexPath.row];
    cell.textLabel.text=t.name;
    //cell.imageView.image=[UIImage imageNamed:car.icon];
    return cell;
}
/**
 代理方法，侧滑
 */
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self.data removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }else if(editingStyle==UITableViewCellEditingStyleInsert) {
        NSLog(@"add");
    }
    
}
@end
