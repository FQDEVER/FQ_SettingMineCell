//
//  FQ_SettingBaseVC.m
//  TestDemo
//
//  Created by mac on 2017/8/29.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FQ_SettingBaseVC.h"


@implementation FQ_SettingBaseItem

/**
 标题图->标题 ->文本->箭头样式
 主要设置基本数据
 其他:iconSize/titleColor/contentColor/ContentImgSize/均可自定义设置
 
 @param icon       标题图
 @param titleStr   标题文本
 @param contentStr 内容问题
 @param isArrow    是否需要箭头
 @param controller 跳转控制器
 
 @return baseItem模型
 */
+(instancetype)settingItemDataWithIconImg:(UIImage *)icon TitleStr:(NSString *)titleStr   ContentStr:(NSString *)contentStr andController:(UIViewController *)controller
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType =  BaseCellTypeLabel_Arrow;
    settingItem.titleImage = icon;
    settingItem.titleStr = titleStr;
    settingItem.contentStr = contentStr;
    settingItem.isArrow = YES;
    settingItem.controller= controller;
    settingItem.itemRowHeight = DefaultH;
    return  settingItem;
}



/**
 标题图->标题->内容图->箭头样式
 
 @param titleImage   标题图
 @param titleStr     标题文本
 @param contentImage 内容图
 @param controller   跳转控制器
 @return baseItem模型
 */
+(instancetype)settingItemDataWithTitleImage:(UIImage *)titleImage TitleStr:(NSString *)titleStr ContentImage:(UIImage *)contentImage andController:(UIViewController *)controller
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType = BaseCellTypeImage_Arrow;
    settingItem.titleStr = titleStr;
    settingItem.titleImage = titleImage;
    settingItem.contentImage = contentImage;
    settingItem.controller = controller;
    settingItem.isArrow = YES;
    settingItem.itemRowHeight = DefaultH;
    return settingItem;
}


/**
 标题图->标题->开关
 
 @param titleImage   标题图
 @param titleStr     标题
 @param isOpenSwitch 开关状态
 @param changBlock   回调block
 
 @return baseItem模型
 */
+(instancetype)settingItemDataWithTitleImage:(UIImage *)titleImage TitleStr:(NSString *)titleStr Switch:(BOOL)isOpenSwitch andChangBlock:(void(^)(BOOL on))changBlock
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType =  BaseCellTypeSwitch;
    settingItem.titleStr = titleStr;
    settingItem.titleImage = titleImage;
    settingItem.isOpenSwitch= isOpenSwitch;
    settingItem.changSwitchBlock = changBlock;
    settingItem.itemRowHeight = DefaultH;
    return  settingItem;
};


/**
 标题图->标题(居中)->箭头
 
 @param titleImage 标题图
 @param centerStr  标题(居中)
 @param controller 跳转控制器
 
 @return baseItem模型
 */
+(instancetype)settingItemDataWithTitleImage:(UIImage *)titleImage CenterTitleStr:(NSString *)centerStr andController:(UIViewController *)controller
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType = BaseCellTypeLabel_Arrow_Center;
    settingItem.titleStr = centerStr;
    settingItem.titleImage = titleImage;
    settingItem.controller = controller;
    settingItem.isArrow = YES;
    settingItem.itemRowHeight = DefaultH;
    return settingItem;
}

/**
 custom自定义样式
 
 @param customView 自定义view
 @param controller 跳转控制器
 
 @return baseItem模型
 */
+(instancetype)settingItemDataWithCustomView:(UIView *)customView andController:(UIViewController *)controller
{
    FQ_SettingBaseItem *settingItem = [[self alloc]init];
    settingItem.baseType = BaseCellTypeCustom;
    settingItem.controller = controller;
    settingItem.customView = customView;
    settingItem.itemRowHeight = DefaultH;
    return settingItem;
}

@end
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
    
    return [FQ_SettingBaseGound settingBaseGoundWithItems:items HeaderStr:nil headerView:nil HeaderHeight:DefaultH FooterStr:nil FooterView:nil FooterHeight:DefaultH ItemRowHeight:DefaultH];
}


