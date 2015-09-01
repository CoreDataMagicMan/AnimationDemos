//
//  ActionViewController.m
//  DMAnimationImplicit
//
//  Created by Vito on 7/18/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "ActionViewController.h"

@interface ActionViewController ()

@property (nonatomic, weak) IBOutlet UIView *layerView;

@end

@implementation ActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"Outside: %@", [self.layerView actionForLayer:self.layerView.layer forKey:@"backgroundColor"]);

    [UIView beginAnimations:nil context:nil];

    NSLog(@"Inside: %@", [self.layerView actionForLayer:self.layerView.layer forKey:@"backgroundColor"]);
    
    [UIView commitAnimations];
}

@end
