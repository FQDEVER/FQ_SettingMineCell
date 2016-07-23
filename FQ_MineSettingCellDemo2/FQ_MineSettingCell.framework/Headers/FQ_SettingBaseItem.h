//
//  JSSettingBaseItem.h
//  jianshu++
//
//  Created by 范奇 on 16/6/22.
//  Copyright © 2016年 范奇. All rights reserved.
//
/**
 *  这个是保存每组设置有多少个数据
 */
#import <UIKit/UIKit.h>


typedef enum
{
    //带箭头样式
    BaseCellTypeArrow,
    //带开关样式
    BaseCellTypeSwitch,
    //带label样式
    BaseCellTypeLabel,
    //带lable和箭头样式
    BaseCellTypeLabelAndArrow,
    //自定义样式
    BaseCellTypeNone,
    //带尾部图片和箭头样式,标题图片为大图样式
    BaseCellTypeImageAndArrow,
    //带尾部图片和箭头样式,标题图片为小图样式
    BaseCellTypeSmo_ImageAndArrow,
    //中间是自定的label
    BaseCellTypeCenterLabel,
}BaseCellType;



@interface FQ_SettingBaseItem : NSObject
/**
 *  标题的名称
 */
@property (copy, nonatomic) NSString *title;
/**
 *  详细情况
 */
@property (nonatomic, strong) NSString *detailTitle;
/**
 *  标题图片
 */
@property (copy, nonatomic) NSString *icon;
/**
 *  label样式的文字
 *  如: 图片 -> 标题  ->文字->箭头样式的第二个文字
 */
@property (nonatomic, strong) NSString *lalelText;
/**
 * cell的样式
 */
@property (assign, nonatomic) BaseCellType baseType;
/**
 *  需要跳转的控制器
 */
@property (assign, nonatomic) Class controller;
/**
 *  开关的状态
 */
@property (nonatomic, assign) BOOL isOpenSwitch;
/**
 * 当开关的转变的时候调用这个block
 *
 */
@property (nonatomic, copy) void(^changBlock)(BOOL on);

/**
 *  判断前面图片是否圆角处理
 */
@property (nonatomic, assign) BOOL isIMGRounded;
/**
 *  判断尾部图片是否需要圆角处理
 */
@property (nonatomic, assign) BOOL isLastImgRound;


/**
 *  cell不跳转控制器,需要做其他操作,可使用该block
 *  例如: 版本检测
 */
@property (nonatomic, copy) void(^baseItemBlock)();
/**
 *  自定义View样式
 */
@property (nonatomic, strong) UIView *selView;
/**
 *  末尾图片样式
 */
@property (nonatomic, strong) UIImage *headImage;

/**
 *  自定义标题和Label的文字颜色
 */
@property (nonatomic, strong) UIColor *diyColor;

/**
 *  自定义详情文字的颜色
 */
@property (nonatomic, strong) UIColor *detailColor;
/**
 *  自定分割线的颜色
 */
@property (nonatomic, strong) UIColor *separatorColor;
/**
 *  设置cell的选中颜色
 */
@property (nonatomic, strong) UIColor *selctColor;
/**
 *  设置cell的高度
 */
@property (nonatomic, assign) CGFloat itemRowHeight;

/**
 *  设置 - 文本标签 - 的颜色 ,右边自定的label的文字
 */
@property (nonatomic, assign) UIColor *labelViewTextColor;

/**
 * 自定义前部图片的尺寸,特别图片需求的情况,自定义图片的高度,默认随着cell的变化而变化
 */
@property (nonatomic, assign) CGFloat customFrontImgHeightAndWidth;

/**
 * 自定义尾部图片的尺寸,特别图片需求的情况,自定义图片的高度,默认随着cell的变化而变化
 */
@property (nonatomic, assign) CGFloat customLastImgHeightAndWidth;





/**
 *  图片->标题  ->箭头样式
 *
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andIcon:(NSString *)icon andController:(Class)controller;

/**
 *  图片->标题    ->labelText->箭头样式
 *
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andIcon:(NSString *)icon andLalelText:(NSString *)lalelText andController:(Class)controller;


/**
 *  图片(大图片样式)->标题  图片->箭头样式
 *
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andBig_Icon:(NSString *)icon andHeadImage:(UIImage *)headImage andController:(Class)controller andLastImageIsRounds:(BOOL)isRounds;
/**
 *  图片(小图片样式)->标题  图片->箭头样式
 *
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andSmo_Icon:(NSString *)icon andHeadImage:(UIImage *)headImage andController:(Class)controller andLastImageIsRounds:(BOOL)isRounds;

/**
 *  图片->标题   ->开关样式
 *
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andIcon:(NSString *)icon andSwitch:(BOOL)isOpenSwitch andChangBlock:(void(^)(BOOL on))changBlock;
/**
 *  标题 -> 文字->箭头样式
 *
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andLalelText:(NSString *)lalelText andController:(Class)controller;
/**
 *  标题 -> 箭头样式
 */
+(instancetype)settingItemDataWithTitle:(NSString *)title andController:(Class)controller;
/**
 *  自定义cell的view
 *
 */
+(instancetype)settingItemDataWithUIView:(UIView *)selView andController:(Class)controller;
/**
 *  图片-> 文字居中->箭头样式
 *
 */
+(instancetype)settingItemDataWithIcon:(NSString *)icon andCenterTitle:(NSString *)title  andTitleColor:(UIColor *)color  andController:(Class)controller;
@end
