//
//  ViewController.m
//  Algorithm
//
//  Created by iosyf-02 on 2018/2/22.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "ViewController.h"
#import "BubbleSort.h"
#import "SelectionSort.h"
#import "InsertionSort.h"
#import "ShellSort.h"
#import "QuickSort.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"算法系列";
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.dataArray = [NSMutableArray arrayWithObjects:
                      @"BubbleSort",
                      @"SelectionSort",
                      @"InsertionSort",
                      @"ShellSort",
                      @"QuickSort",
                      nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id viewController = [[NSClassFromString(self.dataArray[indexPath.row]) alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];
}





@end

