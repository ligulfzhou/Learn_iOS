//
//  ExplodeView.m
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "ExplodeView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ExplodeView
{
    CAEmitterLayer * _emitter;
}


+(Class) layerClass
{
    //configure the UIView to have emitter layer
    return [CAEmitterLayer class];
}
@end
