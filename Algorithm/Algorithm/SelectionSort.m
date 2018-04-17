//
//  SelectionSort.m
//  Algorithm
//
//  Created by iosyf-02 on 2018/2/22.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "SelectionSort.h"

@interface SelectionSort ()

@end

@implementation SelectionSort

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *orgArray = @[@12,@3,@90,@76,@45,@24,@1,@88];
    
    [self selectSort:orgArray.mutableCopy];
    
    /*
     从选择排序的过程来看，它最大的特点就是交换移动数据次数相当少，节约了相应的时间。分析它的时间复杂度发现，无论最好最差情况，其比较次数是一样多的 n-1 + n-2 + ... + 1 = n(n-1)/2。而对于交换次数而言，最好的时候交换为0次，最差的时候，为n-1次，基于最终的排序时间是比较与交换的次数总和，因此，总的时间复杂度为O(n²)
     
     尽管与冒泡排序同为O(n²)，但选择排序的性能上还是要略优于冒泡排序。
     */
    
}

/**
 选择排序

 @param array 待排序数组
 */
- (void)selectionSort:(NSMutableArray *)array {
    NSInteger minIndex = 0;
    NSInteger arrayCount = array.count;
    for (NSInteger i = 0; i < arrayCount; i++) {
        minIndex = i;
        for (NSInteger j = i + 1; j < arrayCount; j++) {
            if (array[minIndex] > array[j]) {
                minIndex = j;//如果有比当前最小值还小的就把该值设为最小值
            }
        }
        if (i != minIndex) {//找到了最小值，交换
            [array exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
        }
        [self printArray:array];
    }
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

- (void)selectSort:(NSMutableArray *)array {
    for (NSInteger i = 1; i <= array.count - 1; i++) {
        
        NSInteger k = i - 1;
        for (NSInteger j = i; j <= array.count - 1; j++) {
            if (array[j] < array[k]) {
                k = j;
            }
        }
        if (k != i - 1) {
            [array exchangeObjectAtIndex:k withObjectAtIndex:i-1];
        }
    }
    [self printArray:array];
}
@end
