# FQ_SettingMineCell

主要功能:

1. 使用抽取基类的方式,创建我的界面常见的各种cell类型 

2. 可以自定义分割线的样式或者颜色,还有文字的颜色,设置单个cell行高,tabView的组高 

3. 可以自定义cell中的布局,cell中图片是否圆角 

4. 可以自定义组头,组尾的文字或者view,以及组头组尾的高度 

5. 直接在使用界面可以监听开关时间,cell的点击事件,跳转到对应的控制器或者不跳转,在block中实现对应的事件 

6. 解决cell重用的问题
    使用framework静态库时候,需要将静态库中的"icon_arrow_next~iphone.png"图片拿出来放到的demo中,也可以自定义同名的图片


####  常用cell的样式

       typedef enum{

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

#### cell 定制的属性:

        cell的属性可以设定文字颜色

        cell中的图片的尺寸,默认随着cell变化

        cell的选中颜色

        cell的高度

        cell跳转控制器还是blcok回调执行那些命令

        cell中开关通过block回调可以直接在控制器中执行指定的命令等

#### 每组cell 均可部分定制

            /**

        设置组样式

        @param items            item数组模型

        @param goundHeaderStr      组头文字

        @param goundHeaderView    组头view

        @param goundHeaderHeight 组头高度

        @param goundFooterStr    组尾文字

        @param goundFooterView  组尾view

        @param goundFooterHeight 组尾高度

        @param itemsRowHeigh    item cell高度.

        @return cell组模型

            */

#### 使用.继承自 FQ_SettingBaseTableController

    #import "FQ_SettingBaseTableController.h"

    @interface ViewController : FQ_SettingBaseTableController`

   
    -(void)addTableViewCell

        {

        CeShiViewController * testVc = [[CeShiViewController alloc]init];

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
