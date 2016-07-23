//
//  MineCellLabelButton.m
//  jianshu++
//
//  Created by 范奇 on 16/6/23.
//  Copyright © 2016年 范奇. All rights reserved.
//

#import "MineCellLabelButton.h"

@implementation MineCellLabelButton

-(void)layoutSubviews
{
    [super layoutSubviews];
    //布局完了以后,我们再给这个布局
    CGFloat margin = 5;
    CGFloat titilW = self.titleLabel.frame.size.width;
    CGFloat titilH = self.titleLabel.frame.size.height;
    CGFloat butW = self.frame.size.width;
    CGFloat butH = self.frame.size.height;
    //获取图片的宽度和高度
    CGFloat imageW = self.imageView.image.size.width;
    CGFloat imageH = self.imageView.image.size.height;
    //首先布局文字
    CGFloat titilX = (butW - margin - titilW - imageW)*0.9;
    CGFloat titilY = (butH - titilH)*0.5;
    self.titleLabel.frame = CGRectMake(titilX, titilY, titilW, titilH);
    //布局图片
    CGFloat imageX =  butW - imageW;
    CGFloat imageY = (butH - imageH)*0.5;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
}

@end
