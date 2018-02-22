//
//  ShellSort.m
//  Algorithm
//
//  Created by iosyf-02 on 2018/2/22.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "ShellSort.h"

@interface ShellSort ()

@end

@implementation ShellSort

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@12,@3,@90,@76,@45,@24,@1,@88];
    NSMutableArray *orgArray = array.mutableCopy;
    
    [self shellSort:orgArray];
    
}

/**
 希尔排序
 
 @param array 待排序数组
 */
- (void)shellSort:(NSMutableArray *)array {
    NSInteger gap = array.count / 2;//起始间隔值gap设置为总数的一半，直到gap==1结束
    while (gap >= 1) {
        for (NSInteger i = gap; i < array.count; i++) {
            NSInteger temp = [[array objectAtIndex:i] integerValue];
            NSInteger j = i;
            
            while (j >= gap && temp < [[array objectAtIndex:j - gap] integerValue]) {
                [array replaceObjectAtIndex:j withObject:[array objectAtIndex:j - gap]];
                j -= gap;
            }
            [array replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:temp]];
        }
        gap = gap / 2;
        
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

@end
