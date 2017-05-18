//
//  MainWeatherViewController.m
//  xiaozhao
//
//  Created by liicon on 2017/4/1.
//  Copyright © 2017年 max. All rights reserved.
//

#import "MainWeatherViewController.h"
#import "ServerTools.h"
#import "WeatherDetailViewController.h"
#import "MyBlutoothClass.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface MainWeatherViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSArray *dataSource;

//中心管理者，发起连接
@property(strong, nonatomic) CBCentralManager *centralMg;

//外设
@property(strong, nonatomic) CBPeripheral *peripheral;

@property(strong, nonatomic) MyBlutoothClass *blutooth;


@end

@implementation MainWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemEvents:)];

    
//    [self setTableView];
    // Do any additional setup after loading the view.
}

- (void)setView{
    
}

- (void)rightItemEvents:(UIBarButtonItem *)item{
    if (!self.blutooth) {
        _blutooth = [[MyBlutoothClass alloc] init];
         [_blutooth startManager];
    }
}

- (void)setTableView{
    
    CGSize screeSize = [UIScreen mainScreen].bounds.size;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screeSize.width, screeSize.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:[WeatherDetailViewController new] animated:YES];
    self.hidesBottomBarWhenPushed = false;
    
//    NSString *api = @"http://127.0.0.1:8080/test/task/custom";
//    ServerTools *serverTools = [[ServerTools alloc] init];
//    [serverTools POST:api parameter:@{@"name":@(23),@"ssd":@"sdfs"} callHandler:^(NSDictionary * para) {
//        NSLog(@"%@",para);
//    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews{
    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
