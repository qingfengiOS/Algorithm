//
//  MergeSort.m
//  Algorithm
//
//  Created by 李一平 on 2018/5/10.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "MergeSort.h"

@interface MergeSort ()

@end

@implementation MergeSort

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
     NSArray *array = @[@12,@3,@90,@76,@45,@24,@1,@88];
    
    [self mergeSort:array.mutableCopy];
}

- (void)mergeSort:(NSMutableArray *)originArray {

    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:1];//tempArray数组里存放originArray个数组，每个数组包含一个元素

    for (NSNumber *number in originArray) {
        NSMutableArray *subArray = [NSMutableArray array];
        [subArray addObject:number];
        [tempArray addObject:subArray];
    }

    //合并
    while (tempArray.count != 1) {
        NSInteger i = 0;
        while (i < tempArray.count - 1) {
            tempArray[i] = [self mergeArrayFirstList:tempArray[i] secondList:tempArray[i + 1]];
            [tempArray removeObjectAtIndex:i + 1];
            i++;
        }
    }
    NSLog(@"归并升序排序结果：%@", tempArray[0]);

}

- (NSMutableArray *)mergeArrayFirstList:(NSMutableArray *)array1 secondList:(NSMutableArray *)array2 {
    NSMutableArray *resultArray = [NSMutableArray array];
    NSInteger firstIndex = 0, secondIndex = 0;
    while (firstIndex < array1.count && secondIndex < array2.count) {
        if ([array1[firstIndex] floatValue] < [array2[secondIndex] floatValue]) {
            [resultArray addObject:array1[firstIndex]];
            firstIndex++;
        } else {
            [resultArray addObject:array2[secondIndex]];
            secondIndex++;
        }
    }
    while (firstIndex < array1.count) {
        [resultArray addObject:array1[firstIndex]];
        firstIndex++;
    }
    while (secondIndex < array2.count) {
        [resultArray addObject:array2[secondIndex]];
        secondIndex++;
    }
    return resultArray.copy;
}



@end
