//
//  LMSpringboardView.h
//  WatchSpringboard
//
//  Created by Lucas Menge on 10/23/14.
//  Copyright (c) 2014 Lucas Menge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMSpringboardView : UIScrollView

@property (copy,nonatomic) NSArray* itemViews;
@property (nonatomic) NSUInteger itemDiameter;
@property (nonatomic) NSUInteger itemPadding;
@property (nonatomic) double minimumItemScaling;
@property (nonatomic) double minimumZoomLevelToLaunchApp;
@property (readonly) UITapGestureRecognizer* doubleTapGesture;

- (void)showAllContentAnimated:(BOOL)animated;
- (NSUInteger)indexOfItemClosestToPoint:(CGPoint)pointInSelf;
- (void)centerOnIndex:(NSUInteger)index zoomScale:(CGFloat)zoomScale animated:(BOOL)animated;

- (void)doIntroAnimation;

@end
