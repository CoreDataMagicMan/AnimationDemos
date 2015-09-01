//
//  TransitionViewController.m
//  DMCAAnimation
//
//  Created by Vito on 8/19/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (IBAction)changeAction:(id)sender {
    
    NSArray *imageNames = @[@"transiton-1.png", @"transiton-2.jpg", @"transiton-3.jpg"];
    [UIView transitionWithView:self.imageView
                      duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        NSUInteger index = self.imageView.tag;
                        index = (index + 1) % [imageNames count];
                        self.imageView.image = [UIImage imageNamed:imageNames[index]];
                        self.imageView.tag += 1;
                    }
                    completion:NULL];
    
}


@end
