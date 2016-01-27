//
//  TargetView.m
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "TargetView.h"

@implementation TargetView

-(instancetype)initWithFrame:(CGRect)frame
{
    NSAssert(NO, @"use initWithLetter: andSideLength instead");
    return nil;
}

-(instancetype)initWithLetter:(NSString *)letter andSideLength:(float)sideLength
{
    UIImage *img = [UIImage imageNamed:@"slot"];
    self = [super initWithImage:img];
    
    if (self) {
        self.isMatched = NO;
        
        float scale = sideLength / img.size.width;
        self.frame = CGRectMake(0, 0, img.size.width * scale, img.size.height * scale);
        
        _letter = letter;
    }
    return self;
}

@end
