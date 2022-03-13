//
//  unordered_map_demo.cpp
//  C++学习
//
//  Created by libolin on 2022/3/12.
//

#include "unordered_map_demo.hpp"
#include <unordered_map>
#include <string>
#include <iostream>

using namespace std;

void examples1 ()
{
    unordered_map<string, double> mymap{
        {"milk", 2.0},
        {"flour", 1.5}
    };
    
    // 向容器中添加新键值对，效率比 insert() 方法高。
    mymap.emplace("andy", 4.0);
    mymap.emplace_hint(mymap.begin(), "nike", 8.9);
    mymap.emplace("andy", 4.0);
    cout << "mymap size" << mymap.size() << endl;
    cout << "============= "<< endl;

    for (auto it = mymap.begin(); it != mymap.end(); ++it) {
        cout << it -> first << " " << it -> second <<endl;
    }
    cout << "============= "<< endl;

    auto it = mymap.find("nike");
    cout << "find nike: " << it -> first << endl;
    
    mymap.erase(it);
    
    cout << "============= "<< endl;
    for (auto it = mymap.begin(); it != mymap.end(); ++it) {
        cout << it -> first << " " << it -> second <<endl;
    }
    
    auto it1 = mymap.at("andy");
    cout << "it1: "<< it1 << endl;

}

