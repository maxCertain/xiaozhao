//
//  StudentClass.cpp
//  xiaozhao
//
//  Created by liicon on 2017/4/26.
//  Copyright © 2017年 max. All rights reserved.
//

#include "StudentClass.hpp"

void MyStudent::showStudentName(){
    printf("xiaohua\n");
}

void MyStudent::showAge(){
    std::cout << "15\n";
}

int * MyStudent::bubbleSort(int list[], size_t length){
    
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
    
    return list;
}

int * MyStudent::getList(){
    size_t length = 100000;
    int list[length];
    for (int i = 0; i < length; i ++) {
        int num = (rand()%1001);
        list[i] = num;
    }
    return list;
}
