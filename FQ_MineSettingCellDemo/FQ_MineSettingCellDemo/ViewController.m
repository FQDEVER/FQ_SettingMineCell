//
//  ViewController.m
//  FQ_SettingCell
//
//  Created by 范奇 on 16/7/8.
//  Copyright © 2016年 范奇. All rights reserved.
//



//1. 如果是文字和View的情况,自己选择一种另一种自己设置

//2. 每一个cell都可以自定义

//jpg格式的会影响布局,这点需要注意


#import "ViewController.h"
#import "CeShiViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    // --------------------- 第 0 组--------------
#pragma mark -- 自定义标题图片样式
    //------0 ->item模型
    FQ_SettingBaseItem *item00 = [FQ_SettingBaseItem settingItemDataWithTitle:@"喜欢的文章" andIcon:@"004" andController:[CeShiViewController class]];
    item00.isIMGRounded = YES;
    item00.customFrontImgHeightAndWidth = 80;
    item00.detailTitle = @"一定记得分享哦,一定记得分享哦";
    // ------0->group组模型
    UILabel *mineView0 = [[UILabel alloc]init];
    mineView0.text = @"第0组组尾View";
    mineView0.textColor = [UIColor orangeColor];
    mineView0.backgroundColor = [UIColor yellowColor];
    mineView0.textAlignment = NSTextAlignmentCenter;
    
    
    FQ_SettingBaseItem *item01 = [FQ_SettingBaseItem settingItemDataWithTitle:@"喜欢的文章" andIcon:@"icon_mine_article_like~iphone" andLalelText:@"1" andController:[CeShiViewController class]];
    item01.itemRowHeight = 100;
    item01.customFrontImgHeightAndWidth = 50;
    item01.detailTitle = @"好的的文章,一定记得分享哦";
    item01.isIMGRounded = YES;
    
    
    
    FQ_SettingBaseGound *group0 = [FQ_SettingBaseGound settingBaseGoundWithItems:@[item00,item01] andGoundFootView:mineView0 andGoundFootHeight:30];
    group0.rowHeight = 100.0f;
    
    group0.goundHead = @" 第 0 组头";
    group0.goundHeadHeight = 30;
    
    
    // --------------------- 第 1 组--------------
    //-------1->item组模型
#pragma mark -- 自定义cell的view
    /**
     *  自定义cell的view
     *
     */
    UILabel *mineView = [[UILabel alloc]init];
    mineView.backgroundColor = [UIColor orangeColor];
    mineView.text = @"好的的文章,一定记得分享哦\n我是第一组第一个cell,满足自定义的view";
    mineView.textColor = [UIColor blackColor];
    mineView.numberOfLines = 0;
    mineView.textAlignment = NSTextAlignmentCenter;
    
    
    
    FQ_SettingBaseItem *item10 = [FQ_SettingBaseItem settingItemDataWithUIView:mineView andController:[CeShiViewController class]];
    item10.separatorColor = [UIColor redColor];
    item10.itemRowHeight = 200.0f;
#pragma mark -- 图片(小)->标题  图片->箭头样式
    /**
     *  图片->标题  图片->箭头样式
     *
     */
    FQ_SettingBaseItem *item11 = [FQ_SettingBaseItem settingItemDataWithTitle:@"我的男神" andSmo_Icon:@"icon_mine_article_like~iphone" andHeadImage:[UIImage imageNamed:@"zhou.jpg"] andController:nil andLastImageIsRounds:YES];
    item11.baseItemBlock = ^{
        NSLog(@"是否跳转");
        
    };
    item11.itemRowHeight = 100;
    item11.customFrontImgHeightAndWidth = 30;
    item11.customLastImgHeightAndWidth = 60;
    item11.isIMGRounded = YES;
