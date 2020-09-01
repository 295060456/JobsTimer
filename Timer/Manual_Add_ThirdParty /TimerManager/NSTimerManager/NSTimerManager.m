//
//  NSTimerManager.m
//  Timer
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "NSTimerManager.h"

@interface NSTimerManager ()

@property(nonatomic,strong)NSDate *date;
@property(nonatomic,copy)MKDataBlock NSTimerManagerBlock;

@end

@implementation NSTimerManager

-(void)dealloc{
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
    [self nsTimeDestroy];
}

-(void)actionNSTimerManagerBlock:(MKDataBlock)NSTimerManagerBlock{
    _NSTimerManagerBlock = NSTimerManagerBlock;
}
///定时器暂停
-(void)nsTimePause{
    if (_nsTimer) {
        [self.nsTimer setFireDate:NSDate.distantFuture];
    }
}
///定时器继续
-(void)nsTimecontinue{
    if (_nsTimer) {
        [self.nsTimer setFireDate:NSDate.date];
    }
}
///销毁定时器
-(void)nsTimeDestroy{
    if (_nsTimer) {
        [_nsTimer invalidate];
        _nsTimer = nil;
    }
}
#pragma mark —— lazyLoad
#pragma mark —— 系统Api暴露出来的未被废弃的 NSTimer 的初始化方法有如下几种:
//+(NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti
//                       invocation:(NSInvocation *)invocation
//                          repeats:(BOOL)yesOrNo;
//+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
//                                invocation:(NSInvocation *)invocation
//                                   repeats:(BOOL)yesOrNo;
//+(NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti
//                           target:(id)aTarget
//                         selector:(SEL)aSelector
//                         userInfo:(nullable id)userInfo//????
//                          repeats:(BOOL)yesOrNo;
//+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
//                                    target:(id)aTarget
//                                  selector:(SEL)aSelector
//                                  userInfo:(nullable id)userInfo//????
//                                   repeats:(BOOL)yesOrNo;
//+(NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval
//                          repeats:(BOOL)repeats
//                            block:(void (^)(NSTimer *timer))block;
//+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
//                                   repeats:(BOOL)repeats
//                                     block:(void (^)(NSTimer *timer))block;
//-(instancetype)initWithFireDate:(NSDate *)date
//                       interval:(NSTimeInterval)interval
//                        repeats:(BOOL)repeats
//                          block:(void (^)(NSTimer *timer))block;

-(NSTimer *)nsTimer{
    if (!_nsTimer) {
        _nsTimer = [[NSTimer alloc] initWithFireDate:self.date
                                            interval:self.interval
                                             repeats:self.repeats
                                               block:^(NSTimer * _Nonnull timer) {
            if (self.NSTimerManagerBlock) {
                self.NSTimerManagerBlock(timer);
            }
        }];
    }return _nsTimer;
}

-(NSDate *)date{
    if (!_date) {
        _date = [[NSDate alloc] initWithTimeIntervalSinceNow:self.timeSecIntervalSinceDate];
    }return _date;
}

-(double)interval{
    if (_interval == 0) {
        _interval = 1.0f;
    }return _interval;
}

-(BOOL)repeats{
    if (!_repeats) {
        _repeats = YES;
    }return _repeats;
}

@end
