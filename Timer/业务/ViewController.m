//
//  ViewController.m
//  Timer
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "ViewController.h"
#import "TimerManager.h"
#import "UIButton+CountDownBtn.h"

@interface ViewController ()

@property(nonatomic,strong)NSTimerManager *nsTimerManager;
@property(nonatomic,strong)UIButton *countDownBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    
    self.countDownBtn.alpha = 1;
    
    //创建方式——1
//    [NSTimerManager nsTimeStart:self.nsTimerManager.nsTimer
//                    withRunLoop:nil];
    //创建方式——2
//    [self.nsTimerManager nsTimeStartSysAutoInRunLoop];
}

-(NSTimerManager *)nsTimerManager{
    if (!_nsTimerManager) {
        _nsTimerManager = NSTimerManager.new;
        [_nsTimerManager actionNSTimerManagerBlock:^(id data) {
            NSLog(@"你好");
        }];
    }return _nsTimerManager;
}

-(UIButton *)countDownBtn{
    if (!_countDownBtn) {
        _countDownBtn = UIButton.new;
        _countDownBtn.titleRuningStr = @"重新发送";
        _countDownBtn.titleBeginStr = @"重新发送";
        _countDownBtn.titleColor = [UIColor blueColor];
        _countDownBtn.bgCountDownColor = [UIColor redColor];;
        _countDownBtn.bgEndColor = [UIColor clearColor];;
        _countDownBtn.layerCornerRadius = 6;
        [_countDownBtn timeFailBeginFrom:60];
        [self.view addSubview:_countDownBtn];
        _countDownBtn.frame = CGRectMake(100, 100, 100, 100);
    }return _countDownBtn;
}

@end
