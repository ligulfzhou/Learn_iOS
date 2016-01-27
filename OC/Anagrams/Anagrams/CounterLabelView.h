//
//  CounterLabelView.h
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounterLabelView : UILabel

@property (assign, nonatomic) int value;

+(instancetype)labelWithFont:(UIFont *)font andFrame:(CGRect)r andValue:(int)value;

//countTo:withDuration: will animate the label’s text,
//counting up or down to/from the current value to the one provided.
//The animation will have the given duration in seconds.
-(void)countTo:(int)to withDuration:(float) t;

@end
