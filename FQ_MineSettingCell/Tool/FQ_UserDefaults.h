//
//  FQUserDefaults.h
//  切换字体的测试
//
//  Created by 范奇 on 16/5/25.
//  Copyright © 2016年 范奇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FQ_UserDefaults : NSUserDefaults


+(void)userDefaultsSetObject:(id)object forKey:(NSString *)key;

+(instancetype)userDefaultsFromObjectForKey:(NSString *)key;

+(void)userDefaultsSetBOOL:(BOOL)on forKey:(NSString *)key;


+(BOOL)userDefaultsBOOLForKey:(NSString *)key;


@end
