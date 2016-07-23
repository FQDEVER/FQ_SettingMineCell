//
//  JSBaseTableController.m
//  jianshu++
//
//  Created by 范奇 on 16/6/22.
//  Copyright © 2016年 范奇. All rights reserved.
//

#import "FQ_SettingBaseTableController.h"



@interface FQ_SettingBaseTableController ()

@end

@implementation FQ_SettingBaseTableController

- (instancetype)init {
    return  [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置背景
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 15;
    self.tableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
    self.tableView.backgroundColor = ShareColor(244);
    // 隐藏系统的分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;


}
#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 根据section获得对应的组模型
    FQ_SettingBaseGound  *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获得cell
    FQ_SettingBaseTableCell *cell = [FQ_SettingBaseTableCell cellWithTableView:tableView andIndex:indexPath andSeparatorType:self.separatorType andGroups:self.groups andSpaceLenght:self.tableViewSeparatorSpaceLenght];

    return cell;
}




#pragma mark - tableView 代理方法
/**
 *  返回第section组的组标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // 根据组号获得组模型
    FQ_SettingBaseGound *group = self.groups[section];
    return group.goundHead;
}
/**
 *  返回第section组的尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    // 根据组号获得组模型
    FQ_SettingBaseGound *group = self.groups[section];
    return group.goundFoot;
}
/**
 *  返回第section组的组头View
 */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    FQ_SettingBaseGound *group = self.groups[section];
    return  group.goundHeadView;
}
/**
 *  返回第section组的组尾View
 */
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    FQ_SettingBaseGound *group = self.groups[section];
    return  group.goundFootView;
}

/**
 *  单独设置某一个cell的高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FQ_SettingBaseGound *baseGound = self.groups[indexPath.section];
    FQ_SettingBaseItem *baseItem = baseGound.items[indexPath.row];
    if (baseItem.itemRowHeight != 0)
    {

        return  baseItem.itemRowHeight;
        
    }
    if (baseGound.rowHeight != 0)
    {
        return  baseGound.rowHeight;
    }
    return 44;
}

/**
 *  单独设置某一个cell的组头高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    FQ_SettingBaseGound *baseGound = self.groups[section];
    if (baseGound.goundHeadHeight != 0)
    {
        return  baseGound.goundHeadHeight;
    }
    return 15;
}
/**
 *  单独设置某一个cell的组尾高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    FQ_SettingBaseGound *baseGound = self.groups[section];
    if (baseGound.goundFootHeight != 0)
    {
        return  baseGound.goundFootHeight;
        
    }
    return 0;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // 取消选择效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 根据组号获得组模型
    FQ_SettingBaseGound *group = self.groups[indexPath.section];
    // 根据行号获得item模型
    FQ_SettingBaseItem *baseItem = group.items[indexPath.row];
    
    // operation 优先级高于控制器的调整
    if (baseItem.baseItemBlock)
    {
        baseItem.baseItemBlock();
        return;
    }

    // 判断是否是箭头模型
    if(baseItem.baseType != BaseCellTypeSwitch) {
        // 获得目标控制器
        UIViewController *destVc = [[baseItem.controller alloc] init];
        // 设置目标控制器的标题
        destVc.title = baseItem.title;
        // 跳转
        [self.navigationController pushViewController:destVc animated:YES];
    }
}

- (NSMutableArray *)groups {
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}


@end
