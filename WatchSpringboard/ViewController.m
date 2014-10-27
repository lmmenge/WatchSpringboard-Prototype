//
//  ViewController.m
//  WatchSpringboard
//
//  Created by Lucas Menge on 10/23/14.
//  Copyright (c) 2014 Lucas Menge. All rights reserved.
//

#import "ViewController.h"

#import "LMViewControllerView.h"
#import "LMSpringboardItemView.h"
#import "LMSpringboardView.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@end

@implementation ViewController

#pragma mark - Privates

- (LMViewControllerView*)customView
{
  return (LMViewControllerView*)self.view;
}

- (LMSpringboardView*)springboard
{
  return [(LMViewControllerView*)self.view springboard];
}

#pragma mark Notifications

- (void)LM_didBecomeActive
{
  if([self customView].isAppLaunched == NO)
  {
    [[self springboard] centerOnIndex:0 zoomScale:1 animated:NO];
    [[self springboard] doIntroAnimation];
    [self springboard].alpha = 1;
  }
}

- (void)LM_didEnterBackground
{
  if([self customView].isAppLaunched == NO)
    [self springboard].alpha = 0;
}

#pragma mark UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
  if([self springboard].zoomScale < [self springboard].minimumZoomLevelToLaunchApp)
    return NO;
  return YES;
}

#pragma mark - Input

- (void)LM_respringTapped:(id)sender
{
  if([self customView].isAppLaunched == YES)
  {
     [[self customView] quitApp];
    [UIView animateWithDuration:0.3 animations:^{
      [self setNeedsStatusBarAppearanceUpdate];
    }];
  }
  else
  {
    LMSpringboardView* springboard = [self springboard];
    [UIView animateWithDuration:0.3 animations:^{
      springboard.alpha = 0;
    } completion:^(BOOL finished) {
      [springboard doIntroAnimation];
      springboard.alpha = 1;
    }];
  }
}

- (void)LM_iconTapped:(UITapGestureRecognizer*)sender
{
  UIView* item = sender.view;
  while(item != nil && [item isKindOfClass:[LMSpringboardItemView class]] == NO)
    item = item.superview;
  [[self customView] launchAppItem:(LMSpringboardItemView*)item];
  [UIView animateWithDuration:0.5 animations:^{
    [self setNeedsStatusBarAppearanceUpdate];
  }];
}

#pragma mark - UIViewController

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LM_didBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LM_didEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
  
  LMSpringboardView* springboard = [self springboard];
  [springboard centerOnIndex:0 zoomScale:springboard.zoomScale animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor blackColor];
    
    // add blur behind status bar
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    blurView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 22);
    [self.view addSubview:blurView];
    
  [[self customView].respringButton addTarget:self action:@selector(LM_respringTapped:) forControlEvents:UIControlEventTouchUpInside];
  [self springboard].alpha = 0;
  
  for(LMSpringboardItemView* item in [self springboard].itemViews)
  {
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(LM_iconTapped:)];
    tap.numberOfTapsRequired = 1;
    tap.delegate = self;
    [item addGestureRecognizer:tap];
  }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
  if([self isViewLoaded] == YES && [self customView].isAppLaunched == YES)
    return UIStatusBarStyleDefault;
  else
    return UIStatusBarStyleLightContent;
}

@end
