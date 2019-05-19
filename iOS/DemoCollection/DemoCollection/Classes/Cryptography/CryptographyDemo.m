//
//  CryptographyDemo.m
//  DemoCollection
//
//  Created by libolin on 2019/5/19.
//  Copyright © 2019 berlin. All rights reserved.
//

#import "CryptographyDemo.h"

#import <CommonCrypto/CommonDigest.h>
@implementation CryptographyDemo
- (NSString *)md5:(NSString *) str {
    // 判断传入的字符串是否为空
    if (! str) return nil;
    // 转成utf-8字符串
    const char *cStr = str.UTF8String;
    // 设置一个接收数组
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    // 对密码进行加密
    CC_MD5(cStr, (CC_LONG) strlen(cStr), result);
    NSMutableString *md5Str = [NSMutableString string];
    // 转成32字节的16进制
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i ++) {
        [md5Str appendFormat:@"%02x", result[i]];
    }
    return md5Str;
}


#pragma mark base64
/**
 2.Base64编码原理
 1)将所有字符转化为ASCII码；
 2)将ASCII码转化为8位二进制；
 3)将二进制3个归成一组(不足3个在后边补0)共24位，再拆分成4组，每组6位；
 4)统一在6位二进制前补两个0凑足8位；
 5)将补0后的二进制转为十进制；
 6)从Base64编码表获取十进制对应的Base64编码；
 处理过程说明：
 a.转换的时候，将三个byte的数据，先后放入一个24bit的缓冲区中，先来的byte占高位。
 b.数据不足3byte的话，于缓冲区中剩下的bit用0补足。然后，每次取出6个bit，按照其值选择查表选择对应的字符作为编码后的输出。
 c.不断进行，直到全部输入数据转换完成。
 d.如果最后剩下两个输入数据，在编码结果后加1个“=”；
 e.如果最后剩下一个输入数据，编码结果后加2个“=”；
 f.如果没有剩下任何数据，就什么都不要加，这样才可以保证资料还原的正确性。
 */
//对一个字符串进行base64编码,并且返回
-(NSString *)base64EncodeString:(NSString *)string
{
    //1.先转换为二进制数据
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    //2.对二进制数据进行base64编码,完成之后返回字符串
    return [data base64EncodedStringWithOptions:0];
}

//对base64编码之后的字符串解码,并且返回
-(NSString *)base64DecodeString:(NSString *)string
{
    //注意:该字符串是base64编码后的字符串
    //1.转换为二进制数据(完成了解码的过程)
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:0];
    
    //2.把二进制数据在转换为字符串
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}


- (void)test:(NSString *)content {
    NSString *md5 = [self md5:content];
    NSLog(@"---md5 = %@", md5);
    
    NSString *base64Encode = [self base64EncodeString:content];
    
    NSString *base64Decode = [self base64DecodeString:base64Encode];
    NSLog(@"---base64Encode = %@ *** base64Decode = %@", base64Encode, base64Decode);

    
}


@end
