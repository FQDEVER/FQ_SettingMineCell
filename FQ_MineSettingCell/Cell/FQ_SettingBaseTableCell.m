//
//  MineBaseTableCell.m
//  jianshu++
//
//  Created by 范奇 on 16/6/22.
//  Copyright © 2016年 范奇. All rights reserved.
//

#import "FQ_SettingBaseTableCell.h"
#import "FQ_SettingBaseItem.h"
#import "FQ_UserDefaults.h"
#import "MineCellLabelButton.h"
#import "UIImage+CreatImage.h"
#import "FQ_SettingBaseGound.h"

//设置 右边图片和label的宽度
#define AltogetherW 120
//获取当前cell的高度
#define AltogetherH self.frame.size.height
//箭头的尺寸
#define ArrowW 14
//间隙距离
#define margin  10

//箭头还有label样式的可重用移除tag值
#define arrowAndLabelViewTag 999
//自定义View,可重用自定tag值
#define selViewTag 888


@interface FQ_SettingBaseTableCell ()
/**
 *  文本标签
 */
@property (nonatomic, strong) UILabel *labelView;
/**
 *  箭头
 */
@property (nonatomic, strong) UIImageView *arrowView;
/**
 *  开关
 */
@property (nonatomic, strong) UISwitch *switchView;

/**
 *  cell底部的 分割线
 */
@property (nonatomic, weak) UIView *lineView;

/**
 *  cell顶部的 分割线
 */
@property (nonatomic, weak) UIView *topLineView;

/**
 *  包含箭头和label的view
 */
@property (nonatomic, strong) MineCellLabelButton *arrowAndLabelView;
/**
 *  包含箭头和label的view
 */
@property (nonatomic, strong) UIView *arrowAndImageView;

@end

@implementation FQ_SettingBaseTableCell

/**
 *  类方法，外界直接调用
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView andIndex:(NSIndexPath *)indexPath andSeparatorType:(BaseCellSeparatorType)separatorType andGroups:(NSMutableArray *)groups andSpaceLenght:(CGFloat) separatorSpaceLenght{
    // 重用标识
    static NSString *ID = @"Mine_setting";
    // 获得cell
    FQ_SettingBaseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[FQ_SettingBaseTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
   

//   解决Label加箭头样式重用的问题
    UIView *dequeueSelView = [cell.contentView viewWithTag:selViewTag];
    if (dequeueSelView) {
        [dequeueSelView removeFromSuperview];
    }
    

//    解决自定义view重用样式的问题
    if ( cell.accessoryView.tag == arrowAndLabelViewTag) {
        cell.arrowAndLabelView = nil;
    }
    

    cell.separatorType = separatorType;
    // 根据组号获得组模型
    FQ_SettingBaseGound *group = groups[indexPath.section];
    // 根据行号获得item模型
    FQ_SettingBaseItem *baseItem = group.items[indexPath.row];
    
    if (baseItem.baseType == BaseCellTypeNone)
    {
        [cell.contentView addSubview:baseItem.selView];
        baseItem.selView.tag = selViewTag;
        if (group.rowHeight != 0)
        {
            baseItem.selView.frame = CGRectMake(0, 1, screen_width, group.rowHeight-1);
        }
        else
        {
            baseItem.selView.frame = CGRectMake(0, 1, screen_width, 40-1);
        }
        if(baseItem.itemRowHeight != 0)
        {
            baseItem.selView.frame = CGRectMake(0, 1, screen_width, baseItem.itemRowHeight-1);
            
        }
        
    }
    
    
    // 设置是否显示分割线
    cell.showTopLineView = indexPath.row == 0;
    if (separatorType == BaseCellSeparatorTypeTop) {
        //最顶部 和 最底部
        cell.showTopLineView = indexPath.row == 0;
        cell.showLineView = indexPath.row == group.items.count - 1;
    }
    else if(separatorType == BaseCellSeparatorTypeBottom)
    {
        cell.showTopLineView = indexPath.row != 0;
        cell.showLineView = indexPath.row != group.items.count - 1;
    }
    else if (separatorType == BaseCellSeparatorTypeNone)
    {
        cell.showTopLineView = NO;
    }
    
    //设置分割线前端预留空格长度
    cell.separatorSpaceLenght = separatorSpaceLenght;
    
    if (group.goundSeparatorSpaceLenght != 0) {
        cell.separatorSpaceLenght = group.goundSeparatorSpaceLenght;
    }
    // 传递数据
    cell.baseItem = baseItem;
    
    
    return cell;
}
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
    // 添加底部的分割线
    UIView *lineView = [[UIView alloc] init];

    // 设置透明度
    lineView.alpha = 0.3;
    // 将分割线添加到cell的contentView上
    [self.contentView addSubview:lineView];
    self.lineView = lineView;
    
    // 添加顶部的分割线
    UIView *topLineView = [[UIView alloc] init];
    // 设置透明度
    topLineView.alpha = 0.3;
    // 将分割线添加到cell的contentView上
    [self.contentView addSubview:topLineView];
    self.topLineView = topLineView;
    
    
    //设置标签字体
    self.textLabel.font = Mid_TEXT_FONT;

    
    //设置详情字体
    self.detailTextLabel.font = Smo_TEXT_FONT;
   
    
    //设置选中背景颜色
    UIView *selectedBgView = [[UIView alloc] init];

    self.selectedBackgroundView = selectedBgView;

}

/**
 *  设置统一的颜色
 */
