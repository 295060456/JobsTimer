//
//  AppDelegate.h
//  JobsTimer
//
//  Created by Jobs on 2021/4/8.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(readonly,strong)NSPersistentCloudKitContainer *persistentContainer;

+(instancetype)sharedInstance;

-(void)saveContext;

@end

#pragma clang diagnostic pop
