//
//  Level.m
//  Anagrams
//
//  Created by ligulfzhou on 1/26/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "Level.h"

@implementation Level

+(instancetype)levelWithNum:(int)levelNum
{
    //1 find .plist file for this level
    NSString *fileName = [NSString stringWithFormat:@"level%i.plist", levelNum];
    NSString *levelPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
    
    //2 load .plist file
    NSDictionary *levelDict = [NSDictionary dictionaryWithContentsOfFile:levelPath];
    
    //3 validation
    NSAssert(levelPath, @"level config file not found");
    
    //4 create level instance
    Level *l = [[Level alloc] init];
    l.pointsPerTile = [levelDict[@"pointsPerTile"] intValue];
    l.anagrams = levelDict[@"anagrams"];
    l.timeToSolve = [levelDict[@"timeToSolve"] intValue];
    
    return l;
}


@end