-(void)settingUIColor
{
    // 设置颜色
    self.lineView.backgroundColor = self.baseItem.separatorColor == nil? [UIColor grayColor] : self.baseItem.separatorColor;
    self.topLineView.backgroundColor = self.lineView.backgroundColor;
    
    self.textLabel.textColor = self.baseItem.diyColor == nil? [UIColor blackColor] : self.baseItem.diyColor;
    self.detailTextLabel.textColor = self.baseItem.detailColor == nil? [UIColor grayColor] : self.baseItem.detailColor;
    self.selectedBackgroundView.backgroundColor = self.baseItem.selctColor == nil? [UIColor orangeColor] : self.baseItem.selctColor;
    self.labelView.textColor = self.baseItem.labelViewTextColor == nil? [UIColor grayColor] : self.baseItem.labelViewTextColor;
}




#pragma mark - 布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imgW = AltogetherH - 2 * margin;
    CGFloat imgH = imgW;
    
    if (self.baseItem.customFrontImgHeightAndWidth != 0) {
        imgW = self.baseItem.customFrontImgHeightAndWidth;
        imgH = imgW;
    }
 
 
    //图片的宽高本质应该随着cell的高度变化,也可以自己设定死
    CGFloat imgX = margin;
    CGFloat imgY = 1.0*(AltogetherH - imgH)/2;
    
    CGFloat titW = self.textLabel.frame.size.width ;
    CGFloat titH = self.textLabel.frame.size.height;
    CGFloat titY = self.textLabel.frame.origin.y;
    CGFloat titOldX = self.textLabel.frame.origin.x;
    CGFloat titX = imgW +2 *margin;

