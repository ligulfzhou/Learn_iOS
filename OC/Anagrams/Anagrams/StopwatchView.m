//
//  StopwatchView.m
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "StopwatchView.h"
#import "config.h"

@implementation StopwatchView

-(void)setSeconds:(int)seconds
{
    self.text = [NSString stringWithFormat:@" %02.f : %02i", round(seconds / 60), seconds % 60];
    
    //initialization code
    self.backgroundColor = [UIColor clearColor];
    self.font = kFontHUDBig;
}
@end
