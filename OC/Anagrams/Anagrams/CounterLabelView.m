//
//  CounterLabelView.m
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "CounterLabelView.h"

@implementation CounterLabelView
{
    int endValue;
    double delta;
}

+(instancetype)labelWithFont:(UIFont *)font andFrame:(CGRect)r andValue:(int)value
{
    CounterLabelView *label = [[CounterLabelView alloc] initWithFrame:r];
    
    if (label) {
        label.backgroundColor = [UIColor clearColor];
        label.font = font;
        label.value = value;
    }
    return label;
}

//update the label`s text
-(void)setValue:(int)value
{
    _value = value;
    self.text = [NSString stringWithFormat:@" %i", self.value];
}

//increment/decrement method
-(void)updateValueBy:(NSNumber *)valueDelta
{
    //1 update the property
    self.value += [valueDelta intValue];
    
    //2 check for reaching the end value
    if ([valueDelta intValue] > 0) {
        if (self.value > endValue) {
            self.value = endValue;
            return;
        }
    }else{
        if (self.value < endValue) {
            self.value = endValue;
            return;
        }
    }
    
    //3 if not - do it again
    [self performSelector:@selector(updateValueBy:) withObject:valueDelta afterDelay:delta];
}

-(void)countTo:(int)to withDuration:(float)t
{
    //1 detect the time for the animation
    delta = t / (abs(to - self.value) + 1);
    if (delta < 0.05) {
        delta = 0.05;
    }
    
    //2 set the end value
    endValue = to;
    
    //3 cancel previous schedule action**************
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    //4 detect which way counting goes
    if (to - self.value > 0) {
        //count up
        [self updateValueBy:@1];
    }else{
        //count down
        [self updateValueBy:@-1];
    }
}

@end
