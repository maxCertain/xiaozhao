//
//  ServerTools.h
//  xiaozhao
//
//  Created by liicon on 2017/4/1.
//  Copyright © 2017年 max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerTools : NSObject

@property(nonatomic, copy) void(^progresBlock)(NSProgress *progress);

- (void)GET:(NSString *)api parameter:(NSDictionary *)paramaters callHandler:(void(^)(NSDictionary *response))finishHandler;

- (void)POST:(NSString *)api parameter:(NSDictionary *)paramaters callHandler:(void (^)(NSDictionary * para))finishHandler;

@end
