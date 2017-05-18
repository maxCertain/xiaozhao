//
//  ChangeLocationViewController.m
//  xiaozhao
//
//  Created by liicon on 2017/5/12.
//  Copyright © 2017年 max. All rights reserved.
//

#import "ChangeLocationViewController.h"
#import "XmlAnalysis.h"

@interface ChangeLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *latiTextField;
@property (weak, nonatomic) IBOutlet UITextField *logiTextField;

@end

@implementation ChangeLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Testing.gpx" ofType:@""];
    NSString *xmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"local = %@",xmlString);
 
    XmlAnalysis *xmlAnalysis = [[XmlAnalysis alloc] init];
    xmlAnalysis.dataString = xmlString;
    NSDictionary *data = [xmlAnalysis diGuiAnalysis];
    NSLog(@"%@",data);
}

- (IBAction)sureBtnEvents:(UIButton *)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Testing.gpx" ofType:@""];
    [@"dfadfa" writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
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
