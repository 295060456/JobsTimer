//
//  AppDelegate.h
//  Timer
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
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
