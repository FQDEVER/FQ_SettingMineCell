//
//  AppDelegate.h
//  FQ_MineSettingCellDemo
//
//  Created by 范奇 on 2018/3/8.
//  Copyright © 2018年 范奇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

