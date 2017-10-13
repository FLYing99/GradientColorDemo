//
//  CAGradientLayerViewController.m
//  GradientColorDemo
//
//  Created by ying on 2017/10/13.
//  Copyright © 2017年 ying. All rights reserved.
//

#import "CAGradientLayerViewController.h"

@interface CAGradientLayerViewController ()

@end

@implementation CAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    /*
     colors    渐变的颜色
     locations    渐变颜色的分割点
     startPoint&endPoint    颜色渐变的方向，范围在(0,0)与(1.0,1.0)之间，如(0,0)(1.0,0)代表水平方向渐变,(0,0)(0,1.0)代表竖直方向渐变
     */
    //水平渐变
    UIView *gradientView = [[UIView alloc]initWithFrame:CGRectMake(50, 80, 200, 40)];
    [self.view addSubview:gradientView];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0.3, @0.5, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = gradientView.bounds;
    [gradientView.layer addSublayer:gradientLayer];
    
    //垂直渐变
    UIView *verticalGradientView = [[UIView alloc]initWithFrame:CGRectMake(50, 150, 200, 100)];
    [self.view addSubview:verticalGradientView];
    CAGradientLayer *gradientLayer2 = [CAGradientLayer layer];
    gradientLayer2.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer2.locations = @[@0.3, @0.5, @1.0];
    gradientLayer2.startPoint = CGPointMake(0, 0.0);
    gradientLayer2.endPoint = CGPointMake(0.0, 1.0);
    gradientLayer2.frame = verticalGradientView.bounds;
    [verticalGradientView.layer addSublayer:gradientLayer2];
    
    //向下对角线渐变
    UIView *downGradientView = [[UIView alloc]initWithFrame:CGRectMake(50, 270, 200, 100)];
    [self.view addSubview:downGradientView];
    CAGradientLayer *gradientLayer3 = [CAGradientLayer layer];
    gradientLayer3.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer3.locations = @[@0.3, @0.5, @1.0];
    gradientLayer3.startPoint = CGPointMake(0, 0);
    gradientLayer3.endPoint = CGPointMake(1.0, 1.0);
    gradientLayer3.frame = downGradientView.bounds;
    [downGradientView.layer addSublayer:gradientLayer3];
    
    
    //向上对角线渐变
    UIView *upwardGradientView = [[UIView alloc]initWithFrame:CGRectMake(50, 400, 200, 100)];
    [self.view addSubview:upwardGradientView];
    CAGradientLayer *gradientLayer4 = [CAGradientLayer layer];
    gradientLayer4.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer4.locations = @[@0.3, @0.5, @1.0];
    gradientLayer4.startPoint = CGPointMake(0.0, 1.0);
    gradientLayer4.endPoint = CGPointMake(1.0, 0.0);
    gradientLayer4.frame = upwardGradientView.bounds;
    [upwardGradientView.layer addSublayer:gradientLayer4];
    
    
}



@end
