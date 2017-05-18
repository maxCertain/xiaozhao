//
//  XmlAnalysis.h
//  iApp
//
//  Created by liicon on 16/5/25.
//  Copyright © 2016年 liicon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"
#import "PSBBookItem.h"

@interface XmlAnalysis : NSObject

@property (nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic, strong) NSString *dataString;
@property(nonatomic, strong) NSMutableDictionary *fileDictionary;

- (NSMutableArray *)diGuiAnalysis;

- (void)getRADataObjectWithDict:(NSDictionary *)dict;

@end
