//
//  StringUtility.m
//  LLDBDebugDemo
//
//  Created by ls on 2021/11/2.
//

#import "StringUtility.h"

@implementation StringUtility

+ (NSString *)formatedStringForCount:(int64_t)count dividedIfOverLimit:(BOOL)dividedIfOverLimit
{
    if (count <= 0) {
        return @"0";
    }
    
    NSString *k = nil;
    int64_t limit1 = [self maxLimitCountForDivide];
    if (dividedIfOverLimit && count > limit1) {
        count /= 1000;
        k = @"K";
    }
    
    NSString *formatString = [NSString stringWithFormat:@"%lld", count];
    if (k) {
        formatString = [formatString stringByAppendingString:k];
    }
    return formatString;
}

+ (NSString *)formatedStringWithCount:(int64_t)count
{
    int64_t limit2 = [self hundredMillion];
    if (count <= 0) {
        return @"0";
    } else if (count < 10000) {
        return [NSString stringWithFormat:@"%lld", count];
    } else if (count >= 10000 && count < limit2) {
        return [NSString stringWithFormat:@"%.1f万", (count / 1000) / 10.0];
    } else {
        return [NSString stringWithFormat:@"%.1f亿", (count / 10000000) / 10.0];
    }
    
    return @"";
}

+ (NSString*)formatedAccompanyOrderCount:(int64_t)orderCount
{
    NSString *orderCountStr = nil;
    int64_t limit3 = [self maxLimitCountForShort];
    if (orderCount > limit3) {
        orderCountStr = [NSString stringWithFormat:@"%.1lfW",orderCount / 10000.0];
    } else {
        orderCountStr = [NSString stringWithFormat:@"%lld",orderCount];
    }
    return orderCountStr;
}

+ (int64_t)tenThousands
{
    return 10000;
}

+ (int64_t)hundredMillion
{
    return 100000000;
}

+ (int64_t)maxLimitCountForDivide
{
    return 999999999;
}

+ (int64_t)maxLimitCountForShort
{
    return 9999;
}

@end
