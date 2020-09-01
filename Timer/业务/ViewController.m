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

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property(nonatomic,strong)NSTimerManager *nsTimerManager;
@property(nonatomic,strong)UIButton *countDownBtn;

@property(nonatomic,strong) UILabel *countDown;
@property(nonatomic,strong) UIView *aphView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    [self makeTimer];
//    self.countDownBtn.alpha = 1;
//    [self secountDown];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event{
    [self makeTimer];
}

-(void)secountDown{
    _countDown =[[UILabel alloc]init];
    _countDown.textColor = [UIColor whiteColor];;
    _countDown.font =[UIFont boldSystemFontOfSize:100];
    _countDown.textAlignment = 1;
    [self.view addSubview:_countDown];
    _countDown.x = (SCREEN_WIDTH - 100)/2;
    _countDown.y = (SCREEN_HEIGHT - 100)/2;
    _countDown.width =_countDown.height = 100;
   
    _aphView = [UIView new];
    _aphView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_aphView];
    _aphView.frame = CGRectMake(0, 0, 100, 100);
    _aphView.centerX = _countDown.centerX;
    _aphView.centerY = _countDown.centerY;
    _aphView.alpha = 0;
    
    _aphView.layer.cornerRadius = 50.f;
}

- (void)getCuntDown:(NSInteger)second{
    if (second == 4) {
        second = 3;
    }
    _countDown.text=[NSString stringWithFormat:@"%ld",(long)second];
    _countDown.alpha = 1;
    _aphView.alpha = 0;
    @weakify(self)
    [UIView animateWithDuration:0.8
                     animations:^{
        @strongify(self)
        self.countDown.alpha = 0.8;//透明度
        self.aphView.alpha = 0.1;
        self.countDown.transform = CGAffineTransformMakeScale(1.5, 1.5);//放大值
        self.aphView.transform = CGAffineTransformMakeScale(10, 10);//放大值
    } completion:^(BOOL finished) {
        @strongify(self)
        self.aphView.alpha = self.countDown.alpha =  0;
        self.countDown.transform = self.aphView.transform = CGAffineTransformIdentity;//回复原大小
    }];
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
