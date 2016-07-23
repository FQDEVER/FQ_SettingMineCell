//
//  MineBaseTableCell.h
//  jianshu++
//
//  Created by 范奇 on 16/6/22.
//  Copyright © 2016年 范奇. All rights reserved.
//
//根据Item模型中的数据获取对应的cell模型和数据

#import <UIKit/UIKit.h>
@class FQ_SettingBaseGound;
@class FQ_SettingBaseItem;
//分割线的样式
typedef enum {
    //全部没有
    BaseCellSeparatorTypeNone,
    //全部有
    BaseCellSeparatorTypeAll,
    //到文字有
    BaseCellSeparatorTypeToText,
    //最上面 和最下面有,中间没有
    BaseCellSeparatorTypeTop,
    //最上面 和最下面没有,中间有
    BaseCellSeparatorTypeBottom,
    
}BaseCellSeparatorType;



@interface FQ_SettingBaseTableCell : UITableViewCell
/**
 *  接收外界传入数据
 */
@property (nonatomic, strong)  FQ_SettingBaseItem*baseItem;

/**
 *  是否显示底部分割线  YES:显示  NO:不显示
 */
@property (nonatomic, assign) BOOL showLineView;

/**
 *  是否显示顶部分割线  YES:显示  NO:不显示
 */
@property (nonatomic, assign) BOOL showTopLineView;


/**
 *  分割线的样式
 */
@property (nonatomic, assign) BaseCellSeparatorType separatorType;


/**
 *  分割线前端留多长的空白段
 */
@property (nonatomic, assign) CGFloat separatorSpaceLenght;



//给外界调用的一个cell类方法
+ (instancetype)cellWithTableView:(UITableView *)tableView andIndex:(NSIndexPath *)indexPath andSeparatorType:(BaseCellSeparatorType)separatorType andGroups:(NSMutableArray *)groups andSpaceLenght:(CGFloat) separatorSpaceLenght;


@end
