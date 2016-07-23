//
//  UIImage+CreatImage.m
//  FQ_SettingCell
//
//  Created by 范奇 on 16/7/17.
//  Copyright © 2016年 范奇. All rights reserved.
//

#import "UIImage+CreatImage.h"

@implementation UIImage (CreatImage)
//一个是切圆形图片,还有一个我们设定为切方形图片
- (UIImage *)creatCircleImage {
    
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
        [[UIColor clearColor] setFill];
        CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
        UIRectFill(rect);
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    
        [path addClip];
        [self drawInRect:rect];
        //获取新图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        //关闭上下文
        UIGraphicsEndImageContext();
        return newImage;
}



@end
