//
//  HUDView.h
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StopwatchView.h"
#import "CounterLabelView.h"

@interface HUDView : UIView

@property (nonatomic, strong)StopwatchView *stopwatch;
@property (nonatomic, strong) CounterLabelView *gamePoints;

+(instancetype)viewWithRect:(CGRect)r;
@end
