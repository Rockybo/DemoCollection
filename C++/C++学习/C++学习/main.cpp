//
//  main.cpp
//  C++学习
//
//  Created by libolin on 2022/3/12.
//

#include <iostream>
#include <unordered_map>
#include "unordered_map_demo.hpp"
#include "ListNode_delete_last_n.hpp"
using namespace std;

int main(int argc, const char * argv[]) {
    // insert code here...
//    std::cout << "Hello, World!\n";
//
//    examples1();
//
//    unordered_map<int, int> mymap{
//        {1, 2}
//    };
//
//    mymap[1] = 4;
//
//    for (auto it = mymap.begin(); it != mymap.end(); ++it) {
//        cout << it->first << it -> second << endl;
//    }
//    test();
    LFUCache *lfu = new LFUCache(2);
    lfu->put(1, 1);   // cache=[1,_], cnt(1)=1
    lfu->put(2, 2);
    
    lfu->get(1); // 1
    
    lfu->put(3, 3);
    
    
    lfu->get(2); // -1

    
    return 0;
}


