//
//  JSSettingBaseGound.m
//  jianshu++
//
//  Created by 范奇 on 16/6/22.
//  Copyright © 2016年 范奇. All rights reserved.
//

#import "FQ_SettingBaseGound.h"

@implementation FQ_SettingBaseGound

/**
 *  最基本的无组头,无组尾样式
 *
 *  @param items item数组模型
 *
 *  @return 返回一个cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items
{
    FQ_SettingBaseGound *gound = [[self alloc]init];
    gound.items = items;
    return gound;
}


/**
 *  组有组头文字和组尾文字的样式
 *
 *  @param items                     item数组模型
 *  @param goundHead                 组头文字
 *  @param goundHeadHeight           组头的高度
 *  @param goundFoot                 组尾文字
 *  @param goundFootHeight           组尾的高度
 *  @param itemsRowHeigh             所有cell的高度
 *  @return 返回一个cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundHead:(NSString *)goundHead  andGoundHeadHeight:(CGFloat)goundHeadHeight andGoundFoot:(NSString *)goundFoot andGoundFootHeight:(CGFloat)goundFootHeight andItemRowHeight:(CGFloat)itemsRowHeigh
{
    FQ_SettingBaseGound *gound = [[self alloc]init];
    gound.items = items;
    gound.goundHead = goundHead;
    gound.goundHeadHeight = goundHeadHeight;
    gound.goundFoot = goundFoot;
    gound.goundFootHeight = goundFootHeight;
    gound.rowHeight = itemsRowHeigh;
    return gound;

}



/**
 *  组头文字和组尾文字的,且默认行高的样式
 *
 *  @param items                     item数组模型
 *  @param goundHead                 组头文字
 *  @param goundHeadHeight           组头的高度
 *  @param goundFoot                 组尾文字
 *  @param goundFootHeight           组尾的高度
 *  @return 返回一个cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundHead:(NSString *)goundHead  andGoundHeadHeight:(CGFloat)goundHeadHeight andGoundFoot:(NSString *)goundFoot andGoundFootHeight:(CGFloat)goundFootHeight
{
    FQ_SettingBaseGound *gound = [[self alloc]init];
    gound.items = items;
    gound.goundHead = goundHead;
    gound.goundFoot = goundFoot;
    return gound;
}

/**
 *  组头是View 组尾是View 的样式
 *
 *  @param items           item数组模型
 *  @param goundHeadView   组头View
 *  @param goundHeadHeight 组头的高度
 *  @param goundFootView   组尾View
 *  @param goundFootHeight 组尾的高度
 *  @param itemsRowHeigh   改组所有cell的高度
 *
 *  @return 返回一个cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundHeadView:(UIView *)goundHeadView  andGoundHeadHeight:(CGFloat)goundHeadHeight  andGoundFootView:(UIView *)goundFootView andGoundFootHeight:(CGFloat)goundFootHeight andItemRowHeight:(CGFloat)itemsRowHeigh
{
    FQ_SettingBaseGound *gound = [[self alloc]init];
    gound.items = items;
    gound.goundHeadView = goundHeadView;
    gound.goundFootView = goundFootView;
    gound.goundHeadHeight = goundHeadHeight;
    gound.goundFootHeight = goundFootHeight;
    gound.rowHeight = itemsRowHeigh;
    return gound;

}


/**
 *  组头是View 组尾是View 默认cell高度样式
 *
 *  @param items           item数组模型
 *  @param goundHeadView   组头View
 *  @param goundHeadHeight 组头的高度
 *  @param goundFootView   组尾View
 *  @param goundFootHeight 组尾的高度
 *
 *  @return 返回一个cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundHeadView:(UIView *)goundHeadView  andGoundHeadHeight:(CGFloat)goundHeadHeight  andGoundFootView:(UIView *)goundFootView andGoundFootHeight:(CGFloat)goundFootHeight
{
    FQ_SettingBaseGound *gound = [[self alloc]init];
    gound.items = items;
    gound.goundHeadView = goundHeadView;
    gound.goundFootView = goundFootView;
    gound.goundHeadHeight = goundHeadHeight;
    gound.goundFootHeight = goundFootHeight;
    return gound;
    
}




/**
 *  组头是View的情况
 *
 *  @param items           item模型数组
 *  @param goundHeadView   组头(view)
 *  @param goundHeadHeight 组头高度
 *
 *  @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundHeadView:(UIView *)goundHeadView andGoundHeadHeight:(CGFloat)goundHeadHeight
{
    FQ_SettingBaseGound *gound = [[self alloc]init];
    gound.items = items;
    gound.goundHeadView = goundHeadView;
    gound.goundHeadHeight = goundHeadHeight;
    return gound;
}

/**
 *  组尾是View的情况
 *
 *  @param items           item模型数组
 *  @param goundFootView   组尾(view)
 *  @param goundFootHeight 组尾高度
 *
 *  @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundFootView:(UIView *) goundFootView andGoundFootHeight:(CGFloat)goundFootHeight
{
    FQ_SettingBaseGound *gound = [[self alloc]init];
    gound.items = items;
    gound.goundFootView = goundFootView;
    gound.goundFootHeight = goundFootHeight;
    return gound;

}


/**
 *  只有组尾(文字)的情况
 *
 *  @param items           item模型数组
 *  @param goundFoot      组尾(文字)
 *  @param goundFootHeight 组尾高度
 *
 *  @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundFoot:(NSString *)goundFoot andGoundFootHeight:(CGFloat)goundFootHeight
{
    FQ_SettingBaseGound *gound = [[self alloc]init];
    gound.items = items;
    gound.goundFoot = goundFoot;
    gound.goundFootHeight = goundFootHeight;
    return gound;
}
/**
 *  只有组头(文字)的情况
 *
 *  @param items           item模型数组
 *  @param goundHead       组头(文字)
 *  @param goundHeadHeight 组头高度
 *
 *  @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundHead:(NSString *)goundHead andGoundHeadHeight:(CGFloat)goundHeadHeight
{
    FQ_SettingBaseGound *gound = [[self alloc]init];
    gound.items = items;
    gound.goundHead = goundHead;
    gound.goundHeadHeight = goundHeadHeight;
    return gound;
}


/**
 *  只是设置组高
 *
 *  @param items     item模型数组
 *  @param rowHeight 组中所有item的行高
 *
 *  @return 返回一个cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andRowHeight:(CGFloat)rowHeight
{
    FQ_SettingBaseGound *gound = [[self alloc]init];
    gound.items = items;
    gound.rowHeight = rowHeight;
    return gound;
}


@end
