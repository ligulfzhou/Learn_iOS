//
//  HUDView.m
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "HUDView.h"
#import "config.h"

@implementation HUDView

+(instancetype)viewWithRect:(CGRect)r
{
    //create the hud layer
    HUDView *hud = [[HUDView alloc] initWithFrame:r];
    
    //the stopwatch
    hud.stopwatch = [[StopwatchView alloc]initWithFrame:CGRectMake(kScreenWidth / 2, 0, 300, 100)];
    hud.stopwatch.seconds = 0;
    [hud addSubview:hud.stopwatch];
    
    //"points" label
    UILabel *pts = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-100,30,140,70)];
    pts.backgroundColor = [UIColor clearColor];
    pts.font = kFontHUD;
    pts.text = @" points: ";
    [hud addSubview:pts];
    
    //the dynamic points label
    hud.gamePoints = [CounterLabelView labelWithFont:kFontHUD andFrame:CGRectMake(kScreenWidth + 100, 30, 200, 70) andValue:0];
    hud.gamePoints.textColor = [UIColor colorWithRed:0.38 green:0.098 blue:0.035 alpha:1];
    [hud addSubview:hud.gamePoints];
    
    // important !!!
    hud.userInteractionEnabled = NO;
    return hud;
}

@end
