//
//  QuestionView.m
//  JiaKaoBaoDian
//
//  Created by ligulfzhou on 2/1/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

#import "QuestionView.h"
#import <Masonry.h>

#define OFFSET 20
#define PADDING 20

@interface QuestionView()
{
    UITextView *titleLabel;
    NSMutableArray *options;   // buttons
    
}
@end


@implementation QuestionView

-(instancetype)initWithFrame:(CGRect)frame andQuestion:(Question *)question
{
    self = [super initWithFrame:frame];
    _question = question;
    
    options = [NSMutableArray new];
    
    if (self) {
        titleLabel = [[UITextView alloc] init];
        
//        titleLabel.text = _question.title;
//        titleLabel.textColor = [UIColor blueColor];
        titleLabel.attributedText = [[NSAttributedString alloc] initWithString:_question.title attributes:@{NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]}];
        titleLabel.backgroundColor = [UIColor purpleColor];
//        [titleLabel.attributedText ]
        [self addSubview:titleLabel];
        
        for (int i = 0; i < [_question.options count]; i++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//            [button setTitle:_question.options[i] forState:UIControlStateNormal];
            
            [button setAttributedTitle:[[NSAttributedString alloc] initWithString:_question.options[i] attributes:@{NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline], NSForegroundColorAttributeName: [UIColor greenColor]}] forState:UIControlStateNormal];
            [button setTag:i];
            
            [button addTarget:self action:@selector(clickAnswer:) forControlEvents:UIControlEventTouchDown];
            
            [options addObject:button];
            [self addSubview:button];
        }
        UIView *superview = self;
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview.mas_top).offset(75);
            make.left.equalTo(superview.mas_left).offset(PADDING);
            make.right.equalTo(superview.mas_right).offset(-PADDING);
            make.bottom.equalTo([options[0] mas_top]).offset(-PADDING);
            make.height.equalTo(@50);
        }];
        [options[0] mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(titleLabel.mas_bottom).offset(0);
            make.left.equalTo(superview.mas_left).offset(PADDING);
            make.right.equalTo(superview.mas_right).offset(-PADDING);
            make.bottom.equalTo([options[1] mas_top]).offset(-PADDING);
            make.height.equalTo(@50);
        }];
        for (int i = 1; i < [options count] - 1; i ++) {
            [options[i] mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo([options[i-1] mas_bottom]).offset(PADDING);
                make.left.equalTo(superview.mas_left).offset(PADDING);
                make.right.equalTo(superview.mas_right).offset(-PADDING);
                make.bottom.equalTo([options[i + 1] mas_top]).offset(-PADDING);
                make.height.equalTo(@50);
            }];
        }
        [options[[options count] - 1] mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo([options[[options count] - 2] mas_bottom]).offset(PADDING);
            make.left.equalTo(superview.mas_left).offset(PADDING);
            make.right.equalTo(superview.mas_right).offset(-PADDING);
//            make.bottom.equalTo(superview.mas_bottom).offset(500);
            make.height.equalTo(@50);
        }];
        
        
    }
    return self;
}

-(void)clickAnswer:(UIButton *)sender
{
    NSLog(@"button click - %ld", sender.tag);
    if (_delegate) {
        [_delegate questionView:self selectAnswer:sender.tag];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
