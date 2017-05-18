//
//  XmlAnalysis.m
//  iApp
//
//  Created by liicon on 16/5/25.
//  Copyright © 2016年 liicon. All rights reserved.
//

#import "XmlAnalysis.h"

@implementation XmlAnalysis
{
    NSString *_name;
}


- (instancetype)init
{
    if (self = [super init]) {
        _dataArray = [[NSMutableArray alloc] init];
        _fileDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

//解析，使用Xpath语法
//xml解析
#pragma mark - 读取数据
//从文件中读取数据
- (void)readDataFromFile
{
    //获取文件路径
    NSString * path = [[NSBundle mainBundle] pathForResource:@"9" ofType:@""];
    //读取文件内容，生成字符串
    _dataString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
}


#pragma mark - Xml解析

-(NSMutableArray *)diGuiAnalysis
{
    if (_dataArray) {
        [_dataArray removeAllObjects];
    }
    //创建节点树
    GDataXMLDocument * doc = [[GDataXMLDocument alloc] initWithXMLString:_dataString options:0 error:nil];
    //从节点树中获取根节点/根元素
    GDataXMLElement * rootElement = doc.rootElement;
    NSArray * fileSubElements = [rootElement elementsForName:@"wpt"];
    GDataXMLElement *element = fileSubElements[0];
    GDataXMLNode *node = [element attributeForName:@"lat"];
    [node setStringValue:@"dsfa"];
    
    NSArray * folderSubElements = [rootElement elementsForName:@"xmlns"];
    NSString *newXml = [NSString stringWithFormat:@"%@",doc];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Testing.gpx" ofType:@".gpx"];
    BOOL result = [newXml writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@",NSHomeDirectory());
    NSString *newPath = [NSString stringWithFormat:@"%@/Testing.gpx",NSHomeDirectory()];
    [@"eqreq" writeToFile:newPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    return _dataArray;
}
-(void)analysisWithElement:(GDataXMLElement *)element with:(NSMutableArray *)array
{
    NSMutableArray *mutArray = [[NSMutableArray alloc] init];
    NSArray * fileSubElements = [element elementsForName:@"file"];
    NSArray * folderSubElements = [element elementsForName:@"folder"];
    if (fileSubElements.count>0) {
        for (int i = 0; i<fileSubElements.count; i++) {
            
            GDataXMLElement * file = fileSubElements[i];
            PSBBookItem * item = [[PSBBookItem alloc]init];
            item.name = [self valueOfAttributeWithName:@"wpt" inElement:file];
            item.lastmodified = [self valueOfAttributeWithName:@"lastmodified" inElement:file];
            if ([item.name isEqualToString:@"Desktop.ini"]) {
                continue;
            }
        }
    }
    if (folderSubElements.count >0) {
        for (int i = 0; i<folderSubElements.count; i++) {
            GDataXMLElement * folder = folderSubElements[i];
            [self analysisWithElement:folder with:mutArray];
        }
    }
    _name = [self valueOfAttributeWithName:@"name" inElement:element];
    
}

//获取节点属性的值
- (NSString *)valueOfAttributeWithName:(NSString *)attributeName inElement:(GDataXMLElement *)element
{
    //获取属性
    GDataXMLNode *  node = [element attributeForName:attributeName];
    //返回属性的值
    return node.stringValue;
}
//获取子节点
- (NSString *)valueOfSubElementWithName:(NSString *)subElementName inElement:(GDataXMLElement *)element
{
    //找到子节点
    GDataXMLElement * subElement = [[element elementsForName:subElementName] lastObject];
    //返回子节点值
    return subElement.stringValue;
}

@end
