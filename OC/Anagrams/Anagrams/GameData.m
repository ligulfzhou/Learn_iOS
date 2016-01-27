//
//  GameData.m
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "GameData.h"

@implementation GameData

-(void)setPoints:(int)points
{
    _points = MAX(points, 0);
}

@end
