//
//  ViewController.m
//  DMAnimationTiming
//
//  Created by Vito on 8/19/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *squareView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)startAnimation:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.translation.y";
    animation.toValue = @(100);
    animation.duration = 2.0;
    animation.repeatDuration = INFINITY;
    animation.autoreverses = YES;
    [self.squareView.layer addAnimation:animation forKey:nil];
}

@end