//如果是文字剧居中的样式
    if (self.baseItem.baseType == BaseCellTypeCenterLabel) {
        //        重置label的X
      CGFloat centerTitX = (screen_width - titW)*0.5;
      self.textLabel.textAlignment = NSTextAlignmentCenter;
        
      self.textLabel.textColor = self.baseItem.diyColor == nil? [UIColor grayColor] : self.baseItem.diyColor;
      self.textLabel.frame =CGRectMake(centerTitX, titY, titW, titH);
    
    }
    else
    {
     self.textLabel.textAlignment = NSTextAlignmentRight;
     self.textLabel.frame = CGRectMake(titX, titY, titW, titH);
    }
    
    self.imageView.frame = CGRectMake(imgX, imgY, imgW, imgH);
 
    //添加这个判断,防止cell重用的问题
    if(self.baseItem.baseType == BaseCellTypeArrow||self.baseItem.baseType == BaseCellTypeLabel)
    {
        self.textLabel.textAlignment = NSTextAlignmentRight;
        self.textLabel.frame = CGRectMake(titOldX, titY, titW, titH);
    }
    
    
    //设置分割线的frame
    CGFloat lineH = 1;
    CGFloat lineX = 0;
    CGFloat lineY = self.frame.size.height - lineH;
    CGFloat lineW = self.frame.size.width - lineX;
    

    switch (self.separatorType) {
        case BaseCellSeparatorTypeNone:
            lineX = screen_width;
            break;
        case BaseCellSeparatorTypeAll:
            lineX = self.separatorSpaceLenght;
            self.topLineView.frame = CGRectMake(lineX, 0, lineW, lineH);
            break;
        case BaseCellSeparatorTypeToText:
            lineX = self.textLabel.frame.origin.x ;
            break;
        case BaseCellSeparatorTypeTop:
            lineX = self.separatorSpaceLenght;
            self.topLineView.frame = CGRectMake(lineX, 0, lineW, lineH);
            break;
        case BaseCellSeparatorTypeBottom:
            lineX = self.separatorSpaceLenght;
            break;
    }
    
    self.lineView.frame = CGRectMake(lineX, lineY, lineW, lineH);

    setFrameX(self.detailTextLabel, titX);

}


/**
 *  设置图片的圆角
 *
 *  @param otherView 需要剪切的view
 *  @param radius  裁剪的弧度
 */
- (void) settingRadiusWith:(UIImageView *)otherImageView
{
    otherImageView.image = [otherImageView.image creatCircleImage];
}


/**
 *  设置所有属性
 *
 */
-(void)setBaseItem:(FQ_SettingBaseItem *)baseItem
{
    _baseItem = baseItem;
    // 设置子控件内容
    [self setupData];
    // 设置cell右边显示的辅助附件
    [self setupRightAccessory];
    //设置所有的颜色
    [self settingUIColor];
    
}


/**
 *  是否显示底部分割线
 */
- (void)setShowLineView:(BOOL)showLineView {
    _showLineView = showLineView;
    self.lineView.hidden = !showLineView;
}
/**
 *  是否显示顶部分割线
 */
-(void)setShowTopLineView:(BOOL)showTopLineView
{
    _showTopLineView = showTopLineView;
    self.topLineView.hidden = !showTopLineView;
}



/**
 *  设置子控件内容
 */
- (void)setupData {
    if (_baseItem.icon) {
        self.imageView.image = [UIImage imageNamed:self.baseItem.icon];
    } else {
        self.imageView.image = nil;
    }
    self.textLabel.text = self.baseItem.title;
    self.detailTextLabel.text = self.baseItem.detailTitle;
    if (self.baseItem.isIMGRounded)
    {
        [self settingRadiusWith:self.imageView];
    }
    
}

/**
 *  设置cell右边显示的辅助附件
 */
- (void)setupRightAccessory {

    // 设置cell的选中样式
    self.selectionStyle = self.baseItem.baseType == BaseCellTypeSwitch?UITableViewCellSelectionStyleNone:UITableViewCellSelectionStyleDefault;
    //只有箭头的样式
    if (self.baseItem.baseType == BaseCellTypeArrow)
    {
        self.accessoryView = self.arrowView;
    }
    //只有开关 的样式
    else if (self.baseItem.baseType == BaseCellTypeSwitch)
    {
        // 从沙盒中读取开关状态
        self.switchView.on = [FQ_UserDefaults userDefaultsBOOLForKey:self.baseItem.title];
        self.accessoryView = self.switchView;
    }
    //只有一个label的样式
    else if (self.baseItem.baseType == BaseCellTypeLabel)
    {
        self.labelView.text = self.baseItem.lalelText;
        self.accessoryView = self.labelView;
    }
    //有一个label和一个箭头的样式
    else if(self.baseItem.baseType == BaseCellTypeLabelAndArrow)
    {
        self.accessoryView = self.arrowAndLabelView;
    }
    //有一个图片和一个箭头的样式
    else if(self.baseItem.baseType == BaseCellTypeImageAndArrow || self.baseItem.baseType ==BaseCellTypeSmo_ImageAndArrow)
    {
        self.accessoryView = self.arrowAndImageView;
    }
    //有一个图片 文字居中  一个箭头的样式
    else if(self.baseItem.baseType == BaseCellTypeCenterLabel)
    {
        self.accessoryView = self.arrowView;
    }
    else
    {
        self.accessoryView = nil;
        
    }
}

