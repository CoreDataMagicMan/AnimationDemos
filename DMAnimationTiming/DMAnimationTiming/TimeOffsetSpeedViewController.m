//
//  TimeOffsetSpeedViewController.m
//  DMAnimationTiming
//
//  Created by Vito on 8/19/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "TimeOffsetSpeedViewController.h"

@interface TimeOffsetSpeedViewController ()

@property (nonatomic, strong) CALayer *squarerLayer;

@end

@implementation TimeOffsetSpeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupKeyFrameSquareLayer];
}


- (IBAction)startAction:(id)sender {
    [self startKeyFrameAnimation];
}


- (void)startKeyFrameAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = [self path].CGPath;
//    animation.rotationMode = kCAAnimationRotateAuto;
    animation.timeOffset = 2;
    animation.speed = 2.0;
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
    squarerLayer.position = CGPointMake(50, 150);
    squarerLayer.contents = (__bridge id)[UIImage imageNamed: @"rokect.png"].CGImage;
    [self.view.layer addSublayer:squarerLayer];
    self.squarerLayer = squarerLayer;
}

- (UIBezierPath *)path
{
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(50, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(125, 0) controlPoint2:CGPointMake(225, 300)];
    return bezierPath;
}

@end
