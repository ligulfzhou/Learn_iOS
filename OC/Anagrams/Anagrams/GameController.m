//
//  GameController.m
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "GameController.h"
#import "config.h"
#import "TileView.h"
#import "TargetView.h"

@implementation GameController
{
    NSMutableArray *_tiles;
    NSMutableArray *_targets;
    int _secondsLeft;
    NSTimer *_timer;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        //initialize
        self.data = [[GameData alloc] init];
        
        self.audioController = [[AudioController alloc] init];
        [self.audioController preloadAudioEffects:kAudioEffectFiles];
    }
    return self;
}

-(void)dealRamdonAnagram
{
    //1
    NSAssert(self.level.anagrams, @"no level loaded");
    
    //2 ramdon anagram
    int ramdonIndex = arc4random()%[self.level.anagrams count];
    NSArray *anaPair = self.level.anagrams[ramdonIndex];
    
    //3
    NSString *anagram1 = anaPair[0];
    NSString *anagram2 = anaPair[1];
    
    //4
    int ana1len = [anagram1 length];
    int ana2len = [anagram2 length];
    
    NSLog(@"phrase1[%i]: %@", ana1len, anagram1);
    NSLog(@"phrase2[%i]: %@", ana2len, anagram2);
    
    float tileSize = ceilf(kScreenWidth * 0.9 / (float) MAX(ana1len, ana2len)) - kTileMargin;
    
    // get the left margin for first tile
    float xOffset = (kScreenWidth - MAX(ana1len, ana2len) * (tileSize + kTileMargin)) / 2;
    
    //adjust for tile center (instead of the tile`s origin)
    xOffset += tileSize / 2;
    
    //1 initialize tile list
    _tiles = [NSMutableArray arrayWithCapacity:ana1len];
    
    //2 create tiles
    for (int i=0; i<ana1len; i++) {
        NSString *letter = [anagram1 substringWithRange:NSMakeRange(i, 1)];
        
        //3
        if (![letter isEqualToString:@" "]) {
            TileView *tile = [[TileView alloc] initWithLetter:letter andSideLength:tileSize];
            tile.center = CGPointMake(xOffset + i*(tileSize+kTileMargin), kScreenHeight / 4 * 2);
            [tile randomize];
            //4
            [self.gameView addSubview:tile];
            [_tiles addObject:tile];
            
            tile.dragDelegate = self;
        }
    }
    
    //1 initialize target list
    _targets = [NSMutableArray arrayWithCapacity:ana2len];
    
    //create targets
    for (int i=0; i<ana2len; i++) {
        NSString *letter = [anagram2 substringWithRange:NSMakeRange(i, 1)];
        
        if (![letter isEqualToString:@" "]) {
            TargetView *target = [[TargetView alloc] initWithLetter:letter andSideLength:tileSize];
            target.center = CGPointMake(xOffset + i*(tileSize + kTileMargin), kScreenHeight / 4);
            
            [self.gameView addSubview:target];
            [_targets addObject:target];
        }
    }
    [self startStopwatch];
}

# pragma mark - TileViewDelegate
//a tile was dragged, check if matched a target
-(void)tileView:(TileView *)tileView didDragToPoint:(CGPoint)pt
{
    TargetView * targetView = nil;
    
    for (TargetView *tv in _targets) {
        if (CGRectContainsPoint(tv.frame, pt)) {
            targetView = tv;
            break;
        }
    }
    
    //1 check if target was found
    if (targetView != nil) {
        //2 check if letter matches
        if ([targetView.letter isEqualToString:tileView.letter]) {
            //3
            NSLog(@"success! you should place the tile here");
            [self placeTile:tileView atTarget:targetView];
            
            //more stuff to do on sucess here
            NSLog(@"check if the player has completed the phrase");
            self.data.points += self.level.pointsPerTile;
            [self.hud.gamePoints countTo:self.data.points withDuration:1.5];
            
            [self.audioController playEffect:kSoundDing];
            [self checkForSuccess];
        }else{
            //4
            NSLog(@"failure, let the player know this tile doesnot belong here");
            
            // more stuff to do on failure here
            self.data.points -= self.level.pointsPerTile / 2;
            [self.hud.gamePoints countTo:self.data.points withDuration:0.75];
            //1
            //visualize the mistake
            [tileView randomize];
            
            [self.audioController playEffect:kSoundWrong];
            
            //2
            [UIView animateWithDuration:0.35
                                  delay:0.00
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 tileView.center = CGPointMake(tileView.center.x + randomf(-20, 20),
                                                               tileView.center.y + randomf(20, 30));
                             } completion:nil];


        }
    }
}

-(void)placeTile:(TileView *)tileView atTarget:(TargetView *)targetView
{
    //1
    targetView.isMatched = YES;
    tileView.isMatched = YES;
    
    //2
    tileView.userInteractionEnabled = NO;
    
    //3
    [UIView animateWithDuration:0.35
                          delay:0.00
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         tileView.center = targetView.center;
                         tileView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         targetView.hidden = YES;
                     }];
}

-(void)checkForSuccess
{
    for(TargetView *tv in _targets){
        if (tv.isMatched == NO) {
            return;
        }
    }
    NSLog(@"Game Over!");
    [self stopStopwatch];
}

-(void)startStopwatch
{
    //initialize the timer HUD
    _secondsLeft = self.level.timeToSolve;
    [self.hud.stopwatch setSeconds:_secondsLeft];
    
    //schedule a new timer
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                              target:self
                                            selector:@selector(tick:)
                                            userInfo:nil
                                             repeats:YES];
}

-(void)stopStopwatch
{
    [_timer invalidate];
    _timer = nil;
}

-(void)tick:(NSTimer *)timer
{
    _secondsLeft --;
    [self.hud.stopwatch setSeconds:_secondsLeft];
    if (_secondsLeft == 0) {
        [self stopStopwatch];
    }
}

@end
