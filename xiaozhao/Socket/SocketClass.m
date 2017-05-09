//
//  SocketClass.m
//  xiaozhao
//
//  Created by liicon on 2017/4/27.
//  Copyright © 2017年 max. All rights reserved.
//

#import "SocketClass.h"
#import <CocoaAsyncSocket/GCDAsyncUdpSocket.h>

@interface SocketClass ()<GCDAsyncUdpSocketDelegate>

@property(strong, nonatomic) GCDAsyncUdpSocket *udpSocket;

@end

@implementation SocketClass


- (instancetype)init{
    if (self = [super init]) {
        self.udpSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    return self;
}

- (BOOL)send:(NSString *)msg ipAddress:(NSString *)ip port:(int)pot{
    
    
    return true;
}

@end
