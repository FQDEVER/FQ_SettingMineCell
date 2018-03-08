//
//  FQ_SettingBaseVC.h
//  TestDemo
//
//  Created by mac on 2017/8/29.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DefaultH  999.0f

//获取当前cell的高度
#define AltogetherH  self.frame.size.height
#define ScreenW      [UIScreen mainScreen].bounds.size.width
#define ScreenH      [UIScreen mainScreen].bounds.size.height

//间隙距离
#define margin  10
//默认cell的高度
#define DefaultCellH 44
//自定义View的tag.
#define CustomViewTag 888


#define GetSystemVersion     [[[UIDevice currentDevice] systemVersion] floatValue]
#define Set_PingFangSC_Regular_Font(Size) (GetSystemVersion >= 8.0 && GetSystemVersion < 9.0) ? [UIFont systemFontOfSize:Size] : [UIFont fontWithName:@"PingFangSC-Regular" size:Size]
#define Set_PingFangHK_Regular_Font(Size) (GetSystemVersion >= 8.0 && GetSystemVersion < 9.0) ? [UIFont systemFontOfSize:Size] : [UIFont fontWithName:@"PingFangHK-Regular" size:Size]
#define Set_PingFangSC_Semibold_Font(Size) (GetSystemVersion >= 8.0 && GetSystemVersion < 9.0) ? [UIFont systemFontOfSize:Size] : [UIFont fontWithName:@"PingFangSC-Semibold" size:Size]
#define Set_PingFangSC_Medium_Font(Size) (GetSystemVersion >= 8.0 && GetSystemVersion < 9.0) ? [UIFont systemFontOfSize:Size] : [UIFont fontWithName:@"PingFangSC-Medium" size:Size]


//重新设定view的Y值
#define setFrameY(view, newY) view.frame = CGRectMake(view.frame.origin.x, newY, view.frame.size.width, view.frame.size.height)
#define setFrameX(view, newX) view.frame = CGRectMake(newX, view.frame.origin.y, view.frame.size.width, view.frame.size.height)
#define setFrameH(view, newH) view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, newH)
#define setFrameW(view, newW) view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, newW, view.frame.size.height)

//取view的坐标及长宽
#define W(view)    view.frame.size.width
#define H(view)    view.frame.size.height
#define X(view)    view.frame.origin.x
#define Y(view)    view.frame.origin.y


#define Big_TEXT_FONT [UIFont systemFontOfSize:18]
#define Mid_TEXT_FONT [UIFont systemFontOfSize:16]
#define Smo_TEXT_FONT [UIFont systemFontOfSize:14]
#define SettingColor [UIColor colorWithRed:204/255.0 green:88/255.0 blue:74/255.0 alpha:1]

#define RGBA(r, g, b, a)           [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                RGBA(r, g, b, 1.0f)


typedef enum
{
    //自定义样式
    BaseCellTypeCustom,
    //标题图->标题 ->文本->箭头样式
    BaseCellTypeLabel_Arrow,
    //标题图->标题 ->内容图->箭头样式
    BaseCellTypeImage_Arrow,
    //标题图->标题 ->开关
    BaseCellTypeSwitch,
    //标题图->标题居中->箭头样式
    BaseCellTypeLabel_Arrow_Center,
}BaseCellType;

static NSString *MineSettingID = @"Mine_setting";

@interface FQ_SettingBaseItem : NSObject
/**
 *  标题的名称
 */
@property (copy, nonatomic) NSString *titleStr;
/**
 *  详细情况
 */
@property (nonatomic, strong) NSString *detailStr;
/**
 *  标题图片
 */
@property (copy, nonatomic) UIImage *titleImage;
/**
 *  文本
 *  如: 图片->标题 ->文本->箭头样式 中的文本
 */
@property (nonatomic, strong) NSString *contentStr;
/**
 * cell的样式
 */
@property (assign, nonatomic) BaseCellType baseType;
/**
 *  需要跳转的控制器
 */
@property (strong, nonatomic) UIViewController  *controller;
/**
 *  开关的状态
 */
@property (nonatomic, assign) BOOL isOpenSwitch;
/**
 * 点击开关回调block
 *
 */
@property (nonatomic, copy) void(^changSwitchBlock)(BOOL on);

/**
 *  标题图是否圆角处理
 */
@property (nonatomic, assign) BOOL isIMGRounded;
/**
 *  内容图是否圆角处理
 */
@property (nonatomic, assign) BOOL isContentIMGRound;

/**
 *  cell不跳转控制器,需要做其他操作,可使用该block
 *  例如: 版本检测
 */
@property (nonatomic, copy) void(^baseItemBlock)();
/**
 *  自定义View样式
 */
@property (nonatomic, strong) UIView *customView;
/**
 *  内容图片
 */
@property (nonatomic, strong) UIImage *contentImage;
/**
 *  自定义标题字体颜色
 */
@property (nonatomic, strong) UIColor *customColor;
/**
 *  自定义详情文字的颜色
 */
@property (nonatomic, strong) UIColor *detailColor;
/**
 *  自定义cell的选中颜色
 */
@property (nonatomic, strong) UIColor *selctColor;
/**
 *  自定义cell的高度.优先级高于组高度
 */
@property (nonatomic, assign) CGFloat itemRowHeight;

/**
 *  自定义内容文本字体颜色
 */
@property (nonatomic, assign) UIColor *labelViewTextColor;

/**
 * 自定义标题图尺寸,默认随着cell的变化而变化
 */
@property (nonatomic, assign) CGFloat customTitleImgHW;

