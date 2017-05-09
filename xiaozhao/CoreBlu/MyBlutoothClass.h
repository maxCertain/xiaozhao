//
//  MyBlutoothClass.h
//  xiaozhao
//
//  Created by liicon on 2017/4/27.
//  Copyright © 2017年 max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyBlutoothClass : NSObject

@property(copy, nonatomic) void(^getBluetoothBlock)(NSArray *bluetooth);
- (void)startManager;
@end
