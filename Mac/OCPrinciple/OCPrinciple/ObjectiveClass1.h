//
//  ObjectiveClass1.h
//  OCPrinciple
//
//  Created by libolin on 2019/4/12.
//  Copyright © 2019 libolin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**         OC 底层数据结构   */
typedef struct objc_object *id;
typedef struct objc_class *Class;
typedef struct objc_selector *SEL;
typedef struct objc_method *Method;
typedef struct objc_ivar *Ivar;
typedef struct objc_category *Category;
typedef struct objc_property *objc_property_t;
typedef struct objc_object Protocol;
typedef void (*IMP)(void /* id, SEL, ... */ );
struct objc_method_list;

struct objc_object {
    Class _Nonnull isa  OBJC_ISA_AVAILABILITY;
};

struct objc_class : objc_object {
    Class superclass;
    cache_t cache;             // formerly cache pointer and vtable
    class_data_bits_t bits;    // class_rw_t * plus custom rr/alloc flags
    
    class_rw_t *data() {
        return bits.data();
    }
    // NOT identical to this->ISA when this is a metaclass
    Class getMeta() {
        if (isMetaClass()) return (Class)this;
        else return this->ISA();
    }
};

