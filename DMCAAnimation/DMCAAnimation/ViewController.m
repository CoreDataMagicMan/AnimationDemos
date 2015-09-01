//
//  ViewController.m
//  DMCAAnimation
//
//  Created by Vito on 8/14/15.
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


- (IBAction)tapViewHandler:(UITapGestureRecognizer *)sender {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @0;
    animation.toValue = @100;
//    animation.additive = YES;
//    animation.cumulative = YES;
    animation.repeatCount = 10;
    animation.duration = 3;
    [self.squareView.layer addAnimation:animation forKey:@"sqaureAnimation"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