#pragma mark -- 图片(大)->标题  图片->箭头样式
    FQ_SettingBaseItem *item12 = [FQ_SettingBaseItem settingItemDataWithTitle:@"我的男神" andBig_Icon:@"icon_mine_article_like~iphone" andHeadImage:[UIImage imageNamed:@"zhou.jpg"] andController:[CeShiViewController class] andLastImageIsRounds:NO];
    item12.customFrontImgHeightAndWidth = 30;
    item12.customLastImgHeightAndWidth = 60;
    item12.itemRowHeight = 100;
    item12.isIMGRounded = YES;
#pragma mark -- 图片 ->标题  -> labelTExt ->箭头 样式
    /**
     *  图片 ->标题  -> labelTExt ->箭头 样式
     */
    FQ_SettingBaseItem *item13 = [FQ_SettingBaseItem settingItemDataWithTitle:@"好的文章" andIcon:@"icon_mine_article_like~iphone" andLalelText:@"1" andController:[CeShiViewController class]];
    item13.itemRowHeight = 100;
    item13.customFrontImgHeightAndWidth = 50;
    item13.detailTitle = @"记得给好评哦";
    // ------1->group组模型
    UILabel *mineView1 = [[UILabel alloc]init];
    mineView1.text = @"第一组组头view";
    mineView1.textColor = [UIColor greenColor];
    mineView1.textAlignment = NSTextAlignmentCenter;
    
    
    FQ_SettingBaseGound *group1 = [FQ_SettingBaseGound settingBaseGoundWithItems:@[item10,item11,item12,item13] andGoundHeadView:mineView1 andGoundHeadHeight:30];
    group1.rowHeight = 44;
    
    
    
    // --------------------- 第 2 组--------------
    //-------2->item组模型
#pragma mark -- 图片->标题   ->开关样式
    /**
     *  图片->标题   ->开关样式
     *
     */
    //@"icon_mine_night~iphone"
    FQ_SettingBaseItem *item20 = [FQ_SettingBaseItem settingItemDataWithTitle:@"动态模式" andIcon:@"icon_share_app~iphone" andSwitch:YES andChangBlock:^(BOOL on) {
        if (on) {
            //            self.dk_manager.themeVersion = DKThemeVersionNight;
            
        }
        else
        {
            //            self.dk_manager.themeVersion = DKThemeVersionNormal;
        }
    }];
    item20.diyColor = [UIColor orangeColor];
    item20.selctColor = [UIColor redColor];
    item20.separatorColor = [UIColor blueColor];
#pragma mark -- 图片->标题  ->箭头样式
    /**
     *  图片->标题  ->箭头样式
     *
     */
    FQ_SettingBaseItem *item21 = [FQ_SettingBaseItem settingItemDataWithTitle:@"德玛西亚" andIcon:@"icon_share_app~iphone" andController:[CeShiViewController class]];
    item21.separatorColor = [UIColor redColor];
#pragma mark --图片->标题    ->labelText->箭头样式
    /**
     *  图片->标题    ->labelText->箭头样式
     *
     */
    FQ_SettingBaseItem *item22 = [FQ_SettingBaseItem settingItemDataWithTitle:@"推送通知"  andIcon:@"icon_share_app~iphone" andLalelText:@"12:00" andController:[CeShiViewController class]];
#pragma mark -- 标题 -> 文字->箭头样式
    /**
     *  标题 -> 文字->箭头样式
     *
     */
    FQ_SettingBaseItem *item23 = [FQ_SettingBaseItem settingItemDataWithTitle:@"分享美食" andLalelText:@"成功分享" andController:[CeShiViewController class]];
#pragma mark ---- 标题 -> 箭头样式
    /**
     *  标题 -> 箭头样式
     */
    FQ_SettingBaseItem *item24 = [FQ_SettingBaseItem settingItemDataWithTitle:@"意见反馈"andController:[CeShiViewController class]];
    item24.separatorColor = [UIColor redColor];
