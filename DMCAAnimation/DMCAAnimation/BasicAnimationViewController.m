//
//  BasicAnimationViewController.m
//  DMCAAnimation
//
//  Created by Vito on 8/14/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "BasicAnimationViewController.h"

@interface BasicAnimationViewController () 

@property (strong, nonatomic) CALayer *squareLayer;
@property (strong, nonatomic) UILabel *label;

@end

@implementation BasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(20, 100, 100, 100);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:layer];
    self.squareLayer = layer;
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Animation";
    [label sizeToFit];
    label.layer.position = CGPointMake(50, 50);
    [layer addSublayer:label.layer];
    self.label = label;
}


- (IBAction)startAnimation:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    
    animation.toValue = @(self.squareLayer.position.y + 200);
    animation.duration = 2;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
//    animation.delegate = self;
    
//    CALayer *layer = self.squareLayer.presentationLayer ?: self.squareLayer;
//    animation.fromValue = @(layer.position.y);
//    
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    self.squareLayer.position = CGPointMake(self.squareLayer.position.x, [animation.toValue floatValue]);
//    [CATransaction commit];
//
    [self.squareLayer addAnimation:animation forKey:nil];
    
//    [self applyBasicAnimation:animation toLayer:self.squareLayer];
    
}



// 旋转动画
//- (IBAction)startAnimation:(id)sender
//{
//    
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"transform.rotation.z";
//    animation.fromValue = @0;
//    animation.toValue = @(M_PI);
//    animation.duration = 2;
//    
//    animation.repeatCount = NSIntegerMax;
//    animation.cumulative = YES;
//    
//    animation.additive = YES;
//    
//    [self.squareLayer addAnimation:animation forKey:nil];
//}

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.squareLayer.position = CGPointMake(self.squareLayer.position.x, [anim.toValue floatValue]);
    [CATransaction commit];
}




- (void)applyBasicAnimation:(CABasicAnimation *)animation toLayer:(CALayer *)layer
{
    animation.fromValue = [layer.presentationLayer ?: layer valueForKeyPath:animation.keyPath];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [layer setValue:animation.toValue forKeyPath:animation.keyPath];
    [CATransaction commit];
    
    [layer addAnimation:animation forKey:nil];
}

@end
