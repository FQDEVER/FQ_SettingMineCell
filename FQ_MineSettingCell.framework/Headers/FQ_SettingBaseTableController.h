//
//  JSBaseTableController.h
//  jianshu++
//
//  Created by 范奇 on 16/6/22.
//  Copyright © 2016年 范奇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQ_SettingBaseTableCell.h"
#import "FQ_SettingBaseItem.h"
#import "FQ_SettingBaseGound.h"
@interface FQ_SettingBaseTableController : UITableViewController

/**
 *  装所有组模型数组
 */
@property (nonatomic, strong) NSMutableArray *groups;

/**
 *  分割线的样式
 */
@property (nonatomic, assign) BaseCellSeparatorType separatorType;


/**
 *  分割线前端留多长的空白段
 */
@property (nonatomic, assign) CGFloat tableViewSeparatorSpaceLenght;


@end
