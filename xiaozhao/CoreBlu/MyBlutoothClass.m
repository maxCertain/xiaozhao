//
//  MyBlutoothClass.m
//  xiaozhao
//
//  Created by liicon on 2017/4/27.
//  Copyright © 2017年 max. All rights reserved.
//

#import "MyBlutoothClass.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface MyBlutoothClass ()<CBCentralManagerDelegate>

//中心管理者，发起连接
@property(strong, nonatomic) CBCentralManager *centralMg;

//外设
@property(strong, nonatomic) CBPeripheral *peripheral;

@end

@implementation MyBlutoothClass

- (void)startManager{
    
    [self manager];
    
}

- (CBCentralManager *)manager{
    if (!self.centralMg) {
        self.centralMg = [[CBCentralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue()];
        self.centralMg.delegate = self;
    }else{
        [self.centralMg scanForPeripheralsWithServices:nil options:nil];
    }
    return self.centralMg;
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    
    /*
    CBManagerStateUnknown = 0,
    CBManagerStateResetting,
    CBManagerStateUnsupported,
    CBManagerStateUnauthorized,
    CBManagerStatePoweredOff,
    CBManagerStatePoweredOn,
     */
    
    switch (central.state) {
        case CBManagerStateUnknown:
            NSLog(@"UnKbown");
            break;
        case CBManagerStateResetting:
            NSLog(@"reseting central");
            break;
        case CBManagerStateUnsupported:
            NSLog(@"bluetooth don't support");
            break;
        case CBManagerStatePoweredOff:
            NSLog(@"bluetooth is off");
            break;
        case CBManagerStatePoweredOn:
            [self.centralMg scanForPeripheralsWithServices:nil options:nil];
            break;
        default:
            break;
    }

}

// 搜索成功之后,会调用我们找到外设的代理方法
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI{
    NSLog(@"%@",advertisementData);
}

@end
