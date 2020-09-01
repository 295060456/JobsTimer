//
//  NSTimerManager.h
//  Timer
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>

//此类虽然为工具类，但是不允许用单例，因为timer需要被释放

//NSTimer只有被加入到runloop, 才会生效, 即NSTimer才会被真正执行
//scheduledTimerWithTimeInterval相比它的小伙伴们不仅仅是创建了NSTimer对象, 还把该对象加入到了当前的runloop中，runloop的模式为默认模式（NSDefaultRunLoopMode）!
NS_ASSUME_NONNULL_BEGIN

@interface NSTimerManager : NSObject

@property(nonatomic,assign)double timeSecIntervalSinceDate;//推移时间，秒数
@property(nonatomic,assign)double interval;
@property(nonatomic,assign)BOOL repeats;
@property(nonatomic,strong)NSTimer *nsTimer;
///需要定时器做的事情，回调
-(void)actionNSTimerManagerBlock:(MKDataBlock)NSTimerManagerBlock;

///定时器启动 手动添加定时器到RunLoop
+(void)nsTimeStart:(NSTimer *)nsTimer
       withRunLoop:(NSRunLoop *_Nullable)runLoop;//currentRunLoop可调用子线程；mainrunloop主线程
///定时器暂停
+(void)nsTimePause:(NSTimer *)nsTimer;
///定时器继续
+(void)nsTimecontinue:(NSTimer *)nsTimer;
///销毁定时器
+(void)nsTimeDestroy:(NSTimer *)nsTimer;

@end

NS_ASSUME_NONNULL_END
