//
//  StringUtility.h
//  LLDBDebugDemo
//
//  Created by ls on 2021/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StringUtility : NSObject

/**
 *  @brief 魅力值点数格式化 3333333 -> 3,333,333
 *  @param count 个数
 *  @param dividedIfOverLimit count 大于 999999999 时是否需要除以 1000 以减小长度
 */
+ (NSString *)formatedStringForCount:(int64_t)count dividedIfOverLimit:(BOOL)dividedIfOverLimit;


/** 格式化数字：若少于 1000，则插入分隔符，大于等于一万则补充单位，并保留一位小数 */
+ (NSString *)formatedStringWithCount:(int64_t)count;

//订单量格式化显示
+ (NSString*)formatedAccompanyOrderCount:(int64_t)orderCount;

@end

NS_ASSUME_NONNULL_END
