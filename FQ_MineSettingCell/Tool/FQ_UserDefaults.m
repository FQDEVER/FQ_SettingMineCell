//
//  FQUserDefaults.m
//  切换字体的测试
//
//  Created by 范奇 on 16/5/25.
//  Copyright © 2016年 范奇. All rights reserved.
//

#import "FQ_UserDefaults.h"

@implementation FQ_UserDefaults

+(void)userDefaultsSetObject:(id)object forKey:(NSString *)key
{
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    [userD setObject:object forKey:key];
}

+(instancetype)userDefaultsFromObjectForKey:(NSString *)key
{
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    return [userD objectForKey:key];
}

+(void)userDefaultsSetBOOL:(BOOL)on forKey:(NSString *)key
{
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    [userD setBool:on forKey:key];
}

+(BOOL)userDefaultsBOOLForKey:(NSString *)key
{
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    return [userD boolForKey:key];

}


@end
