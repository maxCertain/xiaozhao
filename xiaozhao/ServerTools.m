//
//  ServerTools.m
//  xiaozhao
//
//  Created by liicon on 2017/4/1.
//  Copyright © 2017年 max. All rights reserved.
//

#import "ServerTools.h"
#import "AFNetworking.h"

@implementation ServerTools

- (void)GET:(NSString *)api parameter:(NSDictionary *)paramaters callHandler:(void (^)(NSDictionary *))finishHandler{
    
    AFHTTPSessionManager *sessionManager = [self httpSessionManager];
    [sessionManager GET:api parameters:paramaters progress:^(NSProgress * _Nonnull downloadProgress) {
        if (self.progresBlock) {
            self.progresBlock(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finishHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)POST:(NSString *)api parameter:(NSDictionary *)paramaters callHandler:(void (^)(NSDictionary * para))finishHandler{
    AFHTTPSessionManager *sessionManager = [self httpSessionManager];
    [sessionManager POST:api parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        finishHandler(dict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (AFHTTPSessionManager *)httpSessionManager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return manager;
}

@end
