//
//  BinaryTreeNode.h
//  DemoCollection
//
//  Created by 李柏林 on 2019/4/10.
//  Copyright © 2019 berlin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BinaryTreeNode : NSObject
@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong) BinaryTreeNode *leftNode;

@property (nonatomic, strong) BinaryTreeNode *rightNode;
@end

NS_ASSUME_NONNULL_END
