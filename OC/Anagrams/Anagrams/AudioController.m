//
//  AudioController.m
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "AudioController.h"
#import <AVFoundation/AVFoundation.h>

@implementation AudioController
{
    NSMutableDictionary * audio;
}

-(void) preloadAudioEffects:(NSArray *)effectFileNames
{
    //initialize the effects array
    audio = [NSMutableDictionary dictionaryWithCapacity:effectFileNames.count];

    //loop over the filenames
    for (NSString *effect in effectFileNames) {
        
        //1 get the file path URL
        NSString *soundPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:effect];
        NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
        
        //2 load the file content
        NSError *loadError = nil;
        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:&loadError];
        NSAssert(loadError == nil, @"load sound failed");
        
        //3 prepare the play
        player.numberOfLoops = 0;
        [player prepareToPlay];  //preload the audio buffer for that sound
        
        //4 add to the array ivar
        audio[effect] = player;
    }
}

-(void)playEffect:(NSString *)name
{
    NSAssert(audio, @"effect not found");
    
    AVAudioPlayer *player = audio[name];
    if (player.isPlaying) {
        player.currentTime = 0;
    }else{
        [player play];
    }
}

@end
