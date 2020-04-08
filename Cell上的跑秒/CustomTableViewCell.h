//
//  CustomTableViewCell.h
//  Cell上的跑秒
//
//  Created by 梁森 on 2017/9/22.
//  Copyright © 2017年 梁森. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, assign) long long time;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
