//
//  ViewController.m
//  DMAnimationImplicit
//
//  Created by Vito on 7/18/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(150.0f, 150.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    [self.view.layer addSublayer:self.colorLayer];
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>]
}

- (IBAction)changeColor
{
    self.colorLayer.backgroundColor = [self randomColor].CGColor;
}

- (UIColor *)randomColor
{
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}





//- (IBAction)changeColor
//{
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:1.0];
//
//    self.colorLayer.backgroundColor = [self randomColor].CGColor;
//
//    [CATransaction commit];
//}

@end
