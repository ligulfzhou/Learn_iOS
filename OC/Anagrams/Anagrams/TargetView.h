//
//  TargetView.h
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TargetView : UIImageView

@property (strong, nonatomic, readonly) NSString *letter;
@property (assign, nonatomic) BOOL isMatched;

-(instancetype)initWithLetter:(NSString *)letter andSideLength:(float) sideLength;

@end
