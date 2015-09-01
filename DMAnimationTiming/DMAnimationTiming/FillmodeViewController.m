//
//  FillmodeViewController.m
//  DMAnimationTiming
//
//  Created by Vito on 8/19/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "FillmodeViewController.h"

@interface FillmodeViewController ()
@property (weak, nonatomic) IBOutlet UIView *squareView;

@end

@implementation FillmodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)startAnimation:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.duration = 2.0;
//    animation.fromValue = @(200);
    animation.toValue = @(400);
//    animation.beginTime = 3.0;
    animation.fillMode = kCAFillModeBoth;
    animation.removedOnCompletion = NO;
    
    [self.squareView.layer addAnimation:animation forKey:@"square animation"];
    
}

@end
