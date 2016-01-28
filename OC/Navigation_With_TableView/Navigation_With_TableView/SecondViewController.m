//
//  SecondViewController.m
//  Navigation_With_TableView
//
//  Created by ligulfzhou on 1/28/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController()

@property (nonatomic, strong) UILabel *uilabel;

@end

@implementation SecondViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    _uilabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    _uilabel.text = self.label;
    [self.view addSubview:_uilabel];
}

//-(void) setLabel:(NSString *)label
//{
//    self.label = label;
//    _uilabel.text = label;
//}

@end
