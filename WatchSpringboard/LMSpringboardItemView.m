//
//  LMSpringboardItemView.m
//  WatchSpringboard
//
//  Created by Lucas Menge on 10/24/14.
//  Copyright (c) 2014 Lucas Menge. All rights reserved.
//

#import "LMSpringboardItemView.h"

static double const kLMSpringboardItemViewSmallThreshold = 0.75;

@interface LMSpringboardItemView ()
{
  UIView* _visualEffectView;
  UIImageView* _visualEffectMaskView;
}

@end

#pragma mark -

@implementation LMSpringboardItemView

- (void)setScale:(CGFloat)scale
{
  [self setScale:scale animated:NO];
}

- (void)setTitle:(NSString*)title
{
  _label.text = title;
  [self setNeedsLayout];
}

- (void)setIsFolderLike:(BOOL)isFolderLike
{
  if(_isFolderLike != isFolderLike)
  {
    _isFolderLike = isFolderLike;
    if(_isFolderLike == YES)
    {
      _visualEffectView = [[UIView alloc] init];
      UIView* vev = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
      vev.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
      [_visualEffectView addSubview:vev];
      [self insertSubview:_visualEffectView atIndex:0];
      
      _visualEffectMaskView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon.png"]];
      _visualEffectMaskView.contentMode = UIViewContentModeScaleAspectFit;
      _visualEffectMaskView.autoresizingMask = vev.autoresizingMask;
      _visualEffectView.maskView = _visualEffectMaskView;
    }
    else
    {
      [_visualEffectView removeFromSuperview];
      _visualEffectView = nil;
      _visualEffectMaskView = nil;
    }
  }
}

- (void)setScale:(CGFloat)scale animated:(BOOL)animated
{
  if(_scale != scale)
  {
    BOOL wasSmallBefore = (_scale < kLMSpringboardItemViewSmallThreshold);
    _scale = scale;
    [self setNeedsLayout];
    if((_scale < kLMSpringboardItemViewSmallThreshold) != wasSmallBefore)
    {
      if(animated == YES)
      {
        [UIView animateWithDuration:0.3 animations:^{
          [self layoutIfNeeded];
          if(_scale < kLMSpringboardItemViewSmallThreshold)
            _label.alpha = 0;
          else
            _label.alpha = 1;
        }];
      }
      else
      {
        if(_scale < kLMSpringboardItemViewSmallThreshold)
          _label.alpha = 0;
        else
          _label.alpha = 1;
      }
    }
  }
}

#pragma mark - UIView

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  CGSize size = self.bounds.size;
  
  _icon.center = CGPointMake(size.width*0.5, size.height*0.5);
  _icon.bounds = CGRectMake(0, 0, size.width, size.height);
  
  _visualEffectView.center = _icon.center;
  _visualEffectView.bounds = _icon.bounds;
  _visualEffectMaskView.center = _icon.center;
  _visualEffectMaskView.bounds = _icon.bounds;
  
  [_label sizeToFit];
  _label.center = CGPointMake(size.width*0.5, size.height+4);

  float scale = 60/size.width;
  _icon.transform = CGAffineTransformMakeScale(scale, scale);
  _visualEffectView.transform = _icon.transform;
}

- (instancetype)init
{
  self = [super init];
  if(self)
  {
    _scale = 1;
    
    _label = [[UILabel alloc] init];
    _label.opaque = NO;
    _label.backgroundColor = nil;
    _label.textColor = [UIColor whiteColor];
    _label.font = [UIFont systemFontOfSize:[UIFont smallSystemFontSize]];
    [self addSubview:_label];
    
    _icon = [[UIImageView alloc] init];
    [self addSubview:_icon];
  }
  return self;
}

@end
