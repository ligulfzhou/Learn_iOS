//
//  Question.h
//  JiaKaoBaoDian
//
//  Created by ligulfzhou on 2/1/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, assign) int no;
@property (nonatomic, assign) int type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSArray *options;
@property (nonatomic, assign) int answer;
@property (nonatomic, copy) NSString *analysis;

-(instancetype) initWithNo:(int)no andType:(int)type andTitle:(NSString *)title andImage:(NSString *)image andOptions:(NSArray *)options andAnswer:(int)answer andAnalysis:(NSString *)analysis;

@end