#pragma mark ---- 标题 -> labelTEXT样式
    /**
     *  标题 -> labelTEXT样式
     *
     */
    FQ_SettingBaseItem *item25 = [FQ_SettingBaseItem settingItemDataWithTitle:@"我的收藏" andLalelText:@"我的收藏" andController:[CeShiViewController class]];
    item25.diyColor = [UIColor orangeColor];
    item25.labelViewTextColor = [UIColor redColor];
    item25.selctColor = [UIColor redColor];
    item25.separatorColor = [UIColor blueColor];
    
    
#pragma mark ---- 自定义组头View样式
    // ------1->group组模型
    
    
    //创建一个UIview
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, screen_width, 44);
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, screen_width, 30)];
    label.textColor = [UIColor greenColor];
    label.font = Mid_TEXT_FONT;
    label.text = @"绑定账号";
    
    UILabel *labelDetail = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, screen_width, 10)];
    labelDetail.textColor = [UIColor grayColor];
    labelDetail.font = Smo_TEXT_FONT;
    labelDetail.text = @"出于安全因素,您最初用来创建账户的社交账号不能移除";
    [view addSubview:label];
    [view addSubview:labelDetail];
    
    FQ_SettingBaseGound *group2 = [FQ_SettingBaseGound settingBaseGoundWithItems:@[item20,item21,item22,item23,item24,item25] andGoundHeadView:view andGoundHeadHeight:44];
    
    //如果是文字和View的情况,自己选择一种另一种自己设置
    group2.goundFoot = @" 第 2 组尾 " ;
    group2.goundFootHeight = 30;
    
    
    // --------------------- 第 3 组--------------
    
#pragma mark ---- 图片-> 文字居中->箭头样式
    /**
     *  图片-> 文字居中->箭头样式
     *
     */
    FQ_SettingBaseItem *item30 = [FQ_SettingBaseItem settingItemDataWithIcon:@"icon_mine_rate~iphone" andCenterTitle:@"未绑定" andTitleColor:[UIColor redColor] andController:[CeShiViewController class]];
    
    
#pragma mark -- 标题 -> 文字->箭头样式
    /**
     *  标题 -> 文字->箭头样式
     *
     */
    FQ_SettingBaseItem *item33 = [FQ_SettingBaseItem settingItemDataWithTitle:@"分享XX" andLalelText:@"成功分享" andController:[CeShiViewController class]];
#pragma mark ---- 标题 -> 箭头样式
    /**
     *  标题 -> 箭头样式
     */
    FQ_SettingBaseItem *item34 = [FQ_SettingBaseItem settingItemDataWithTitle:@"意见反馈"andController:[CeShiViewController class]];
    item24.separatorColor = [UIColor redColor];
#pragma mark ---- 标题 -> labelTEXT样式
    /**
     *  标题 -> labelTEXT样式
     *
     */
    FQ_SettingBaseItem *item35 = [FQ_SettingBaseItem settingItemDataWithTitle:@"我的收藏" andLalelText:@"我的收藏" andController:[CeShiViewController class]];
    item25.diyColor = [UIColor orangeColor];
    item25.selctColor = [UIColor redColor];
    item25.separatorColor = [UIColor blueColor];
    
    
    FQ_SettingBaseGound *group3 = [FQ_SettingBaseGound settingBaseGoundWithItems:@[item30,item33,item34,item35] andGoundFoot:@" 第 3 组尾 " andGoundFootHeight:30];
    group3.goundSeparatorSpaceLenght = 100;
    group3.rowHeight = 100;
    
    
    
    // 将组模型添加到组数组中
    [self.groups addObject:group0];
    [self.groups addObject:group1];
    [self.groups addObject:group2];
    [self.groups addObject:group3];
    
#pragma mark ------分割线的样式
    /*
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
     //自定义的
     BaseCellSeparatorTypeDIYLenght
     
     }BaseCellSeparatorType;
     */
    self.separatorType = BaseCellSeparatorTypeAll;
    
    //设置整个tableView分割线的前部空白设置,注意: 选中了到文字样式,分割线下面的设定是无效的
    self.tableViewSeparatorSpaceLenght = 50.0f;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
