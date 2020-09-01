//
//  ViewController.m
//  Timer
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "ViewController.h"
#import "TimerManager.h"

@interface ViewController ()

@property(nonatomic,strong)NSTimerManager *nsTimerManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [NSTimerManager nsTimeStart:self.nsTimerManager.nsTimer
                    withRunLoop:nil];
}

-(NSTimerManager *)nsTimerManager{
    if (!_nsTimerManager) {
        _nsTimerManager = NSTimerManager.new;
        [_nsTimerManager actionNSTimerManagerBlock:^(id data) {
            NSLog(@"你好");
        }];
    }return _nsTimerManager;
}

@end
