//
//  UIColor+Extension.h
//  GradientColorDemo
//
//  Created by ying on 2017/10/13.
//  Copyright © 2017年 ying. All rights reserved.
//

#import <UIKit/UIKit.h>

//
typedef NS_ENUM(NSInteger, LinearGradientColorDirection) {
    LinearGradientColorDirectionLevel,//水平渐变
    LinearGradientColorDirectionVertical,//竖直渐变
    LinearGradientColorDirectionDownDiagonalLine,//向上对角线渐变
    LinearGradientColorDirectionUpwardDiagonalLine,//向下对角线渐变
    
};

@interface UIColor (Extension)
/**
 创建渐变颜色
 
 @param size       渐变的size
 @param direction  渐变方式
 @param startcolor 开始颜色
 @param endColor   结束颜色
 
 @return 创建的渐变颜色
 */
+ (instancetype)gradientColorWithSize:(CGSize)size
                                     direction:(LinearGradientColorDirection)direction
                                    startColor:(UIColor *)startcolor
                                      endColor:(UIColor *)endColor;
@end
