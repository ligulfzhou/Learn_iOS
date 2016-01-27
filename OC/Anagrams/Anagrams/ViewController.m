//
//  ViewController.m
//  Anagrams
//
//  Created by Marin Todorov on 16/02/2013.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "config.h"
#import "ViewController.h"
#import "Level.h"
#import "GameController.h"

@interface ViewController ()
@property (nonatomic, strong) GameController *controller;
@end

@implementation ViewController

//initWithCoder: is called automatically when the app initializes itself from its storyboard.
-(instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.controller = [[GameController alloc] init];
    }
    return self;
}

//setup the view and instantiate the game controller
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    Level *level = [Level levelWithNum:3];
//    NSLog(@"%@", level.anagrams);
    UIView *gameLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenHeight, kScreenWidth)];
    
//    HUDView *hudView = [HUDView viewWithRect:CGRectMake(0, 0, kScreenWidth, kScreenWidth)];
//    [self.view addSubview:hudView];
//    self.controller.hud = hudView;
    
    [self.view addSubview:gameLayer];
    self.controller.gameView = gameLayer;
    
    HUDView *hudView = [HUDView viewWithRect:CGRectMake(0, 0, kScreenWidth, kScreenWidth)];
    [self.view addSubview:hudView];
    self.controller.hud = hudView;
    
    self.controller.level = [Level levelWithNum:1];
    [self.controller dealRamdonAnagram];
}

@end
