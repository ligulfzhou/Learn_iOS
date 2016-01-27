//
//  AudioController.h
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioController : NSObject

-(void)playEffect:(NSString *)name;

-(void)preloadAudioEffects:(NSArray *)effectFileNames;

@end
