//
//  ViewController.m
//  JiaKaoBaoDian
//
//  Created by ligulfzhou on 2/1/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

#import "ViewController.h"
#import "QuestionViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *staticTableData;
    NSArray *staticTableViewControllers;
    UITableView *staticTable;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    staticTableData = [[NSArray alloc] initWithObjects:@"开始2016科目一", @"其他考试", @"其他考试2", nil];
    staticTableViewControllers = [[NSArray alloc] initWithObjects:[QuestionViewController class], @"其他考试", @"其他考试2", nil];
    [self setUpView];
}

-(void)setUpView
{
    staticTable = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, 50 * [staticTableData count]) style:UITableViewStyleGrouped];
    staticTable.dataSource = self;
    staticTable.delegate = self;
    [self.view addSubview:staticTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableview datasource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = staticTableData[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [staticTableData count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld - %@", indexPath.row, staticTableData[indexPath.row]);
    
    UIViewController *vc = [staticTableViewControllers[indexPath.row] new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
