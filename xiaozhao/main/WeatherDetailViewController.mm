//
//  WeatherDetailViewController.m
//  xiaozhao
//
//  Created by liicon on 2017/4/26.
//  Copyright © 2017年 max. All rights reserved.
//

#import "WeatherDetailViewController.h"
#import "StudentClass.hpp"
#import "DataClass.h"
#import "HeightCaculateModel.hpp"
#import "RequestClass.hpp"

@interface WeatherDetailViewController ()

@end

@implementation WeatherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyRequestClass request;
    request.sendGetRequest();
    
    MyStudent::showStudentName();
    
    MyStudent xiaohua;
    xiaohua.name = "xiaohua";
    xiaohua.age = 15;
    
    MyStudent *xiaofang = new MyStudent();
    xiaofang->age = 15;
    xiaofang->name = "xiaofang";
    
    MyStudent xiaoming = *new MyStudent();
    xiaoming.age = 10;
    xiaoming.name = "xiaoming";

    [self showName:xiaofang];
    [self showOtherName:xiaohua];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    size_t length = 10000;
    int list[length];
    NSMutableArray *listArray = [NSMutableArray array];
    for (int i = 0; i < length; i ++) {
        int num = (rand()%1001);
        list[i] = num;
        [listArray addObject:@(num)];
    }
    
    Caculate caculate;
//
//    NSLog(@"count is %li",array.count);
    
    NSLog(@"time is");
    
//    NSArray *array = [self bubbleSort:listArray];
    
    std::string str = caculate.bubbleSort(list, length);
    NSString *arrayString = [NSString stringWithFormat:@"%s",str.c_str()];
    NSArray *array = [arrayString componentsSeparatedByString:@","];
    NSLog(@"%li",array.count);
    NSLog(@"time is");
    
    
    
    self.navigationItem.title = @"未来七日";
    
    // Do any additional setup after loading the view.
}

- (void)getLocalHost{
    
}


- (void)showName:(MyStudent *)student{
    
    std::cout << student->name << std::endl;
}

- (void)showOtherName:(MyStudent)student{
    std::cout << student.name << std::endl;
}

-(NSArray *)bubbleSort:(NSMutableArray *)array{
    
    int i, y; BOOL bFinish = YES;
    for (i = 1; i<= [array count] && bFinish; i++) {
        
        bFinish = NO;
        for (y = (int)[array count]-1; y>=i; y--) {
            if ([[array objectAtIndex:y] intValue] < [[array objectAtIndex:y-1] intValue]) {
                [array exchangeObjectAtIndex:y-1 withObjectAtIndex:y];
                bFinish = YES;
            }
        }
    }
    
    return array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
