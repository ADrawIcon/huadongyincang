//
//  FourViewController.m
//  huadongyincang
//
//  Created by YI on 16/9/30.
//  Copyright © 2016年 Sandro. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@property (nonatomic,weak) UIImageView * wipeImageV;

@end

@implementation FourViewController

- (UIImageView *)wipeImageV{
    if (!_wipeImageV) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fore.jpg" ofType:nil]];
        imageView.image = image;
        
        [self.view addSubview:imageView];
        _wipeImageV = imageView;
    }
    
    return _wipeImageV;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"4444.jpg" ofType:nil]];
    [self.view addSubview:imageView];
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(wipePanGestureEvent:)];
    self.wipeImageV.userInteractionEnabled = YES;
    [self.wipeImageV addGestureRecognizer:pan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)wipePanGestureEvent:(UIPanGestureRecognizer * )pan{
    //计算位置
    CGPoint nowPoint = [pan locationInView:self.wipeImageV];
    CGFloat offsetX = nowPoint.x - 10;
    CGFloat offsetY = nowPoint.y - 10;
    CGRect clipRect = CGRectMake(offsetX, offsetY, 20, 20);
    
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(self.wipeImageV.bounds.size, NO, 1);
    //获取当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //
    //把图片绘制上去
    //[[_wipeImageV layer]setCornerRadius:15.0];//圆角
    [self.wipeImageV.layer renderInContext:ctx];
    
    //把这一块设置为透明
    CGContextClearRect(ctx, clipRect);
    
    //获取新的图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    //重新赋值图片
    self.wipeImageV.image = newImage;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
