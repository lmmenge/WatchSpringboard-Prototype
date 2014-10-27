//
//  LMViewControllerView.h
//  WatchSpringboard
//
//  Created by Lucas Menge on 10/24/14.
//  Copyright (c) 2014 Lucas Menge. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMSpringboardItemView;
@class LMSpringboardView;

@interface LMViewControllerView : UIView

@property (readonly) LMSpringboardView* springboard;
@property (readonly) UIView* appView;
@property (readonly) UIButton* respringButton;
@property (readonly) BOOL isAppLaunched;

- (void)launchAppItem:(LMSpringboardItemView*)item;
- (void)quitApp;

@end
