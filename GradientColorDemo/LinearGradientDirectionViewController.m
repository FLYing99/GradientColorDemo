//
//  GradientDirectionViewController.m
//  GradientColorDemo
//
//  Created by ying on 2017/10/13.
//  Copyright © 2017年 ying. All rights reserved.
//

#import "LinearGradientDirectionViewController.h"
#import "UIColor+Extension.h"

@interface LinearGradientDirectionViewController ()

@end

@implementation LinearGradientDirectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //水平渐变
    UIView *gradientView = [[UIView alloc]initWithFrame:CGRectMake(50, 80, 200, 40)];
    [self.view addSubview:gradientView];
    gradientView.backgroundColor = [UIColor gradientColorWithSize:gradientView.frame.size direction:LinearGradientColorDirectionLevel startColor:[UIColor redColor]  endColor:[UIColor blueColor]];

    
    //垂直渐变
    UIView *verticalGradientView = [[UIView alloc]initWithFrame:CGRectMake(50, 150, 200, 100)];
    [self.view addSubview:verticalGradientView];
    verticalGradientView.backgroundColor = [UIColor gradientColorWithSize:verticalGradientView.frame.size direction:LinearGradientColorDirectionVertical startColor:[UIColor redColor]  endColor:[UIColor blueColor]];

    //向下对角线渐变
    UIView *upwardGradientView = [[UIView alloc]initWithFrame:CGRectMake(50, 270, 200, 100)];
    [self.view addSubview:upwardGradientView];
    upwardGradientView.backgroundColor = [UIColor gradientColorWithSize:upwardGradientView.frame.size direction:LinearGradientColorDirectionDownDiagonalLine startColor:[UIColor redColor]  endColor:[UIColor blueColor]];
    
    //向上对角线渐变
    UIView *downGradientView = [[UIView alloc]initWithFrame:CGRectMake(50, 400, 200, 100)];
    [self.view addSubview:downGradientView];
    downGradientView.backgroundColor = [UIColor gradientColorWithSize:downGradientView.frame.size direction:LinearGradientColorDirectionUpwardDiagonalLine startColor:[UIColor redColor]  endColor:[UIColor blueColor]];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawLinearGradient:(CGContextRef)context
                      path:(CGPathRef)path
                startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    //具体方向可根据需求修改
    CGPoint startPoint = CGPointMake(CGRectGetMinX(pathRect), CGRectGetMidY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMidY(pathRect));
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
