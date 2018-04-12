//
//  InsertionSort.m
//  Algorithm
//
//  Created by iosyf-02 on 2018/2/22.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "InsertionSort.h"

@interface InsertionSort ()

@end

@implementation InsertionSort

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *array = @[@12,@3,@90,@76,@45,@24,@1,@88];
    NSMutableArray *orgArray = array.mutableCopy;
    
    [self inserSort:orgArray];
    
    
    
    /*
     从空间上来看，它只需要一个记录的辅助空间，因此关键是看它的时间复杂度。当最好的情况，时间复杂度为O(n)。当最坏的情况，即待排序表示逆序的情况，如{6,5,4,3,2},此时需要比较(n+2)(n-1)/2次，记录的移动次数也达到(n+4)(n-1)/2次。如果排序记录是随机的，那么根据概率相同的原则，平均比较和移动次数约为n²/4次，因此插入排序法的时间复杂度为O(n²)，该排序比冒泡和选择排序的性能要好一些。
     */
}

/**
 插入排序

 @param array 待排序数组
 */
- (void)insertionSort:(NSMutableArray *)array {
    NSInteger arrayCount = array.count;
    for (NSInteger i = 0; i < arrayCount; i++) {
        NSInteger temp = [array[i] integerValue];
        for (NSInteger j = i - 1; j >= 0 ; j--) {
            if (temp < [array[j] integerValue]) {
                array[j + 1] = array[j];
                array[j] = @(temp);
            }
        }
        [self printArray:array];
    }
    /*
     步骤：
     1）将第一待排序序列第一个元素看做一个有序序列，把第二个元素到最后一个元素当成是未排序序列。
     2）从头到尾依次扫描未排序序列，将扫描到的每个元素插入有序序列的适当位置。（如果待插入的元素与有序序列中的某个元素相等，则将待插入元素插入到相等元素的后面。）
     */
}


- (void)inserSort:(NSMutableArray *)array {
    NSInteger arrayCount = array.count;
    for (NSInteger i = 1; i < arrayCount; i++) {
        NSNumber *temp = array[i];
        for (NSInteger j = i - 1; j >= 0; j--) {
            if (temp < array[j]) {
                array[j + 1] = array[j];
                array[j] = temp;
            }
        }
    }
    [self printArray:array];
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
