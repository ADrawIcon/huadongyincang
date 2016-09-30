//
//  DrawView.m
//  huadongyincang
//
//  Created by YI on 16/9/29.
//  Copyright © 2016年 Sandro. All rights reserved.
//

#import "DrawView.h"
@interface DrawView (){
    UILabel * textLabel;
    CGFloat fNum;
    int a;
}


@property (nonatomic,strong) CABasicAnimation * animation;
@end

@implementation DrawView



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        textLabel = [[UILabel alloc] init ];
        a = 0;
        
        [self addSubview:textLabel];
    }
    return self;
}

- (void)layoutSubviews {
    // 一定要调用super的方法
    [super layoutSubviews];
    textLabel.frame = CGRectMake(30, 30, 80, 30);
    [self setNeedsDisplay];
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    
    textLabel.text = [NSString stringWithFormat:@"%.2f%%",_progress*100];
    textLabel.textColor = [UIColor colorWithRed:self.progress green:0 blue:0 alpha:1];
    [self setNeedsDisplay];
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    if (a == 1) {
        fNum = self.progress;
    } else {
        fNum = 50;
    }
    
    
    CGFloat startA = - M_PI_2;
    CGFloat endA =  - M_PI_2 + self.progress * M_PI * 2;
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5) radius:self.bounds.size.width*0.5-10 startAngle:startA endAngle:endA clockwise:YES];
    [[UIColor colorWithRed:self.progress green:(1-self.progress) blue:0 alpha:1]setStroke];
    path.lineWidth = 5;
    a = 1;
    [path stroke];
    NSLog(@"-----------------------");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
