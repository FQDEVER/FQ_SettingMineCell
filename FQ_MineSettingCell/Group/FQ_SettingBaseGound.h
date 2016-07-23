//
//  JSSettingBaseGound.h
//  jianshu++
//
//  Created by 范奇 on 16/6/22.
//  Copyright © 2016年 范奇. All rights reserved.
//
/**
 *  这个是保存有多少组数据
 */
#import <UIKit/UIKit.h>

@interface FQ_SettingBaseGound : NSObject
//一个cell组
@property (nonatomic, strong) NSArray *items;
//cell组的组头
@property (nonatomic, strong) NSString *goundHead;
//cell组的组尾
@property (nonatomic, strong) NSString *goundFoot;
//该组行高
@property (nonatomic, assign)  CGFloat  rowHeight;
//cell组的组头View
@property (nonatomic, strong) UIView *goundHeadView;
//cell组的组尾的View
@property (nonatomic, strong) UIView *goundFootView;
/**
 *  设置该组的组头高度
 */
@property (nonatomic, assign) CGFloat  goundHeadHeight;
/**
 *  设置改组的组尾高度
 */
@property (nonatomic, assign) CGFloat  goundFootHeight;

/**
 *  分割线前端留多长的空白段
 */
@property (nonatomic, assign) CGFloat goundSeparatorSpaceLenght;



/**
 *  最基本的无组头,无组尾样式
 *
 *  @param items item数组模型
 *
 *  @return 返回一个cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items;

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
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundHead:(NSString *)goundHead  andGoundHeadHeight:(CGFloat)goundHeadHeight andGoundFoot:(NSString *)goundFoot andGoundFootHeight:(CGFloat)goundFootHeight andItemRowHeight:(CGFloat)itemsRowHeigh;

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
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundHead:(NSString *)goundHead  andGoundHeadHeight:(CGFloat)goundHeadHeight andGoundFoot:(NSString *)goundFoot andGoundFootHeight:(CGFloat)goundFootHeight;


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
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundHeadView:(UIView *)goundHeadView  andGoundHeadHeight:(CGFloat)goundHeadHeight  andGoundFootView:(UIView *)goundFootView andGoundFootHeight:(CGFloat)goundFootHeight andItemRowHeight:(CGFloat)itemsRowHeigh;

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
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundHeadView:(UIView *)goundHeadView  andGoundHeadHeight:(CGFloat)goundHeadHeight  andGoundFootView:(UIView *)goundFootView andGoundFootHeight:(CGFloat)goundFootHeight;

/**
 *  组头是View的情况
 *
 *  @param items           item模型数组
 *  @param goundHeadView   组头(view)
 *  @param goundHeadHeight 组头高度
 *
 *  @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundHeadView:(UIView *)goundHeadView andGoundHeadHeight:(CGFloat)goundHeadHeight;

/**
 *  组尾是View的情况
 *
 *  @param items           item模型数组
 *  @param goundFootView   组尾(view)
 *  @param goundFootHeight 组尾高度
 *
 *  @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundFootView:(UIView *) goundFootView andGoundFootHeight:(CGFloat)goundFootHeight;
/**
 *  只有组尾(文字)的情况
 *
 *  @param items           item模型数组
 *  @param goundFoot      组尾(文字)
 *  @param goundFootHeight 组尾高度
 *
 *  @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundFoot:(NSString *)goundFoot andGoundFootHeight:(CGFloat)goundFootHeight;


/**
 *  只有组头(文字)的情况
 *
 *  @param items           item模型数组
 *  @param goundHead       组头(文字)
 *  @param goundHeadHeight 组头高度
 *
 *  @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andGoundHead:(NSString *)goundHead andGoundHeadHeight:(CGFloat)goundHeadHeight;



/**
 *  只是设置组高
 *
 *  @param items     item模型数组
 *  @param rowHeight 组中所有item的行高
 *
 *  @return 返回一个cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items andRowHeight:(CGFloat)rowHeight;



@end
