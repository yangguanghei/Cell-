//
//  ViewController.m
//  Cell上的跑秒
//
//  Created by 梁森 on 2017/9/22.
//  Copyright © 2017年 梁森. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "OYCountDownManager.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray * timeArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // countdown
    [self addTableView];
}

- (void)addTableView{
    
    // 启动倒计时管理
    [kCountDownManager start];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableFooterView = [[UIView alloc] init];
    
    NSArray * timeArr = @[@"1000", @"5000", @"2000", @"300", @"60999"];
    _timeArr = timeArr;
}

#pragma mark --- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _timeArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell * cell = [CustomTableViewCell cellWithTableView:tableView];
    NSString * timeStr = _timeArr[indexPath.row];
    cell.time = [timeStr integerValue];
    return cell;
}

@end
