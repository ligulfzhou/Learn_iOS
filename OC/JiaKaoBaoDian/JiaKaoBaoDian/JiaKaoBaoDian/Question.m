//
//  Question.m
//  JiaKaoBaoDian
//
//  Created by ligulfzhou on 2/1/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

#import "Question.h"

@implementation Question

-(instancetype)initWithNo:(int)no andType:(int)type andTitle:(NSString *)title andImage:(NSString *)image andOptions:(NSArray *)options andAnswer:(int)answer andAnalysis:(NSString *)analysis
{
    self = [super init];
    if (self) {
        self.no = no;
        self.type = type;
        self.title = title;
        self.image = image;
        self.options = options;
        self.answer = answer;
        self.analysis = analysis;
    }
    return self;
}

@end
