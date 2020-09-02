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
#import "MovieCountDown.h"

@interface ViewController ()

@property(nonatomic,strong)NSTimerManager *nsTimerManager;
@property(nonatomic,strong)UIButton *countDownBtn;
@property(nonatomic,strong)MovieCountDown *movieCountDown;

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
//    [self makeTimer];
//    self.countDownBtn.alpha = 1;
    
//    [self.movieCountDown 倒计时放大特效];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self.movieCountDown 倒计时放大特效];
}

-(void)makeTimer{
    //创建方式——1
    //    [NSTimerManager nsTimeStart:self.nsTimerManager.nsTimer
    //                    withRunLoop:nil];
    //创建方式——2
    [self.nsTimerManager nsTimeStartSysAutoInRunLoop];
}

-(NSTimerManager *)nsTimerManager{
    if (!_nsTimerManager) {
        _nsTimerManager = NSTimerManager.new;
        _nsTimerManager.timerStyle = TimerStyle_anticlockwise;
        _nsTimerManager.anticlockwiseTime = 5;
        [_nsTimerManager actionNSTimerManagerRunningBlock:^(id data) {
            NSLog(@"你好");
            if ([data isKindOfClass:NSTimerManager.class]) {
//                NSTimerManager *timerManager = (NSTimerManager *)data;
//                timerManager.anticlockwiseTime;
            }
        }];
        [_nsTimerManager actionNSTimerManagerFinishBlock:^(id data) {
            NSLog(@"我死球了");
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
        _countDownBtn.bgEndColor = [UIColor blueColor];;
        _countDownBtn.layerCornerRadius = 6;
        [_countDownBtn timeFailBeginFrom:5];//
        [self.view addSubview:_countDownBtn];
        _countDownBtn.frame = CGRectMake(100, 100, 100, 100);
    }return _countDownBtn;
}

-(MovieCountDown *)movieCountDown{
    if (!_movieCountDown) {
        _movieCountDown = MovieCountDown.new;
        _movieCountDown.effectView = self.view;
        [_movieCountDown actionMovieCountDownFinishBlock:^(id data) {
            NSLog(@"我死球了");
        }];
    }return _movieCountDown;
}

@end
