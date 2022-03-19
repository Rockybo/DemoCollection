//
//  LRUCache.cpp
//  C++学习
//
//  Created by libolin on 2022/3/19.
//

#include <stdio.h>
#include <unordered_map>

using namespace std;

struct DLinkedNode {
    int key, value;
    DLinkedNode *prev;
    DLinkedNode *next;
    DLinkedNode():key(0), value(0), prev(nullptr), next(nullptr) {}
    DLinkedNode(int _key, int _value):key(_key), value(_value), prev(nullptr), next(nullptr) {}
};

class LRUCache {
private:
    unordered_map<int, DLinkedNode *> cache;
    DLinkedNode *head;
    DLinkedNode *tail;
    int size;
    int capacity;
    
public:
    LRUCache(int _capacity):capacity(_capacity), size(0) {
        head = new DLinkedNode();
        tail = new DLinkedNode();
        
        head->next = tail;
        tail->prev = head;
    }
    
    int get(int key) {
        if (!cache.count(key)) {
            return -1;
        }
        
        DLinkedNode *node = cache[key];
        // 移动到队头
        moveToHead(node);
        return node->value;
    }
    
    void put(int key, int value) {
        if (!cache.count(key)) {
            DLinkedNode *node = new DLinkedNode(key, value);
            cache[key] = node;
            // 添加到队头
            addToHead(node);
            ++size;
            if (size > capacity) {
                DLinkedNode *removed = removeTail();
                cache.erase(removed->key);
                delete removed;
                --size;
            }
        } else {
            DLinkedNode *node = cache[key];
            node->value = value;
            moveToHead(node);
        }
    }
    
    void addToHead(DLinkedNode *node) {
        node->prev = head;
        node->next = head->next;
        head->next->prev = node;
        head->next = node;
    }
    
    void removeNode(DLinkedNode *node) {
        node->prev->next = node->next;
        node->next->prev = node->prev;
    }
    
    void moveToHead(DLinkedNode *node) {
        removeNode(node);
        addToHead(node);
    }
    
    DLinkedNode * removeTail() {
        DLinkedNode *node = tail->prev;
        removeNode(node);
        return node;
    }
    
};

/**
 LRUCache *lRUCache = new LRUCache(2);
 lRUCache->put(1, 1); // 缓存是 {1=1}
 lRUCache->put(2, 2); // 缓存是 {1=1, 2=2}
 int a = lRUCache->get(1);    // 返回 1
 
 lRUCache->put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
 int b = lRUCache->get(2);    // 返回 -1 (未找到)

 lRUCache->put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
 int c = lRUCache->get(1);    // 返回 -1 (未找到)
 int d = lRUCache->get(3);    // 返回 3
 int e = lRUCache->get(4);    // 返回 4
 
 cout<< "a = " << a << " b = " << b << " c = " << c << " d = "<< d << " e = "<< e <<endl;
 // a = 1 b = -1 c = -1 d = 3 e = 4
 
 */
