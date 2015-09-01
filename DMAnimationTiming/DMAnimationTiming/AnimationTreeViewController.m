//
//  AnimationTreeViewController.m
//  DMAnimationTiming
//
//  Created by Vito on 8/20/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "AnimationTreeViewController.h"

@interface AnimationTreeViewController ()

@property (weak, nonatomic) IBOutlet UIView *aView;
@property (weak, nonatomic) IBOutlet UIView *bView;
@property (weak, nonatomic) IBOutlet UILabel *aSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *aTimeOffsetLabel;

@end

@implementation AnimationTreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (IBAction)tapView:(id)sender {
    [self startAViewAnimation];
    [self startBViewAnimation];
}
- (IBAction)aSpeedValueChanged:(UISlider *)sender {
    CGFloat speed = 2.0 * sender.value;
    self.aSpeedLabel.text = [NSString stringWithFormat:@"%.2f", speed];
    self.aView.layer.speed = speed;
}

- (IBAction)aTimeOffsetChanged:(UISlider *)sender {
    CGFloat timeOffset = 4.0 * sender.value;
    self.aTimeOffsetLabel.text = [NSString stringWithFormat:@"%.2f", timeOffset];
    self.aView.layer.timeOffset = timeOffset;
}

- (void)startAViewAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.duration = 3.0;
    animation.toValue = @(400);
//    animation.beginTime = 1.0;
    [self.aView.layer addAnimation:animation forKey:nil];
    
}

- (void)startBViewAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.duration = 2.0;
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(32, 32)],
                         [NSValue valueWithCGPoint:CGPointMake(100, 32)],
                         [NSValue valueWithCGPoint:CGPointMake(100, 100)],
                         [NSValue valueWithCGPoint:CGPointMake(32, 100)],
                         [NSValue valueWithCGPoint:CGPointMake(32, 32)],
                         ];
    animation.repeatCount = 2;
    [self.bView.layer addAnimation:animation forKey:nil];
}


@end
