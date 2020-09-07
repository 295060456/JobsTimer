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
@property(nonatomic,strong)UIButton *countDownBtn2;
@property(nonatomic,strong)MovieCountDown *movieCountDown;

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
//    [self makeTimer];
    self.countDownBtn.alpha = 1;
//    self.countDownBtn2.alpha = 1;
//    [self.movieCountDown 倒计时放大特效];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
//    [self.movieCountDown 倒计时放大特效];
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
        _countDownBtn = [[UIButton alloc] initWithType:CountDownBtnType_countDown];
        
        _countDownBtn.titleBeginStr = @"发送验证码";
        _countDownBtn.titleRuningStr = @"重新发送";
        _countDownBtn.titleEndStr = @"重新发送";
        _countDownBtn.backgroundColor = [UIColor blueColor];
        _countDownBtn.titleColor = [UIColor whiteColor];
        _countDownBtn.bgCountDownColor = [UIColor redColor];//倒计时的时候此btn的背景色
        _countDownBtn.bgEndColor = [UIColor blueColor];//倒计时完全结束后的背景色
        _countDownBtn.layerCornerRadius = 6;
        _countDownBtn.showTimeType = ShowTimeType_MMSS;
        [_countDownBtn timeFailBeginFrom:5];
//        @weakify(self)
        [_countDownBtn actionCountDownClickEventBlock:^(id data) {
//            @strongify(self)
            NSLog(@"MMP");
        }];
        
        [self.view addSubview:_countDownBtn];
        _countDownBtn.frame = CGRectMake(100, 100, 100, 100);
    }return _countDownBtn;
}

-(UIButton *)countDownBtn2{
    if (!_countDownBtn2) {
        _countDownBtn2 = UIButton.new;
        [_countDownBtn2 setTitle:@"1234" forState:UIControlStateNormal];
        _countDownBtn2.backgroundColor = [UIColor redColor];
        [self.view addSubview:_countDownBtn2];
        _countDownBtn2.frame = CGRectMake(100, 300, 100, 100);
    }return _countDownBtn2;
}

-(MovieCountDown *)movieCountDown{
    if (!_movieCountDown) {
        _movieCountDown = MovieCountDown.new;
        _movieCountDown.countDownTime = 9;
        _movieCountDown.effectView = self.view;
        [_movieCountDown actionMovieCountDownFinishBlock:^(id data) {
            NSLog(@"我死球了");
        }];
    }return _movieCountDown;
}

@end
