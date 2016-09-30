//
//  TowViewController.m
//  huadongyincang
//
//  Created by YI on 16/9/29.
//  Copyright © 2016年 Sandro. All rights reserved.
//

#import "TowViewController.h"
#import "DrawView.h"
#import "LineView.h"

#import "ThreeViewController.h"

@interface TowViewController (){
    DrawView *view;
    LineView *view2;
}

@end

@implementation TowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    view = [[DrawView alloc] init];
    view.frame = CGRectMake(0, 60, 160, 160);
    view.progress = 0.50;
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
    
    
    
    view2 = [[LineView alloc] init];
    view2.frame = CGRectMake(160,220, 160, 160);
    view2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view2];
}

- (void)viewWillAppear:(BOOL)animated{

}

- (IBAction)sender:(UISlider *)sender {
    view.progress = sender.value;
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)nextAc:(id)sender {
    ThreeViewController *threeVc = [[ThreeViewController alloc] init];
    [self.navigationController pushViewController:threeVc animated:YES];
}
@end
