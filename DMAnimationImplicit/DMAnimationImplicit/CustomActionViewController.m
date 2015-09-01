//
//  CustomActionViewController.m
//  DMAnimationImplicit
//
//  Created by Vito on 7/18/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "CustomActionViewController.h"

@interface CustomActionViewController ()

@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation CustomActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //create sublayer
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(150.0f, 150.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    //add a custom action
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    self.colorLayer.actions = @{@"backgroundColor": transition};

    
    [self.view.layer addSublayer:self.colorLayer];
}

- (IBAction)changeColor
{
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
}

@end
