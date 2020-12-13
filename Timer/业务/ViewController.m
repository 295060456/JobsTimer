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
    //启动方式——1 定时器启动 手动添加定时器到RunLoop
    //    [NSTimerManager nsTimeStart:self.nsTimerManager
    //                    withRunLoop:nil];
    //启动方式——2 定时器启动 系统自动添加到RunLoop
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
        _countDownBtn = [[UIButton alloc] initWithType:CountDownBtnType_countDown
                                               runType:CountDownBtnRunType_manual
                                      layerBorderWidth:0
                                     layerCornerRadius:0
                                      layerBorderColor:nil
                                            titleColor:kWhiteColor
                                         titleBeginStr:@"发送验证码"
                                        titleLabelFont:[UIFont systemFontOfSize:8
                                                                         weight:UIFontWeightRegular]];
        _countDownBtn.titleBeginStr = @"发送验证码";
        _countDownBtn.titleRuningStr = @"重新发送\n";
        _countDownBtn.titleLabel.numberOfLines = 0;
        _countDownBtn.titleEndStr = @"重新发送";
        _countDownBtn.backgroundColor = KLightGrayColor;
        _countDownBtn.titleColor = kWhiteColor;
        _countDownBtn.bgCountDownColor = KLightGrayColor;//倒计时的时候此btn的背景色
        _countDownBtn.bgEndColor = KLightGrayColor;//倒计时完全结束后的背景色
        _countDownBtn.layerCornerRadius = 6;
        _countDownBtn.showTimeType = ShowTimeType_SS;
        _countDownBtn.titleLabelFont = [UIFont systemFontOfSize:8
                                                         weight:UIFontWeightRegular];
        _countDownBtn.countDownBtnNewLineType = CountDownBtnNewLineType_newLine;
        
        [_countDownBtn timeFailBeginFrom:5];//注销这句话就是手动启动，放开这句话就是自启动
        
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
