//
//  BubbleSort.m
//  Algorithm
//
//  Created by iosyf-02 on 2018/2/22.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "BubbleSort.h"

@interface BubbleSort ()

@end

@implementation BubbleSort

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *array = @[@18,@1,@2,@90,@7,@12,@52,@36,@8,@13];
    
    [self normalBubleSort:array.mutableCopy];
    
    [self realBubbleSort:array.mutableCopy];
    
    [self optimizeBubbleSort:array.mutableCopy];
}


/**
 常规冒泡排序

 @param array 待排序数组
 */
- (void)normalBubleSort:(NSMutableArray *)array {
    NSLog(@"-----------------常规冒泡排序-------------------");
    NSInteger count  = 0;
    NSInteger compareCount = 0;
    for (NSInteger i = 0; i < array.count; i++) {
        count ++;
        for (NSInteger j = i + 1; j < array.count; j++) {
            compareCount ++;
            if (array[i] > array[j]) {
                [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
        [self printArray:array];
    }
    NSLog(@"循环次数：%ld,比较次数：%ld\n\n",count,compareCount);
    /*
     care：这样的算法不满足“两两比较相邻”的冒泡排序思想，它更应该是最简单的交换排序而已，每次排序只能确定一个位置，效率很低
     */
}


/**
 正宗冒泡排序

 @param array 待排序数组
 */
- (void)realBubbleSort:(NSMutableArray *)array {
    NSLog(@"-----------------正宗冒泡排序-------------------");
    NSInteger count  = 0;
    NSInteger compareCount = 0;
    for (NSInteger i = 0; i < array.count; i++) {
        count ++;
        for (NSInteger j = array.count - 2; j >= i; j--) {
            compareCount ++;
            if (array[j] > array[j + 1]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
        [self printArray:array];
    }
    
    NSLog(@"循环次数：%ld,比较次数：%ld\n\n",count,compareCount);
}


/**
 冒泡排序优化

 @param array 待排序数组
 */
- (void)optimizeBubbleSort:(NSMutableArray *)array {
    NSLog(@"-----------------冒泡排序优化-------------------");
    NSInteger count  = 0;
    NSInteger compareCount = 0;
    BOOL needExchange = YES;
    for (NSInteger i = 0; i < array.count && needExchange; i++) {
        needExchange = NO;
        count++;
        for (NSInteger j = array.count - 2; j >= i; j--) {
            compareCount++;
            if (array[j] > array[j + 1]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
                needExchange = YES;//已经有交换了，说明已经排序了，无需交换
            }
        }
        [self printArray:array];
    }
    NSLog(@"循环次数：%ld,比较次数：%ld\n\n",count,compareCount);
    /*
     如果循环一次后没有数据交换，这就说明此序列已经有序，不需要再继续后面的循环判断工作了,增加个BOOL变量flag来实现这一算法的改进.
     */
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
