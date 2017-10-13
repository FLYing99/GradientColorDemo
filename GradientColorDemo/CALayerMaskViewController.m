//
//  CALayerMaskViewController.m
//  GradientColorDemo
//
//  Created by ying on 2017/10/13.
//  Copyright © 2017年 ying. All rights reserved.
//

#import "CALayerMaskViewController.h"
#import <CoreImage/CoreImage.h>
#import "UIColor+Extension.h"

@interface CALayerMaskViewController ()

{
    UIImageView *_firstCircle;
    CAShapeLayer *_firstCircleShapeLayer;
}
@end

@implementation CALayerMaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
     CALayer的mask属性可以作为遮罩让layer显示mask遮住(非透明)的部分；CAShapeLayer为CALayer的子类，通过path属性可以生成不同的形状，将CAShapeLayer对象用作layer的mask属性的话，就可以生成不同形状的图层。故生成颜色渐变有以下几个步骤：
     1.对整个 view 做出颜色渐变
     2.生成一个CAShapeLayer对象，根据path属性指定所需的形状
     3.将CAShapeLayer对象赋值给view的mask属性
     */
    
    //1.渐变圆环
    //向下对角线渐变
    UIView *upwardGradientView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 200, 200)];
    [self.view addSubview:upwardGradientView];
    upwardGradientView.backgroundColor = [UIColor gradientColorWithSize:upwardGradientView.frame.size direction:LinearGradientColorDirectionDownDiagonalLine startColor:[UIColor redColor]  endColor:[UIColor blueColor]];
    
    CAShapeLayer *shapeLayer = [self generateShapeLayerWithLineWidth:5];
    shapeLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:80 startAngle:0 endAngle:2*M_PI clockwise:NO].CGPath;
    upwardGradientView.layer.mask = shapeLayer;
    
    //2.渐变折线
    UIView *gradientView = [[UIView alloc]initWithFrame:CGRectMake(50, 350, 200, 200)];
    [self.view addSubview:gradientView];
    gradientView.backgroundColor = [UIColor gradientColorWithSize:gradientView.frame.size direction:LinearGradientColorDirectionDownDiagonalLine startColor:[UIColor redColor]  endColor:[UIColor yellowColor]];
    
    CAShapeLayer *shapeLayer2 = [self generateShapeLayerWithLineWidth:5];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(80, 90)];
    [path addLineToPoint:CGPointMake(150, 120)];
    [path addLineToPoint:CGPointMake(200, 80)];
    shapeLayer2.path = path.CGPath;
    gradientView.layer.mask = shapeLayer2;
}

- (CAShapeLayer *)generateShapeLayerWithLineWidth:(CGFloat)lineWidth
{
    CAShapeLayer *waveline = [CAShapeLayer layer];
    waveline.lineCap = kCALineCapButt;
    waveline.lineJoin = kCALineJoinRound;
    
    waveline.strokeColor = [UIColor redColor].CGColor;
    waveline.fillColor = [[UIColor clearColor] CGColor];
    waveline.lineWidth = lineWidth;
    waveline.backgroundColor = [UIColor clearColor].CGColor;
    
    return waveline;
}


@end
