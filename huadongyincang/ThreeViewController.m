//
//  ThreeViewController.m
//  huadongyincang
//
//  Created by YI on 16/9/30.
//  Copyright © 2016年 Sandro. All rights reserved.
//

#import "ThreeViewController.h"
#import "FourViewController.h"

@interface ThreeViewController (){
    UIImageView *imgView4;
}

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.hidesBarsOnSwipe = YES;
    
    UIImageView *imgView1 = [[UIImageView alloc] init];
    imgView1.frame = CGRectMake(0, 60, 160, 160);
    [imgView1 setImage:[self pq_drawImageWithImageNamed:@"333.jpg"]];
    [self.view addSubview:imgView1];
    
    
    UIImageView *imgView2 = [[UIImageView alloc] init];
    imgView2.frame = CGRectMake(165, 60, 160, 160);
    [imgView2 setImage:[self pq_ClipCircleImageWithImage:@"333.jpg"]];
    [self.view addSubview:imgView2];
    
    UIImageView *imgView3 = [[UIImageView alloc] init];
    imgView3.frame = CGRectMake(0, 225, 160, 160);
    [imgView3 setImage:[self pq_ClipCircleImageWithImage:@"333.jpg" borderWidth:4.5 borderColor:[UIColor orangeColor]]];
    [self.view addSubview:imgView3];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pq_cutScreenWithView:(nullable UIView *)view successBlock:(nullable void(^)(UIImage * _Nullable image,NSData * _Nullable imagedata))block{
    //1、开启上下文
    UIGraphicsBeginImageContext(view.bounds.size);
    
    //2.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //3.截屏
    [view.layer renderInContext:ctx];
    
    //4、获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.转化成为Data
    //compressionQuality:表示压缩比 0 - 1的取值范围
    NSData * data = UIImageJPEGRepresentation(newImage, 1);
    //6、关闭上下文
    UIGraphicsEndImageContext();
    
    //7.回调
    block(newImage,data);
}

- (nullable UIImage *)pq_ClipCircleImageWithImage:(NSString *)name borderWidth:(CGFloat)borderW borderColor:(nullable UIColor *)borderColor{
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]];
    //1、开启上下文
    UIGraphicsBeginImageContext(image.size);
    
    //2、设置边框
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [borderColor setFill];
    [path fill];
    
    //3、设置裁剪区域
    UIBezierPath * clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(rect.origin.x + borderW , rect.origin.x + borderW , rect.size.width - borderW * 2, rect.size.height - borderW *2)];
    [clipPath addClip];
    
    //3、绘制图片
    [image drawAtPoint:CGPointZero];
    
    //4、获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5、关闭上下文
    UIGraphicsEndImageContext();
    //6、返回新图片
    return newImage;
}

- (nullable UIImage *)pq_ClipCircleImageWithImage:(NSString *)name{
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]];
    
    //1、开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //2、设置裁剪区域
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [path addClip];
    
    //3、绘制图片
    [image drawAtPoint:CGPointZero];
    
    //4、获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5、关闭上下文
    UIGraphicsEndImageContext();
    
    //6、返回新图片
    return newImage;
}

- (UIImage *)pq_drawImageWithImageNamed:(NSString *)name{
    //1.获取图片
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]];
    //2.开启图形上下文
    UIGraphicsBeginImageContext(image.size);
    //3.绘制到图形上下文中
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    //2.创建文字
    NSString * str = @"全场最佳";
    //设置字体样式
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    //NSFontAttributeName:字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    //字体前景色
    dict[NSForegroundColorAttributeName] = [UIColor blueColor];
    //字体背景色
    dict[NSBackgroundColorAttributeName] = [UIColor redColor];
    //字体阴影
    NSShadow * shadow = [[NSShadow alloc]init];
    //阴影偏移量
    shadow.shadowOffset = CGSizeMake(2, 2);
    //阴影颜色
    shadow.shadowColor = [UIColor greenColor];
    //高斯模糊
    shadow.shadowBlurRadius = 5;
    dict[NSShadowAttributeName] = shadow;
    //字体间距
    dict[NSKernAttributeName] = @10;
    //绘制到上下文
    //从某一点开始绘制 默认 0 0点
    //    [str drawAtPoint:CGPointMake(100, 100) withAttributes:nil];
    //绘制区域设置
    [str drawAtPoint:CGPointMake(10, 50)  withAttributes:dict];
    
    //4.从上下文中获取图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)jiepingAc:(id)sender {
    [self pq_cutScreenWithView:self.view successBlock:^(UIImage * _Nullable image, NSData * _Nullable imagedata) {
        if (image) {
            imgView4 = [[UIImageView alloc] init];
            imgView4.frame = CGRectMake(165, 225, 160, 160);
            imgView4.image = image;
            imgView4.backgroundColor = [UIColor lightGrayColor];
            [self.view addSubview:imgView4];
        }
    }];
}

- (IBAction)nextAc:(id)sender {
    FourViewController *threeVc = [[FourViewController alloc] init];
    [self.navigationController pushViewController:threeVc animated:YES];
}
@end
