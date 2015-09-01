//
//  KeyFrameViewController.m
//  DMCAAnimation
//
//  Created by Vito on 8/19/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "KeyFrameViewController.h"

@interface KeyFrameViewController () <CAMediaTiming>

@property (nonatomic, strong) CALayer *squarerLayer;

@end

@implementation KeyFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setupSquareLayer];
    
    [self setupKeyFrameSquareLayer];
    
}


- (IBAction)startAnimation:(id)sender {
//    [self startColorAnimation];
    
    [self startKeyFrameAnimation];
}

- (void)startColorAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[
                         (__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor ];
    //apply animation to layer
    [self.squarerLayer addAnimation:animation forKey:nil];
}

- (void)setupSquareLayer
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(20, 100, 100, 100);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    self.squarerLayer = layer;
    [self.view.layer addSublayer:self.squarerLayer];
}



- (void)startKeyFrameAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = [self path].CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    [self.squarerLayer addAnimation:animation forKey:nil];
}

- (void)setupKeyFrameSquareLayer
{
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = [self path].CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.view.layer addSublayer:pathLayer];

    
    CALayer *squarerLayer = [CALayer layer];
    squarerLayer.frame = CGRectMake(0, 0, 64, 64);
    squarerLayer.position = CGPointMake(0, 150);
    squarerLayer.contents = (__bridge id)[UIImage imageNamed: @"rokect.png"].CGImage;
    [self.view.layer addSublayer:squarerLayer];
    self.squarerLayer = squarerLayer;
}

- (UIBezierPath *)path
{
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    return bezierPath;
}


@end