/**
 *  只有组头(View)
 *
 *  @param items           item模型数组
 *  @param goundHeaderView   组头(view)
 *  @param goundHeaderHeight 组头高度
 *
 *  @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items HeaderView:(UIView *)goundHeaderView HeaderHeight:(CGFloat)goundHeaderHeight
{
    FQ_SettingBaseGound *gound = [FQ_SettingBaseGound settingBaseGoundWithItems:items HeaderStr:nil headerView:goundHeaderView HeaderHeight:goundHeaderHeight FooterStr:nil FooterView:nil FooterHeight:DefaultH ItemRowHeight:DefaultH];
    return gound;
}


/**
 *  只有组头(文字)
 *
 *  @param items           item模型数组
 *  @param goundHeader       组头(文字)
 *  @param goundHeaderHeight 组头高度
 *
 *  @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items HeaderStr:(NSString *)goundHeaderStr HeaderHeight:(CGFloat)goundHeaderHeight
{
    FQ_SettingBaseGound *gound = [FQ_SettingBaseGound settingBaseGoundWithItems:items HeaderStr:goundHeaderStr headerView:nil HeaderHeight:goundHeaderHeight FooterStr:nil FooterView:nil FooterHeight:DefaultH ItemRowHeight:DefaultH];
    
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
+(instancetype)settingBaseGoundWithItems:(NSArray *)items RowHeight:(CGFloat)rowHeight
{
    FQ_SettingBaseGound *gound = [FQ_SettingBaseGound settingBaseGoundWithItems:items HeaderStr:nil headerView:nil HeaderHeight:DefaultH FooterStr:nil FooterView:nil FooterHeight:DefaultH ItemRowHeight:rowHeight];
    return gound;
}


/**
 设置组样式
 
 @param items             item数组模型
 @param goundHeaderStr      组头文字
 @param goundHeaderView     组头view
 @param goundHeaderHeight 组头高度
 @param goundFooterStr    组尾文字
 @param goundFooterView   组尾view
 @param goundFooterHeight 组尾高度
 @param itemsRowHeigh     item cell高度.
 
 @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items HeaderStr:(NSString *)goundHeaderStr headerView:(UIView *)goundHeaderView  HeaderHeight:(CGFloat)goundHeaderHeight FooterStr:(NSString *)goundFooterStr FooterView:(UIView *)goundFooterView FooterHeight:(CGFloat)goundFooterHeight ItemRowHeight:(CGFloat)itemsRowHeigh
{
    FQ_SettingBaseGound *gound = [[self alloc]init];
    gound.items = items;
    gound.goundHeaderStr = goundHeaderStr;
    gound.goundHeaderHeight = goundHeaderHeight;
    gound.goundHeaderView = goundHeaderView;
    gound.goundFooterStr = goundFooterStr;
    gound.goundFooterHeight = goundFooterHeight;
    gound.goundFooterView = goundFooterView;
    gound.rowHeight = itemsRowHeigh;
    return gound;
}

@end

@interface FQ_SettingBaseTableCell ()

/**
 *  开关样式
 */
@property (nonatomic, strong) UISwitch *switchView;

/**
 *  内容图
 */
@property (nonatomic, strong) UIImageView *contentImgView;

/**
 *  内容文本label
 */
@property (nonatomic, strong) UILabel *labelView;


@end

@implementation FQ_SettingBaseTableCell

+ (instancetype)cellWithTableView:(UITableView *)tableView andIndex:(NSIndexPath *)indexPath  andGroups:(NSMutableArray *)groups {
    FQ_SettingBaseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:MineSettingID forIndexPath:indexPath];
    [[cell.contentView viewWithTag:CustomViewTag] removeFromSuperview];
    FQ_SettingBaseGound *group = groups[indexPath.section];
    FQ_SettingBaseItem *baseItem = group.items[indexPath.row];
    
    baseItem.itemRowHeight = (group.rowHeight != DefaultH && baseItem.itemRowHeight == DefaultH) ? group.rowHeight : baseItem.itemRowHeight;
    cell.baseItem = baseItem;
    
    
    return cell;
}

#pragma mark ============ 初始化 ==============

/**
 * 创建新控件
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}
/**
 *通过xib创建
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

/**
 *  加载各个控件
 */
-(void)setup
{
    self.textLabel.font = Big_TEXT_FONT;
    self.detailTextLabel.font = Smo_TEXT_FONT;
    self.labelView.font = Mid_TEXT_FONT;
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    self.contentImgView.contentMode = UIViewContentModeScaleAspectFit;
}


