//
//  LineView.m
//  huadongyincang
//
//  Created by YI on 16/9/30.
//  Copyright © 2016年 Sandro. All rights reserved.
//

#import "LineView.h"

@implementation LineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    /*
    //1 获取上下文
    //分别设置线段的颜色
    CGContextRef purple = UIGraphicsGetCurrentContext();
    [[UIColor purpleColor]setStroke];
    CGContextSaveGState(purple);
    
    CGContextRef orange = UIGraphicsGetCurrentContext();
    [[UIColor orangeColor]setStroke];
    CGContextSaveGState(orange);
    
    CGContextRef green = UIGraphicsGetCurrentContext();
    [[UIColor greenColor]setStroke];
    CGContextSaveGState(green);
    
    */
    UIBezierPath * path = [UIBezierPath bezierPath];
    //设置线宽
    path.lineWidth = 3;
    
    //把紫色的上下文从栈中取出来
    //CGContextRestoreGState(purple);
    //第一条线
    [[UIColor purpleColor]setStroke];
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(10, 100)];
    [path stroke];
    
    
    //把紫色的上下文从栈中取出来
    //CGContextRestoreGState(orange);
    path = [UIBezierPath bezierPath];
    //设置线宽
    path.lineWidth = 6;
    //第二条线
    [[UIColor orangeColor]setStroke];
    [path moveToPoint:CGPointMake(30, 10)];
    [path addLineToPoint:CGPointMake(30, 100)];
    [path stroke];
    
    //把紫色的上下文从栈中取出来
    //CGContextRestoreGState(green);
    path = [UIBezierPath bezierPath];
    //设置线宽
    path.lineWidth = 9;
    //第三条线
    [[UIColor greenColor]setStroke];
    [path moveToPoint:CGPointMake(50, 10)];
    [path addLineToPoint:CGPointMake(50, 100)];
    [path stroke];
}

@end
