//
//  QuestionView.h
//  JiaKaoBaoDian
//
//  Created by ligulfzhou on 2/1/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@class QuestionView;


@protocol QuestionDelegate <NSObject>

@required
-(void)questionView:(QuestionView *)questionView selectAnswer:(int)answer;

@end


@interface QuestionView : UIView

@property (nonatomic, strong) Question *question;

@property (nonatomic, weak) id<QuestionDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame andQuestion:(Question *)question;

@end
