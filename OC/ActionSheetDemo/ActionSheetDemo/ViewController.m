//
//  ViewController.m
//  ActionSheetDemo
//
//  Created by ligulfzhou on 1/31/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIActionSheetDelegate>
{
    UIButton *normal;
//    UIButton *deleteConfirm;
//    UIButton *showColor;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - setup view
-(void)setUpView
{
    normal = [UIButton buttonWithType:UIButtonTypeSystem];
    normal.frame = CGRectMake(0, 10, self.view.frame.size.width, 100);
    [normal setTitle:@"show normal" forState:UIControlStateNormal];
    [normal addTarget:self action:@selector(showNormalActionSheet:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:normal];
    
//    deleteConfirm = [UIButton buttonWithType:UIButtonTypeSystem];
//    deleteConfirm.frame = CGRectMake(0, 110, self.view.frame.size.width, 100);
//    [deleteConfirm setTitle:@"show delete confirm" forState:UIControlStateNormal];
//    [self.view addSubview:deleteConfirm];
//    
//    showColor = [UIButton buttonWithType:UIButtonTypeSystem];
//    showColor.frame = CGRectMake(0, 220, self.view.frame.size.width, 100);
//    [showColor setTitle:@"show color" forState:UIControlStateNormal];
//    [self.view addSubview:showColor];
}

#pragma mark - button target function
-(void)showNormalActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"normal" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"destructive" otherButtonTitles:@"other1", @"other2", nil];
    
    // showNormalActionSheet:
    actionSheet.tag = 100;
    
    [actionSheet showInView:self.view];
}


#pragma mark - actionsheet delegate 
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"index = %d, Title = %@, tag = %d", buttonIndex, actionSheet.title, actionSheet.tag);
}


@end
