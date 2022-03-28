//
//  ViewController.m
//  RunloopDemo
//
//  Created by libolin on 2022/3/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


__weak id reference = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addObserver]; // 添加监听者
    NSLog(@"%@", [NSRunLoop currentRunLoop].currentMode); // 查看当前的RunLoop运行状态
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"1234567");
//    });
//    NSLog(@"1234567");
    
    NSString *str = [NSString stringWithFormat:@"dajljfladjlajdlfdjflajdlafjafjlaj我哦"];
    NSLog(@"viewDidLoad str = %@", str);
    reference = str;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"viewWillAppear str = %@", reference);

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear str = %@", reference);

}

// 开启一个定时器
- (void)btn:(id)sender {
//    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(getCurrentRunLoopMode) userInfo:nil repeats:YES];
}

// 添加一个监听者
- (void)addObserver {
    
    // 1. 创建监听者
    /**
     *  创建监听者
     *
     *   allocator#>  分配存储空间
     *   activities#> 要监听的状态
     *   repeats#>    是否持续监听
     *   order#>      优先级, 默认为0
     *   observer     观察者
     *   activity     监听回调的当前状态
     */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        /*
         kCFRunLoopEntry = (1UL << 0),          进入工作
         kCFRunLoopBeforeTimers = (1UL << 1),   即将处理Timers事件
         kCFRunLoopBeforeSources = (1UL << 2),  即将处理Source事件
         kCFRunLoopBeforeWaiting = (1UL << 5),  即将休眠
         kCFRunLoopAfterWaiting = (1UL << 6),   被唤醒
         kCFRunLoopExit = (1UL << 7),           退出RunLoop
         kCFRunLoopAllActivities = 0x0FFFFFFFU  监听所有事件
         */
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"进入");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"即将处理Timer事件");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"即将处理Source事件");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"即将休眠");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"被唤醒");
                break;
            case kCFRunLoopExit:
                NSLog(@"退出RunLoop");
                break;
            default:
                break;
        }
    });
    
    // 2. 添加监听者
    /**
     *  给指定的RunLoop添加监听者
     *
     *  @param rl#>       要添加监听者的RunLoop
     *  @param observer#> 监听者对象
     *  @param mode#>     RunLoop的运行模式, 填写默认模式即可
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
}


- (void)getCurrentRunLoopMode{
    // 每次定时器触发, 都去查看当前的RunLoop的运行mode
    NSLog(@"%@", [NSRunLoop currentRunLoop].currentMode);
}

- (void)forwardInvocation:(NSInvocation*)anInvocation {
    NSLog(@"forwardInvocation");
    SEL sel = [anInvocation selector];
    TempObj *tempObj = [TempObj new];
    if ([tempObj respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:tempObj];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

/*必须重新这个方法，消息转发机制使用从这个方法中获取的信息来创建NSInvocation对象 返回nil上面方法不执行*/
- (NSMethodSignature*)methodSignatureForSelector:(SEL)aSelector{
    NSString *methodName = NSStringFromSelector(aSelector);
    if ([methodName isEqualToString:@"sendMessage:"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"消息转发失败");
}

@end

