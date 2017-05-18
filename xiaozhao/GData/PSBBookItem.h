//
//  PSBBookItem.h
//  day-31-XMLAnalysis
//
//  Created by 潘松彪 on 14-9-25.
//  Copyright (c) 2014年 PSB. All rights reserved.
//

#import <Foundation/Foundation.h>


/**书的数据模型，存储一本书的信息*/
@interface PSBBookItem : NSObject

@property (copy, nonatomic) NSString * ID;
@property (copy, nonatomic) NSString * language;
@property (copy, nonatomic) NSString * autherName;
@property (copy, nonatomic) NSString * price;
@property (copy, nonatomic) NSString * summary;
@property (copy, nonatomic) NSString * name;

@property (copy, nonatomic) NSString * size;
@property (copy, nonatomic) NSString * lastmodified;

@end








