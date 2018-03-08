//
//  ViewController.m
//  TestDemo
//
//  Created by mac on 2017/8/29.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self addTableViewCell];
}

-(void)addTableViewCell
{
    TestViewController * testVc = [[TestViewController alloc]init];
    //组0
    FQ_SettingBaseItem * item00 = [FQ_SettingBaseItem settingItemDataWithTitleImage:[UIImage imageNamed:@"userIcon"] TitleStr:@"UserName" ContentImage:[UIImage imageNamed:@"about_share"] andController:testVc];
    item00.detailStr = @"userNum:1824983234";
    item00.customTitleImgHW = 80;
    item00.itemRowHeight = 100;
    
    
    //组1
    FQ_SettingBaseItem * item10 = [FQ_SettingBaseItem settingItemDataWithTitleImage:nil TitleStr:@"头像" ContentImage:[UIImage imageNamed:@"userIcon"] andController:testVc];
    item10.customContentImgHW = 60;
    item10.itemRowHeight = 80;
    
    FQ_SettingBaseItem * item11 = [FQ_SettingBaseItem settingItemDataWithTitleImage:[UIImage imageNamed:@"about_share"] TitleStr:@"朋友圈" ContentImage:[UIImage imageNamed:@"userIcon"] andController:testVc];
    
    FQ_SettingBaseItem * item12 = [FQ_SettingBaseItem settingItemDataWithTitleImage:nil TitleStr:@"朋友圈" ContentImage:[UIImage imageNamed:@"userIcon"] andController:testVc];
    
    //组2
    FQ_SettingBaseItem * item20 = [FQ_SettingBaseItem settingItemDataWithIconImg:[UIImage imageNamed:@"about_clear"] TitleStr:@"清理缓存" ContentStr:@"100M" andController:nil];
    item00.baseItemBlock = ^{
        NSLog(@"确定清理缓存");
    };
    //组3
    FQ_SettingBaseItem * item30 = [FQ_SettingBaseItem settingItemDataWithIconImg:[UIImage imageNamed:@"about_wechat"] TitleStr:@"微信公众号" ContentStr:@"APP" andController:testVc];
    
    FQ_SettingBaseItem * item31 = [FQ_SettingBaseItem settingItemDataWithIconImg:[UIImage imageNamed:@"about_share"] TitleStr:@"分享APP" ContentStr:@"可以的" andController:testVc];
    item31.isArrow = NO;
    
    //组4
    FQ_SettingBaseItem * item40 = [FQ_SettingBaseItem settingItemDataWithIconImg:[UIImage imageNamed:@"about_protocol"] TitleStr:@"免责声明 " ContentStr:nil andController:testVc];
    
    //组5
    FQ_SettingBaseItem * item50 = [FQ_SettingBaseItem settingItemDataWithTitleImage:nil TitleStr:@"新消息通知" ContentImage:nil andController:nil];
    
    FQ_SettingBaseItem * item51 = [FQ_SettingBaseItem settingItemDataWithTitleImage:nil TitleStr:@"隐私" ContentImage:nil andController:nil];
    
    FQ_SettingBaseItem * item52 = [FQ_SettingBaseItem settingItemDataWithTitleImage:nil TitleStr:@"通用" ContentImage:nil andController:nil];
    
    //组6
    FQ_SettingBaseItem * item60 = [FQ_SettingBaseItem settingItemDataWithTitleImage:nil TitleStr:@"添加我的方式" ContentImage:nil andController:nil];
    FQ_SettingBaseItem * item61 = [FQ_SettingBaseItem settingItemDataWithTitleImage:nil TitleStr:@"向我推荐通讯录朋友" Switch:YES andChangBlock:^(BOOL on) {
        NSLog(@"on-====>%zd",on);
    }];
    
    //组7
    FQ_SettingBaseItem * item70 = [FQ_SettingBaseItem settingItemDataWithTitleImage:nil TitleStr:@"添加我的方式" ContentImage:nil andController:nil];
    FQ_SettingBaseItem * item71 = [FQ_SettingBaseItem settingItemDataWithTitleImage:nil TitleStr:@"添加我的方式" ContentImage:nil andController:nil];
    
    
    
    FQ_SettingBaseGound *group00 = [FQ_SettingBaseGound settingBaseGoundWithItems:@[item00]];
    
    FQ_SettingBaseGound *group10 = [FQ_SettingBaseGound settingBaseGoundWithItems:@[item10,item11,item12]];
    
    FQ_SettingBaseGound *group20 = [FQ_SettingBaseGound settingBaseGoundWithItems:@[item20]];
    
    FQ_SettingBaseGound *group30 = [FQ_SettingBaseGound settingBaseGoundWithItems:@[item30,item31]];
    FQ_SettingBaseGound *group40 = [FQ_SettingBaseGound settingBaseGoundWithItems:@[item40]];
    
    FQ_SettingBaseGound *group50 = [FQ_SettingBaseGound settingBaseGoundWithItems:@[item50,item51,item52]];
    
    FQ_SettingBaseGound *group60 = [FQ_SettingBaseGound settingBaseGoundWithItems:@[item60,item61] HeaderStr:@"朋友圈可以的" headerView:nil HeaderHeight:35 FooterStr:@"组尾" FooterView:nil FooterHeight:35 ItemRowHeight:44];
    
    FQ_SettingBaseGound *group70 = [FQ_SettingBaseGound settingBaseGoundWithItems:@[item70,item71] HeaderStr:@"朋友圈可以的" headerView:nil HeaderHeight:35 FooterStr:@"组尾" FooterView:nil FooterHeight:35 ItemRowHeight:44];
    
    [self.groups addObject:group00];
    [self.groups addObject:group10];
    [self.groups addObject:group20];
    [self.groups addObject:group30];
    [self.groups addObject:group40];
    [self.groups addObject:group50];
    [self.groups addObject:group60];
    [self.groups addObject:group70];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

