//
//  StudentClass.hpp
//  xiaozhao
//
//  Created by liicon on 2017/4/26.
//  Copyright © 2017年 max. All rights reserved.
//

#ifndef StudentClass_hpp
#define StudentClass_hpp

#include <iostream>
#include <stdio.h>
#include <string>

class MyStudent {
    
    
public:
    int age;
    std::string name;
    
    static void showStudentName();
    void showAge();
    int *bubbleSort(int list[],size_t length);
    int *getList();
};

#endif /* StudentClass_hpp */
