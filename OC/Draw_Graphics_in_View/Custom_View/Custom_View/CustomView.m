//
//  CustomView.m
//  Custom_View
//
//  Created by ligulfzhou on 1/28/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

#import "CustomView.h"
#import <Foundation/Foundation.h>

@implementation CustomView

-(void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    [[UIColor greenColor] setFill];
    [path fill];
}

@end
