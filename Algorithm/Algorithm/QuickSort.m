//
//  QuickSort.m
//  Algorithm
//
//  Created by iosyf-02 on 2018/2/24.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "QuickSort.h"

@interface QuickSort ()

@end

@implementation QuickSort

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *array = @[@12,@3,@90,@76,@45,@24,@1,@88];
    NSMutableArray *orgArray = array.mutableCopy;
    
    [self quickSort:orgArray leftIndex:0 rightIndex:orgArray.count - 1];
    
}

/**
 快速排序
 
 @param array 待排序数组
 */
- (void)quickSort:(NSMutableArray *)array leftIndex:(NSInteger)leftIndex rightIndex:(NSInteger)rightIndex {
    if (leftIndex >= rightIndex) {//数组元素为0或1，直接返回
        return;
    }
    
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    NSInteger key = [array[i] integerValue];
    
    while (i < j) {
        while (i < j && [array[j] integerValue] >= key) {//右边的比key大，再向左移，继续找
            j--;
        }
        array[i] = array[j];//找右边到了比key小的数，交换位置，将最小值调换到i的位置
        
        while (i < j && [array[i] integerValue] <= key) {//右边找到了比标准key小的数，就从i开始找左边比key大的
            i++;
        }
        array[j] = array[i];
        
        array[i] = @(key);//将标准数key放到正确位置
    }
    
    //递归排序，左右比两边的数据
    [self quickSort:array leftIndex:leftIndex rightIndex:i - 1];
    [self quickSort:array leftIndex:i + 1 rightIndex:rightIndex];
    [self printArray:array];
}



/*
 思想：
 设要排序的数组是mutableArray对象，首先任意选取一个数据（通常选用数组的第一个数）作为关键数据，然后将所有比它小的数都放到它前面，所有比它大的数都放到它后面，这个过程称为一次快速排序。
 
 步骤：
 1 ）.设置两个变量i，j ，排序开始时i = 0，就j = mutableArray.count - 1；
 2 ）.设置数组的第一个值为比较基准数key，key = mutableArray.count[0]；
 3 ）.因为设置key为数组的第一个值，所以先从数组最右边开始往前查找比key小的值。如果没有找到，j--继续往前搜索；如果找到则将mutableArray[i]和mutableArray[j]互换，并且停止往前搜索，进入第4步；
 4 ）.从i位置开始往后搜索比可以大的值，如果没有找到，i++继续往后搜索；如果找到则将mutableArray[i]和mutableArray[j]互换，并且停止往后搜索；
 5 ）.重复第3、4步，直到i == j（此时刚好执行完第三步或第四部），停止排序；
 
 */
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
