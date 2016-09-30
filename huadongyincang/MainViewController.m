//
//  MainViewController.m
//  huadongyincang
//
//  Created by YI on 16/9/28.
//  Copyright © 2016年 Sandro. All rights reserved.
//

#import "MainViewController.h"
#import "UIImageView+WebCache.h"
#import "TowViewController.h"

@interface MainViewController (){
    NSMutableArray *arr;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.navigationController.hidesBarsOnSwipe = YES;
    arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 999; i++) {
        [arr addObject:@(i)];
    }
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.frame = CGRectMake(10, 60, 300, 250);
    //imgView.backgroundColor = [UIColor redColor];
    NSURL *url = [NSURL URLWithString:@"http://img1.cache.netease.com/game/OW/201512/76.png"];
    
    [imgView sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"yea");
        image = [self circleImage:image];
        [imgView setImage:image];
        [self.view addSubview:imgView];
    }];
    
    
    //[imgView sd_setImageWithURL:url];
    //_tv1.hidden = YES;
   
    [self.view bringSubviewToFront:imgView];
    
    imgView.userInteractionEnabled = YES;
    //创建拖拽手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                        action:@selector(handlePanGestures:)];
    //无论最大还是最小都只允许一个手指
    panGestureRecognizer.minimumNumberOfTouches = 1;
    panGestureRecognizer.maximumNumberOfTouches = 1;
    [imgView addGestureRecognizer:panGestureRecognizer];
}


- (void) handlePanGestures:(UIPanGestureRecognizer*)paramSender{
    if (paramSender.state != UIGestureRecognizerStateEnded && paramSender.state != UIGestureRecognizerStateFailed){
        //通过使用 locationInView 这个方法,来获取到手势的坐标
        CGPoint location = [paramSender locationInView:paramSender.view.superview];
        paramSender.view.center = location;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //self.navigationController.navigationBar.alpha = scrollView.contentOffset.y / 100;
    
    //scrollView已经有拖拽手势，直接拿到scrollView的拖拽手势
    UIPanGestureRecognizer *pan = scrollView.panGestureRecognizer;
    //获取到拖拽的速度 >0 向下拖动 <0 向上拖动
    CGFloat velocity = [pan velocityInView:scrollView].y;
    
    if (velocity <- 5) {
        //向上拖动，隐藏导航栏
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else if (velocity > 5) {
        //向下拖动，显示导航栏
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else if(velocity == 0){
        //停止拖拽
    }
     
}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",arr[indexPath.row]];
    NSLog(@"%@",arr[indexPath.row]);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TowViewController *towVc = [[TowViewController alloc] init];
    [self.navigationController pushViewController:towVc animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UIImage *)circleImage:(UIImage *)img
{
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0.5);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextClip(ctx);
    [img drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
