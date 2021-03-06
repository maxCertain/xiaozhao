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
#import "AnimationTestView.h"
#import <QuartzCore/QuartzCore.h>
#import <malloc/malloc.h>
#import "ChangeLocationViewController.h"

@interface WeatherDetailViewController ()

@property(nonatomic, strong) AnimationTestView *testView;

@end

@implementation WeatherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    ChangeLocationViewController *vc = [[ChangeLocationViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
//    [[self creatView] showInView:self.view];
    
//    [[self creatView] setNeedsDisplay];
    
}

- (AnimationTestView *)creatView{
    
//    if (self.testView == nil) {
        self.testView = [[AnimationTestView alloc] init];
        self.testView.frame = CGRectMake(0, 0, 100, 100);
        self.testView.backgroundColor = [UIColor redColor];
//    }
    return self.testView;
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
