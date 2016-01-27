//
//  GameController.h
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Level.h"
#import "TileView.h"
#import "HUDView.h"
#import "GameData.h"
#import "AudioController.h"

@interface GameController : UIViewController<TileDragDelegateProtocol>

//the view to add game elements to
@property(weak, nonatomic) UIView *gameView;

//play audio controller
@property(strong, nonatomic) AudioController *audioController;

//the current level
@property(strong, nonatomic) Level *level;

//along the rest of the class property
@property (nonatomic, weak) HUDView *hud;

//with the other properties
@property (nonatomic, strong) GameData *data;

//display a new anagram on the screen
-(void)dealRamdonAnagram;

@end
