//
//  CollectionViewCell.m
//  Collection_View
//
//  Created by ligulfzhou on 1/28/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell()
{
    UILabel *label;
}
@end

@implementation CollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        if (_title) {
            label.text = _title;
        }else{
            label.text = @"text";
        }
        [self.viewForFirstBaselineLayout addSubview:label];
    }
    return self;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    label.text = title;
}
//
//-(void)setTitle:(NSString *)title
//{
//    _title = title;
//    self.label.text = title;
//}

//-(instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.superview.center.x, self.superview.center.y)];
//        label.text = _title;
//        
//        [self addSubview:label];
//    }
//    return self;
//}

@end
