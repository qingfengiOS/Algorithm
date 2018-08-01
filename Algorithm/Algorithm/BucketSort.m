//
//  BucketSort.m
//  Algorithm
//
//  Created by 李一平 on 2018/8/1.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "BucketSort.h"

@interface BucketSort ()

@end

@implementation BucketSort

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *orgArray = @[@1,@3,@9,@8,@4,@5,@2];
    
    [self bucketSort:orgArray.mutableCopy];
    /*
     step1:建立一个临时数组，容量为待排序数组中最大的数，扫描待排序数组，把临时数组对应下边位置标记为1
     step2:遍历临时数组，找到标记为1的数，依次放入结果数组，遍历结束即得到结果
     */
    
    /*
     桶排序是典型的以空间换时间，桶排序的空间复杂度取决于最大的那个元素。当然实际使用我们不可能用这么多桶，毕竟内存不是无限的。
     */
}

/**
 桶排序

 @param array 待排序数组
 */
- (void)bucketSort:(NSMutableArray *)array {
    NSMutableArray *tempArray = @[@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0"].mutableCopy;
    for (NSNumber *number in array) {
        tempArray[[number integerValue]] = @"1";
    }
    
    NSMutableArray *sortedArray = [NSMutableArray array];
    for (int i = 0; i < tempArray.count; i++) {
        if ([tempArray[i] isEqualToString:@"1"]) {
            [sortedArray addObject:[NSNumber numberWithInt:i]];
        }
    }
    
    [self printArray:sortedArray];
}

/**
 打印排序之后的数组
 
 @param sortedArray 排序后的数组
 */
- (void)printArray:(NSMutableArray *)sortedArray {
    __block NSString *showStr = @"";
    [sortedArray enumerateObjectsUsingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        showStr = [showStr stringByAppendingString:[NSString stringWithFormat:@"%@      ",obj]];
    }];
    NSLog(@"%@",showStr);
}


@end
