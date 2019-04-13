//
//  main.m
//  OCPrinciple
//
//  Created by libolin on 2019/4/12.
//  Copyright © 2019 libolin. All rights reserved.
//


// https://blog.csdn.net/forwardto9/article/details/78964453

#import <Foundation/Foundation.h>
#import "BLClassInfo.h"
#import <objc/runtime.h>
/**
 内存对齐：
 
 */
//struct StructOne {
//    char a; // 1     +7
//    double b; // 8
//    int c;  // 4     +4
//    short d; // 2
//} MyStruct1; //24
//
//struct StructTwo {
//    double b; // 8
//    char a; // 1
//    short d; // 2
//    int c; // 4
//} MyStruct2;  //16

// 只是交换了ab位置，大小就不一样了


/** Person */
@interface Person : NSObject<NSCopying>
{
@public
    int _age;
}
@property (nonatomic, assign) int no;
- (void)personInstanceMethod;
+ (void)personClassMethod;
@end

@implementation Person
- (void)test {}

- (void)personInstanceMethod {}

+ (void)personClassMethod {}

- (id)copyWithZone:(NSZone *)zone {
    return nil;
}
@end

/** Sudent */
@interface Student : Person <NSCoding> {
@public
    int _weight;
}
@property (nonatomic, assign) int height;
- (void)studentInstanceMethod;
+ (void)studentClassMethod;
@end

@implementation Student
- (void)test {}

- (void)studentInstanceMethod {}

+ (void)studentClassMethod {}

- (id)initWithCoder:(NSCoder *)aDecoder {
    return nil;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 0x00007ffffffffff8  ISA_MASK
        
        // 实例对象
        NSObject *object = [[NSObject alloc] init];
        Person *person = [[Person alloc] init];
        Student *student = [[Student alloc] init];
        
        // 类对象
        bl_objc_class *objectClass = (__bridge bl_objc_class *)[NSObject class];
        bl_objc_class *personClass = (__bridge bl_objc_class *)[Person class];
        bl_objc_class *studentClass = (__bridge bl_objc_class *)[Student class];
        
        bl_objc_class *objectMetaClass = objectClass->metaClass();
        bl_objc_class *personMetaClass = personClass->metaClass();
        bl_objc_class *studentMetaClass = studentClass->metaClass();
        
        // 类对象的数据
        class_rw_t *objectClassData = objectClass->data();
        class_rw_t *personClassData = personClass->data();
        class_rw_t *studentClassData = studentClass->data();
        
        class_rw_t *objectMetaClassData = objectMetaClass->data();
        class_rw_t *personMetaClassData = personMetaClass->data();
        class_rw_t *studentMetaClassData = studentMetaClass->data();
        
        NSLog(@"%p %p %p %p %p %p %p %p %p", object, person, student,objectClassData, personClassData, studentClassData, objectMetaClassData, personMetaClassData, studentMetaClassData);
        
        
//        NSLog(@"person %zd", class_getInstanceSize([Person class]));
//        NSLog(@"stu %zd", class_getInstanceSize([Student class]));
        
//        NSObject *obj = [[NSObject alloc] init];
//        Class objClass = [NSObject class];
//        struct bl_objc_class *bl_objClass = (__bridge struct bl_objc_class *)objClass;
//        Class metaObjClass = object_getClass(objClass);
//
//        NSLog(@"obj = %p, objClass = %p, metaObjClass = %p", obj, objClass, metaObjClass);
    }
    return 0;
}
