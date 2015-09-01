//
//  DrawTimingFunctionViewController.m
//  DMAnimationTiming
//
//  Created by Vito on 8/20/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "DrawTimingFunctionViewController.h"

@interface DrawTimingFunctionViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation DrawTimingFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    // 获取 control points
    CGPoint controlPoint1, controlPoint2;
    [function getControlPointAtIndex:1 values:(float *)&controlPoint1];
    [function getControlPointAtIndex:2 values:(float *)&controlPoint2];
    
    //创建曲线
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointZero];
    [path addCurveToPoint:CGPointMake(1, 1)
            controlPoint1:CGPointMake(0.7, 0.5) controlPoint2:controlPoint2];
    //缩放
    [path applyTransform:CGAffineTransformMakeScale(200, 200)];
    
    // 根据曲线创建 layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 4.0f;
    shapeLayer.path = path.CGPath;
    [self.containerView.layer addSublayer:shapeLayer];
    
    //flip geometry so that 0,0 is in the bottom-left
    self.containerView.layer.geometryFlipped = YES;
}



@end
