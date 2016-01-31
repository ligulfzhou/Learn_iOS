//
//  ViewController.h
//  Collection_View
//
//  Created by ligulfzhou on 1/28/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