#pragma mark ============ 布局子控件 ==============

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat contentImgW =  MIN((AltogetherH - 2 * margin), MIN(_baseItem.contentImage.size.width, _baseItem.contentImage.size.height));
    CGFloat contentImgH = contentImgW;
    
    if (self.baseItem.customContentImgHW != 0) {
        contentImgW  = self.baseItem.customContentImgHW;
        contentImgH = contentImgW;
    }
    
    //处理
    if (self.baseItem.customTitleImgHW != 0) {
        CGFloat imgX = X(self.imageView);
        CGFloat imgY = (H(self.contentView) - self.baseItem.customTitleImgHW)*0.5;
        
        self.imageView.frame = CGRectMake(imgX, imgY,self.baseItem.customTitleImgHW , self.baseItem.customTitleImgHW);
        
        CGFloat imgMargin = H(self.contentView) - self.baseItem.customTitleImgHW;
        setFrameX(self.textLabel, X(self.textLabel) - imgMargin);
        setFrameX(self.detailTextLabel, X(self.detailTextLabel) - imgMargin);
    }
    
    [self layoutContentView:contentImgW];
    
}

-(void)layoutContentView:(CGFloat)contentImgWH
{
    
    CGFloat arrowW = ScreenW - self.contentView.bounds.size.width;
    CGFloat contentImgX = ScreenW - contentImgWH - arrowW;
    CGFloat contentImgY = 1.0*(AltogetherH - contentImgWH)/2;
    
    self.contentImgView.frame = CGRectMake(contentImgX, contentImgY, contentImgWH, contentImgWH);
    
    if (self.baseItem.baseType == BaseCellTypeLabel_Arrow_Center) {
        //重新布局中间label.
        self.textLabel.frame = self.bounds;
        
    }else{
        setFrameW(self.textLabel, W(self.contentView) - X(self.textLabel));
    }
    
    setFrameW(self.detailTextLabel, W(self.contentView) - X(self.detailTextLabel));
    
    if (self.baseItem.isArrow) {
        self.labelView.frame = self.contentView.bounds;
    }else{
        self.labelView.frame = self.contentView.bounds;
        setFrameW(self.labelView, W(self.labelView) - margin);
    }
    
}


#pragma mark ============ 初始化控件内容 ==============

/**
 *  设置所有属性
 *
 */
-(void)setBaseItem:(FQ_SettingBaseItem *)baseItem
{
    _baseItem = baseItem;
    [self setupData];
    [self settingUIColor];
    [self creatCellUIWithItem:baseItem];
}

/**
 *  设置子控件内容
 */
- (void)setupData {
    
    if (_baseItem.titleImage) {
        self.imageView.image = _baseItem.titleImage;
    } else {
        self.imageView.image = nil;
    }
    self.textLabel.text = self.baseItem.titleStr;
    self.detailTextLabel.text = self.baseItem.detailStr;
    if (self.baseItem.isIMGRounded)
    {
        //圆角处理
    }else{
    }
    
    
    if (_baseItem.contentImage) {
        self.contentImgView.image =  _baseItem.contentImage;
    } else {
        self.contentImgView.image = nil;
    }
    
    if (self.baseItem.isContentIMGRound) {
        
        //圆角处理
        
    }else{
    }
    
}


/**
 *  设置统一的颜色
 */
-(void)settingUIColor
{
    self.textLabel.textColor = self.baseItem.customColor == nil? [UIColor blackColor] : self.baseItem.customColor;
    self.detailTextLabel.textColor = self.baseItem.detailColor == nil? [UIColor grayColor] : self.baseItem.detailColor;
    self.selectedBackgroundView.backgroundColor = self.baseItem.selctColor == nil? [UIColor orangeColor] : self.baseItem.selctColor;
    self.labelView.textColor = self.baseItem.labelViewTextColor == nil? [UIColor grayColor] : self.baseItem.labelViewTextColor;
}



