//
//  JSSettingBaseItem.m
//  jianshu++
//
//  Created by 范奇 on 16/6/22.
//  Copyright © 2016年 范奇. All rights reserved.
//

#import "FQ_SettingBaseItem.h"

@implementation FQ_SettingBaseItem


/**
 *  图片->标题  ->箭头样式
 *
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andIcon:(NSString *)icon andController:(Class)controller
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    //只带箭头的样式
    settingItem.baseType = BaseCellTypeLabelAndArrow;
    settingItem.title = title;
    settingItem.icon = icon;
    settingItem.controller= controller;
    return  settingItem;
}
/**
 *  图片->标题    ->labelText->箭头样式
 *
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andIcon:(NSString *)icon andLalelText:(NSString *)lalelText andController:(Class)controller
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType =  BaseCellTypeLabelAndArrow;
    settingItem.title = title;
    settingItem.icon = icon;
    settingItem.controller= controller;
    settingItem.lalelText = lalelText;
    return  settingItem;
}

/**
 *  图片(大图片样式)->标题  图片->箭头样式
 *
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andBig_Icon:(NSString *)icon andHeadImage:(UIImage *)headImage  andController:(Class)controller andLastImageIsRounds:(BOOL)isRounds
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType = BaseCellTypeImageAndArrow;
    settingItem.title = title;
    settingItem.icon = icon;
    settingItem.headImage = headImage;
    settingItem.controller = controller;
    settingItem.isLastImgRound = isRounds;
    return settingItem;
}

/**
 *  图片(小图片样式)->标题  图片->箭头样式
 *
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andSmo_Icon:(NSString *)icon andHeadImage:(UIImage *)headImage andController:(Class)controller andLastImageIsRounds:(BOOL)isRounds
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType = BaseCellTypeSmo_ImageAndArrow;
    settingItem.title = title;
    settingItem.icon = icon;
    settingItem.headImage = headImage;
    settingItem.controller = controller;
    settingItem.isLastImgRound = isRounds;
    return settingItem;
}



/**
 *  图片->标题   ->开关样式
 *
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andIcon:(NSString *)icon andSwitch:(BOOL)isOpenSwitch andChangBlock:(void(^)(BOOL on))changBlock
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType =  BaseCellTypeSwitch;
    settingItem.title = title;
    settingItem.icon = icon;
    settingItem.isOpenSwitch= isOpenSwitch;
    settingItem.changBlock = changBlock;
    return  settingItem;
}
/**
 *  标题 -> 文字Label样式
 *
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andLalelText:(NSString *)lalelText andController:(Class)controller
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType = BaseCellTypeLabel;
    settingItem.title = title;
    settingItem.lalelText = lalelText;
    settingItem.controller= controller;
    return  settingItem;

}
/**
 *  标题 -> 箭头样式
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andController:(Class)controller
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType =  BaseCellTypeArrow;
    settingItem.title = title;
    settingItem.controller= controller;
    return  settingItem;
}



/**
 *  自定义cell的view
 *
 */
+(instancetype)settingItemDataWithUIView:(UIView *)selView andController:(Class)controller;
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType =  BaseCellTypeNone;
    settingItem.selView = selView;
    settingItem.controller = controller;
    return  settingItem;
}

/**
 *  图片-> 文字居中->箭头样式
 *
 */
+(instancetype)settingItemDataWithIcon:(NSString *)icon andCenterTitle:(NSString *)title  andTitleColor:(UIColor *)color  andController:(Class)controller
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType = BaseCellTypeCenterLabel;
    settingItem.title = title;
    settingItem.diyColor = color;
    settingItem.icon = icon;
    settingItem.controller = controller;
    return settingItem;
}




@end
