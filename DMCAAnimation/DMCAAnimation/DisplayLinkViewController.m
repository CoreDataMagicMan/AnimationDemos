//
//  DisplayLinkViewController.m
//  DMCAAnimation
//
//  Created by Vito on 8/17/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "DisplayLinkViewController.h"
#include "easing.h"

@interface DisplayLinkViewController ()

@property (nonatomic, strong) CADisplayLink *timer;

@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, strong) UIImageView *ballView;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) NSTimeInterval timeOffset;
@property (nonatomic, assign) CFTimeInterval lastStep;
@property (nonatomic, strong) id fromValue;
@property (nonatomic, strong) id toValue;

@end

@implementation DisplayLinkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *ballImage = [UIImage imageNamed:@"ball"];
    self.ballView = [[UIImageView alloc] initWithImage:ballImage];
    [self.containerView addSubview:self.ballView];
    
    //animate
    [self animate];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self animate];
}

- (void)animate
{
    //reset ball to top of screen
    self.ballView.center = CGPointMake(150, 32);
    //configure the animation
    self.duration = 1.0;
    self.timeOffset = 0.0;
    self.fromValue = [NSValue valueWithCGPoint:CGPointMake(150, 32)];
    self.toValue = [NSValue valueWithCGPoint:CGPointMake(150, 268)];
    
    // 如果 timer 正在运行，先停止它
    [self.timer invalidate];
    
    // 开启定时器
    self.lastStep = CACurrentMediaTime();
    self.timer = [CADisplayLink displayLinkWithTarget:self
                                             selector:@selector(step:)];
    [self.timer addToRunLoop:[NSRunLoop mainRunLoop]
                     forMode:NSDefaultRunLoopMode];
}

- (void)step:(CADisplayLink *)timer
{
    //获取每步的时间差
    CFTimeInterval thisStep = CACurrentMediaTime();
    CFTimeInterval stepDuration = thisStep - self.lastStep;
    self.lastStep = thisStep;
    //更新时间偏移
    self.timeOffset = MIN(self.timeOffset + stepDuration, self.duration);
    //获取时间偏移百分比 (范围 0 - 1)
    float time = self.timeOffset / self.duration;
    //应用缓冲函数，计算时间偏移百分比
    time = BounceEaseIn(time);
    //计算位移量
    id position = [self interpolateFromValue:self.fromValue toValue:self.toValue
                                        time:time];
    //设置视图位置
    self.ballView.center = [position CGPointValue];
    //时间到就停止 timer
    if (self.timeOffset >= self.duration) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

float interpolate(float from, float to, float time)
{
    return (to - from) * time + from;
}

- (id)interpolateFromValue:(id)fromValue toValue:(id)toValue time:(float)time
{
    if ([fromValue isKindOfClass:[NSValue class]]) {
        //get type
        const char *type = [(NSValue *)fromValue objCType];
        if (strcmp(type, @encode(CGPoint)) == 0) {
            CGPoint from = [fromValue CGPointValue];
            CGPoint to = [toValue CGPointValue];
            CGPoint result = CGPointMake(interpolate(from.x, to.x, time), interpolate(from.y, to.y, time));
            return [NSValue valueWithCGPoint:result];
        }
    }
    //provide safe default implementation
    return (time < 0.5)? fromValue: toValue;
}


@end