//根据单个模型设置其UI
-(void)creatCellUIWithItem:(FQ_SettingBaseItem *)baseItem{
    // 设置cell的选中样式
    self.selectionStyle = self.baseItem.baseType == BaseCellTypeSwitch?UITableViewCellSelectionStyleNone:UITableViewCellSelectionStyleDefault;
    [self.labelView removeFromSuperview];
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    self.labelView = nil;
    self.accessoryView = nil;
    self.accessoryType = UITableViewCellAccessoryNone;
    // custom自定义样式
    if (baseItem.baseType == BaseCellTypeCustom)
    {
        self.accessoryType = UITableViewCellAccessoryNone;
        [self.contentView addSubview:baseItem.customView];
        baseItem.customView.tag = CustomViewTag;
        
        if(baseItem.itemRowHeight != DefaultH)
        {
            baseItem.customView.frame = CGRectMake(0, 0, ScreenW, baseItem.itemRowHeight);
        }else{
            
            baseItem.customView.frame = CGRectMake(0, 0, ScreenW, DefaultCellH);
        }
    }else if(baseItem.baseType == BaseCellTypeSwitch){
        
        self.switchView.on = self.baseItem.isOpenSwitch;
        self.accessoryView = self.switchView;
        
    }else if(baseItem.baseType == BaseCellTypeLabel_Arrow)
    {
        [self.contentView addSubview:self.labelView];
        self.labelView.text = baseItem.contentStr;
        self.accessoryType = baseItem.isArrow == YES ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    }else if(baseItem.baseType == BaseCellTypeImage_Arrow)
    {
        self.accessoryType = baseItem.isArrow == YES ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
        [self.contentView addSubview:self.contentImgView];
        
    }else if(baseItem.baseType == BaseCellTypeLabel_Arrow_Center)
    {
        self.accessoryType = baseItem.isArrow == YES ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
    }else{
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}




#pragma mark - 懒加载控件

/**
 *  显示的开关
 */
- (UISwitch *)switchView {
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self action:@selector(stValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}
/**
 *  内容label
 */
- (UILabel *)labelView {
    if (_labelView == nil) {
        _labelView = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelView.backgroundColor = [UIColor clearColor];
        _labelView.font = Mid_TEXT_FONT;
        _labelView.textAlignment = NSTextAlignmentRight;
        _labelView.textColor = self.baseItem.labelViewTextColor == nil? [UIColor grayColor] : self.baseItem.labelViewTextColor;
    }
    return _labelView;
}

//内容图片
-(UIImageView *)contentImgView
{
    if (!_contentImgView) {
        _contentImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, AltogetherH - margin, AltogetherH - margin)];
        _contentImgView.image = _baseItem.contentImage;
        
    }
    return _contentImgView;
}


/**
 *  监听开关值改变事件
 */
- (void)stValueChanged: (UISwitch *)sender{
    
    if (self.baseItem.changSwitchBlock)
    {
        self.baseItem.changSwitchBlock(sender.on);
    }
    
}

@end

@interface FQ_SettingBaseVC ()

@end

@implementation FQ_SettingBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view  addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}


#pragma mark ------------/ ***  数据源方法  *** /------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    FQ_SettingBaseGound  *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FQ_SettingBaseTableCell *cell = [FQ_SettingBaseTableCell cellWithTableView:tableView andIndex:indexPath andGroups:self.groups];
    return cell;
}




#pragma mark ------------/ ***  代理方法  *** /------------
/**
 *  返回第section组的组标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    FQ_SettingBaseGound *group = self.groups[section];
    return group.goundHeaderStr;
}
/**
 *  返回第section组的尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    FQ_SettingBaseGound *group = self.groups[section];
    return group.goundFooterStr;
}
/**
 *  返回第section组的组头View
 */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    FQ_SettingBaseGound *group = self.groups[section];

    if (group.goundHeaderView) {
        return group.goundHeaderView;
    }

    return  nil;
}
/**
 *  返回第section组的组尾View
 */
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    FQ_SettingBaseGound *group = self.groups[section];
    if (group.goundFooterView) {
        return  group.goundFooterView;
    }
    return nil;
}

/**
 *  单独设置某一个cell的高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FQ_SettingBaseGound *baseGound = self.groups[indexPath.section];
    FQ_SettingBaseItem *baseItem = baseGound.items[indexPath.row];
    
    if (baseItem.itemRowHeight != DefaultH)
    {
        return  baseItem.itemRowHeight;
    }
    
    if (baseGound.rowHeight != DefaultH)
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

    if (baseGound.goundHeaderHeight != DefaultH)
    {
        return  baseGound.goundHeaderHeight;
    }

    return 15;
}
/**
 *  单独设置某一个cell的组尾高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    FQ_SettingBaseGound *baseGound = self.groups[section];
    if (baseGound.goundFooterHeight != DefaultH)
    {
        return  baseGound.goundFooterHeight;

    }
    return 0;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FQ_SettingBaseGound *group = self.groups[indexPath.section];
    FQ_SettingBaseItem *baseItem = group.items[indexPath.row];
    
    if (baseItem.baseItemBlock)
    {
        baseItem.baseItemBlock();
        return;
    }
    
    if(baseItem.baseType != BaseCellTypeSwitch && baseItem.controller) {
        // 获得目标控制器
        UIViewController *destVc = baseItem.controller;
        // 设置目标控制器的标题
        destVc.title = baseItem.titleStr;
        // 跳转
        [self.navigationController pushViewController:destVc animated:YES];
    }
}


#pragma mark ------------/ ***  数据初始化方法  *** /------------

- (NSMutableArray *)groups {
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[FQ_SettingBaseTableCell class] forCellReuseIdentifier:MineSettingID];
    }
    return _tableView;
}

@end
