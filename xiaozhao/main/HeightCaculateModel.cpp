//
//  HeightCaculateModel.cpp
//  xiaozhao
//
//  Created by liicon on 2017/4/26.
//  Copyright © 2017年 max. All rights reserved.
//

#include "HeightCaculateModel.hpp"

int * Caculate::sortDate(int list[], size_t length){
    
    int array[length];
    for (int i = 0; i < length; i ++) {
        array[i] = list[length - i - 1];
    }
    
    list = array;
    return list;
}


/**
 冒泡排序

 @param list   数组
 @param length 长度

 @return 返回数组
 */
std::string  Caculate::bubbleSort(int list[], size_t length){
    
    int temp;
    for (int i = 0; i < length - 1; i ++) {
        for (int j = 0; j < length - 1 - i; j ++ ) {
            if (list[j] > list[j + 1]) {
                temp = list[j];
                list[j] = list[j + 1];
                list[j + 1] = temp;
            }
        }
    }
    
    std::string apendStr;
    
    for (int i = 0; i < length; i++) {
        std::string str;
        char ch[10];
        sprintf(ch, "%d", list[i]);
        str = ch;
        apendStr += (str + ",");
    }
    apendStr = apendStr.substr(0,apendStr.length() - 1);
    return apendStr;
}
