//
//  Level.h
//  Anagrams
//
//  Created by ligulfzhou on 1/26/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Level : NSObject

@property (assign, nonatomic) int pointsPerTile;
@property (assign, nonatomic) int timeToSolve;
@property (strong, nonatomic) NSArray *anagrams;

+(instancetype) levelWithNum:(int) levelNum;

@end
