//
//  AppDelegate.h
//  脚本自动重签
//
//  Created by Alan on 2019/10/15.
//  Copyright © 2019 zhaixingzhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (nonatomic, strong) UIWindow *window;
- (void)saveContext;


@end

