//
//  TileView.h
//  Anagrams
//
//  Created by ligulfzhou on 1/27/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TileView;



@protocol TileDragDelegateProtocol <NSObject>

-(void)tileView:(TileView *)tileView didDragToPoint:(CGPoint)pt;

@end



@interface TileView : UIImageView

@property (nonatomic, strong, readonly) NSString *letter;
@property (assign, nonatomic) BOOL isMatched;
@property (weak, nonatomic) id<TileDragDelegateProtocol> dragDelegate;

-(instancetype) initWithLetter:(NSString *)letter andSideLength:(float)sideLength;
-(void)randomize;
@end
