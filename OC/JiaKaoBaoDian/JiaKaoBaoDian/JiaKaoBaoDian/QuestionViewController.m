//
//  QuestionViewController.m
//  JiaKaoBaoDian
//
//  Created by ligulfzhou on 2/1/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

#import "QuestionViewController.h"
#import "QuestionView.h"
#import "AFHTTPSessionManager+ApiClient.h"

@interface QuestionViewController ()<QuestionDelegate>
{
    NSMutableArray *questions;  // Question *
    int currentQuestionIndex;  // 现在是第几个问题
    Question *currentQuestion;
    QuestionView *questionView;
}

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    questions = [[NSMutableArray alloc] init];
    [self getQuestions];
}

-(void)getQuestions
{
    [[AFHTTPSessionManager ApiClient] GET:@"http://localhost:8888/jiakao"
                               parameters:nil
                                  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                      Question *question = nil;
                                      for (int i = 0; i < [responseObject count]; i++) {
                                          question = [[Question alloc] initWithNo:[[responseObject[i] valueForKey:@"no"] intValue] andType:[[responseObject[i] valueForKey:@"type"] intValue] andTitle:[responseObject[i] valueForKey:@"title"] andImage:[responseObject[i] valueForKey:@"image"] andOptions:[responseObject[i] valueForKey:@"options"] andAnswer:[[responseObject[i] valueForKey:@"answer"] intValue] andAnalysis:[responseObject[i] valueForKey:@"analysis"]];
                                          
                                          [questions addObject:question];
                                      }
//                                      NSLog(@"%@", questions);
                                      
                                      [self setUpQuestions];
                                  }
                                  failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                      nil;
                                  }];
}

-(void) setUpQuestions
{
    currentQuestionIndex = 0;
    currentQuestion = questions[currentQuestionIndex];
    
    questionView = [[QuestionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andQuestion:questions[currentQuestionIndex]];
    questionView.delegate = self;
    [self.view addSubview:questionView];
}

//
//-(void)testButtonClick:(id)sender
//{
//    NSLog(@"hello world");
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)questionView:(QuestionView *)questionView selectAnswer:(int)answer
{
//    NSLog(@"%d",  [currentQuestion.answer substringWithRange:NSMakeRange(0, 1)] == answer);
    if (answer == currentQuestion.answer) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"回答结果" message:@"回答正确" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        [self nextQuestion];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"回答结果" message:@"回答错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

-(void)nextQuestion
{
    currentQuestionIndex += 1;
    currentQuestion = questions[currentQuestionIndex];
    
    [questionView removeFromSuperview];
    
    questionView = [[QuestionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andQuestion:questions[currentQuestionIndex]];
    questionView.delegate = self;
    [self.view addSubview:questionView];
    
    NSLog(@"%lu", (unsigned long)[self.view.subviews count]);
}
@end