/**
 * 自定义内容图尺寸,默认随着cell的变化而变化
 */
@property (nonatomic, assign) CGFloat customContentImgHW;

/**
 是否显示箭头.默认为YES.
 */
@property (nonatomic, assign) BOOL isArrow;


/**
 标题图->标题 ->文本->箭头样式
 主要设置基本数据,
 其他:iconSize/titleColor/contentColor/ContentImgSize/均可自定义设置
 
 @param icon       标题图/可不设置传入nil
 @param titleStr   标题文本
 @param contentStr 内容文本/可不设置传入nil
 @param controller 跳转控制器
 
 @return baseItem模型
 */
+(instancetype)settingItemDataWithIconImg:(UIImage *)icon TitleStr:(NSString *)titleStr   ContentStr:(NSString *)contentStr andController:(UIViewController *)controller;


/**
 标题图->标题->内容图->箭头样式
 
 @param titleImage   标题图/可不设置传入nil
 @param titleStr     标题文本
 @param contentImage 内容图/可不设置传入nil
 @param controller   跳转控制器
 @return baseItem模型
 */
+(instancetype)settingItemDataWithTitleImage:(UIImage *)titleImage TitleStr:(NSString *)titleStr ContentImage:(UIImage *)contentImage andController:(UIViewController *)controller;

/**
 标题图->标题->开关
 
 @param titleImage   标题图/可不设置传入nil
 @param titleStr     标题
 @param isOpenSwitch 开关状态
 @param changBlock   回调block
 
 @return baseItem模型
 */
+(instancetype)settingItemDataWithTitleImage:(UIImage *)titleImage TitleStr:(NSString *)titleStr Switch:(BOOL)isOpenSwitch andChangBlock:(void(^)(BOOL on))changBlock;

/**
 标题图->标题(居中)->箭头
 
 @param titleImage 标题图/可不设置传入nil
 @param centerStr  标题(居中)
 @param controller 跳转控制器
 
 @return baseItem模型
 */
+(instancetype)settingItemDataWithTitleImage:(UIImage *)titleImage CenterTitleStr:(NSString *)centerStr andController:(UIViewController *)controller;

/**
 custom自定义样式
 
 @param customView 自定义view
 @param controller 跳转控制器
 
 @return baseItem模型
 */
+(instancetype)settingItemDataWithCustomView:(UIView *)customView andController:(UIViewController *)controller;

@end
@interface FQ_SettingBaseGound : NSObject

/**
 cell组数据
 */
@property (nonatomic, strong) NSArray *items;

/**
 cell组的组头文本
 */
@property (nonatomic, strong) NSString *goundHeaderStr;

/**
 cell组的组尾文本
 */
@property (nonatomic, strong) NSString *goundFooterStr;

/**
 该组行高
 */
@property (nonatomic, assign)  CGFloat  rowHeight;

/**
 cell组的组头View
 */
@property (nonatomic, strong) UIView * goundHeaderView;

/**
 cell组的组尾的View
 */
@property (nonatomic, strong) UIView * goundFooterView;
/**
 *  设置该组的组头高度
 */
@property (nonatomic, assign) CGFloat  goundHeaderHeight;
/**
 *  设置改组的组尾高度
 */
@property (nonatomic, assign) CGFloat  goundFooterHeight;



/**
 *  最基本的无组头,无组尾样式
 *
 *  @param items item数组模型
 *
 *  @return 返回一个cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items;


/**
 *  只有组头(View)
 *
 *  @param items           item模型数组
 *  @param goundHeaderView   组头(view)
 *  @param goundHeaderHeight 组头高度
 *
 *  @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items HeaderView:(UIView *)goundHeaderView HeaderHeight:(CGFloat)goundHeaderHeight;

/**
 *  只有组头(文字)
 *
 *  @param items           item模型数组
 *  @param goundHeaderStr       组头(文字)
 *  @param goundHeaderHeight 组头高度
 *
 *  @return cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items HeaderStr:(NSString *)goundHeaderStr HeaderHeight:(CGFloat)goundHeaderHeight;


/**
 *  只是设置组高
 *
 *  @param items     item模型数组
 *  @param rowHeight 组中所有item的行高
 *
 *  @return 返回一个cell组模型
 */
+(instancetype)settingBaseGoundWithItems:(NSArray *)items RowHeight:(CGFloat)rowHeight;


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
+(instancetype)settingBaseGoundWithItems:(NSArray *)items HeaderStr:(NSString *)goundHeaderStr headerView:(UIView *)goundHeaderView  HeaderHeight:(CGFloat)goundHeaderHeight FooterStr:(NSString *)goundFooterStr FooterView:(UIView *)goundFooterView FooterHeight:(CGFloat)goundFooterHeight ItemRowHeight:(CGFloat)itemsRowHeigh;



@end


@interface FQ_SettingBaseTableCell : UITableViewCell
/**
 *  接收外界传入数据
 */
@property (nonatomic, strong)  FQ_SettingBaseItem*baseItem;


//给外界调用的一个cell类方法
+ (instancetype)cellWithTableView:(UITableView *)tableView andIndex:(NSIndexPath *)indexPath andGroups:(NSMutableArray *)groups;


@end


@interface FQ_SettingBaseVC : UIViewController<UITableViewDelegate,UITableViewDataSource>

/**
 *  装所有组模型数组
 */
@property (nonatomic, strong) NSMutableArray *groups;

/**
 tableView
 */
@property (nonatomic, strong) UITableView *tableView;

@end