#pragma mark - 懒加载控件
/**
 *  显示箭头的View
 */
- (UIImageView *)arrowView {
    if (_arrowView == nil) {
        // 创建箭头控件
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow_next~iphone"]];
    }
    return _arrowView;
}
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
 *  只显示的Lable,没有箭头样式
 */
- (UILabel *)labelView {
    if (_labelView == nil) {
        _labelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, AltogetherW, 3 * margin)];
        _labelView.font = Mid_TEXT_FONT;
        _labelView.textAlignment = NSTextAlignmentRight;
    }
    return _labelView;
}
/**
 * 显示lable + 箭头样式
 */
-(UIView *)arrowAndLabelView{
    
    
    if (_arrowAndLabelView == nil)
    {
        _arrowAndLabelView = [[MineCellLabelButton  alloc]initWithFrame:CGRectMake(0, 0, AltogetherW, 3 * margin)];
        _arrowAndLabelView.tag = arrowAndLabelViewTag;
        
        _arrowAndLabelView.userInteractionEnabled = NO;
        [_arrowAndLabelView setTitleColor:(self.baseItem.diyColor == nil? [UIColor grayColor] : self.baseItem.diyColor) forState:UIControlStateNormal];
        [_arrowAndLabelView setImage:[UIImage imageNamed:@"icon_arrow_next~iphone"] forState:UIControlStateNormal];
        [_arrowAndLabelView setTitle:self.baseItem.lalelText forState:UIControlStateNormal];

        _arrowAndLabelView.titleLabel.font = Mid_TEXT_FONT;
    }
    return _arrowAndLabelView;
}

/**
 *  箭头加图片的样式
 *
*/
-(UIView *)arrowAndImageView{
    if (_arrowAndImageView == nil)
    {
        CGFloat imgW = AltogetherH -  margin ;
        if (self.baseItem.customLastImgHeightAndWidth != 0) {
            imgW = self.baseItem.customLastImgHeightAndWidth;
        }
        
        _arrowAndImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AltogetherW,AltogetherH)];
        UIImageView *headView= [[UIImageView alloc]initWithFrame:CGRectMake(AltogetherW -ArrowW - imgW - 10, (AltogetherH - imgW)*0.5, imgW, imgW)];
        
        headView.image = self.baseItem.headImage;
        if (self.baseItem.isLastImgRound) {
            [self settingRadiusWith:headView];
        }
        
        
        UIImageView *arrowImg = [[UIImageView alloc]initWithFrame:CGRectMake(AltogetherW - ArrowW,(AltogetherH - ArrowW)*0.5,ArrowW, ArrowW)];
        UIImage *img = [UIImage imageNamed:@"icon_arrow_next~iphone"];
        arrowImg.image = img;
        [_arrowAndImageView addSubview:headView];
        [_arrowAndImageView addSubview:arrowImg];
    }
    return _arrowAndImageView;
}

/**
 *  监听开关值改变事件
 */
- (void)stValueChanged: (UISwitch *)sender{
    //就当前的开关状态用自己的名字保存到偏好设置中
    [FQ_UserDefaults userDefaultsSetBOOL:self.switchView.on forKey:self.baseItem.title];

    if (self.baseItem.changBlock)
    {
        self.baseItem.changBlock(sender.on);
    }
  
}



@end
