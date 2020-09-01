//
//  NSTimerManager.h
//  Timer
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>

//此类虽然为工具类，但是不允许用单例，因为timer需要被释放
NS_ASSUME_NONNULL_BEGIN

@interface NSTimerManager : NSObject

@property(nonatomic,strong)NSTimer *nsTimer;
@property(nonatomic,assign)double timeSecIntervalSinceDate;//推移时间，秒数
@property(nonatomic,assign)double interval;
@property(nonatomic,assign)BOOL repeats;
///需要定时器做的事情，回调
-(void)actionNSTimerManagerBlock:(MKDataBlock)NSTimerManagerBlock;
///定时器暂停
-(void)nsTimePause;
///定时器继续
-(void)nsTimecontinue;
///销毁定时器
-(void)nsTimeDestroy;

@end

NS_ASSUME_NONNULL_END
