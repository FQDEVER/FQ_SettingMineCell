//
//  FQPublic.h
//
//
//  Created by 范奇 on 16/6/13.
//  Copyright © 2016年 范奇. All rights reserved.
//

// 1.判断是否为iOS8
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

// 2.获得RGB颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)


// 3.是否为4inch
#define fourInch ([UIScreen mainScreen].bounds.size.height == 568)

// 4.屏幕大小尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
#define screen_scale [UIScreen mainScreen].scale
//重新设定view的Y值
#define setFrameY(view, newY) view.frame = CGRectMake(view.frame.origin.x, newY, view.frame.size.width, view.frame.size.height)
#define setFrameX(view, newX) view.frame = CGRectMake(newX, view.frame.origin.y, view.frame.size.width, view.frame.size.height)
#define setFrameH(view, newH) view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, newH)


//取view的坐标及长宽
#define W(view)    view.frame.size.width
#define H(view)    view.frame.size.height
#define X(view)    view.frame.origin.x
#define Y(view)    view.frame.origin.y

//5.常用对象
#define APPDELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)

//6.经纬度
#define LATITUDE_DEFAULT 39.983497
#define LONGITUDE_DEFAULT 116.318042


//7.获得当前版本号
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//8. 只是给oc的头文件添加这个拷贝这个源文件,c语言的文件不拷贝
#ifdef __OBJC__

//这里写只可以在oc中使用的头文件,c语言不能使用的

#endif


//9.简书字体大小


#define BigBig_TEXT_FONT [UIFont systemFontOfSize:25];
#define Big_TEXT_FONT [UIFont systemFontOfSize:18]
#define Mid_TEXT_FONT [UIFont systemFontOfSize:14]
#define Smo_TEXT_FONT [UIFont systemFontOfSize:11]
#define SettingColor [UIColor colorWithRed:204/255.0 green:88/255.0 blue:74/255.0 alpha:1]


//10.在非 ARC 环境下运行下面的代码
#if !__has_feature(objc_arc)

#endif


//11.打开或关闭打印
#ifdef DEBUG
// ... 是一个可变参数  __VA_VRGS__ 可变参数 ,在调试的时候所有打印的东西,都可以打印,当把模式更改为其他的时候的,这些就都不能打印了
#define NSLog(...)  NSLog(__VA_ARGS__)

#else
#define NSLog(...)

#endif

//12.设置颜色的方式
#define  ShareColor(colorNum) [UIColor colorWithRed:colorNum/255.0 green:colorNum/255.0 blue:colorNum/255.0 alpha:1]



