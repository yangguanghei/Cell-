//
//  CustomTableViewCell.m
//  Cell上的跑秒
//
//  Created by 梁森 on 2017/9/22.
//  Copyright © 2017年 梁森. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "OYCountDownManager.h"
@interface CustomTableViewCell()

@property (nonatomic, strong) UILabel * timeLbl;

@end
@implementation CustomTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString * cellID = @"cellID";
    id cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
        // 监听通知
//                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(countDownNotification) name:kCountDownNotification object:nil];
    }
    
    return cell;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        // 监听通知
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(countDownNotification) name:kCountDownNotification object:nil];
    }
    return self;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle: style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        
        // 监听通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(countDownNotification) name:kCountDownNotification object:nil];
        [self setUpChildControl];
    }
    return self;
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setUpChildControl{
    UILabel * timeLbl = [[UILabel alloc] init];
    [self addSubview:timeLbl];
    timeLbl.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//    timeLbl.backgroundColor = [UIColor redColor];
    
    _timeLbl = timeLbl;
}

- (void)setTime:(long long)time{
    _time = time;
    // 手动调用通知的回调
    [self countDownNotification];
}
#pragma mark - 倒计时通知回调
- (void)countDownNotification {
    /// 判断是否需要倒计时 -- 可能有的cell不需要倒计时,根据真实需求来进行判断
    if (0) {
        return;
    }
    /// 计算倒计时
    NSString * count = [NSString stringWithFormat:@"%lld", _time];   // 剩余的秒数
    NSInteger countDown = [count integerValue] - kCountDownManager.timeInterval;
    //     NSInteger countDown = 100 - kCountDownManager.timeInterval;
    /// 当倒计时到了进行回调
    if (countDown <= 0) {
        _timeLbl.text = @"00小时00分钟00秒";
        // 回调给控制器
        !self.countDownZero ?: self.countDownZero();
        return;
    }
    /// 重新赋值
    _timeLbl.text = [NSString stringWithFormat:@"%02zd小时%02zd分钟%02zd秒", countDown/3600, (countDown/60)%60, countDown%60];
    

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
