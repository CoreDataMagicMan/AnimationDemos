//
//  DMLayer.m
//  DMAnimationImplicit
//
//  Created by Vito on 8/18/15.
//  Copyright (c) 2015 vito. All rights reserved.
//

#import "DMLayer.h"

@implementation DMLayer

- (id<CAAction>)actionForKey:(NSString *)event
{
    if ([self.delegate respondsToSelector:@selector(actionForLayer:forKey:)]) {
        return [self.delegate actionForLayer:self forKey:event];
    }
    
    if (self.actions[event]) {
        return self.actions[event];
    }
    
    if (self.style[event]) {
        return self.style[event];
    }
    
    return [CALayer defaultActionForKey:event];
}

@end
