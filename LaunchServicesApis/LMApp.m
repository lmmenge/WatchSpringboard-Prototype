//
//  LMApp.m
//  WatchSpringboard
//
//  Created by Andreas Verhoeven on 28-10-14.
//  Copyright (c) 2014 Lucas Menge. All rights reserved.
//

#import "LMApp.h"

@interface UIImage ()
+ (id)_iconForResourceProxy:(id)arg1 variant:(int)arg2 variantsScale:(float)arg3;
+ (id)_applicationIconImageForBundleIdentifier:(id)arg1 format:(int)arg2 scale:(double)arg3;
@end

#pragma mark -

@interface PrivateApi_LSApplicationProxy

+ (instancetype)applicationProxyForIdentifier:(NSString*)identifier;
@property (nonatomic, readonly) NSString* localizedShortName;
@property (nonatomic, readonly) NSString* localizedName;
@property (nonatomic, readonly) NSString* bundleIdentifier;
@property (nonatomic, readonly) NSArray* appTags;

@end

#pragma mark -

@implementation LMApp
{
	PrivateApi_LSApplicationProxy* _applicationProxy;
	UIImage* _icon;
}

- (NSString*)name
{
    //return _applicationProxy.localizedName ?: _applicationProxy.localizedShortName;
	return @"";
}

- (NSString*)bundleIdentifier
{
	return [_applicationProxy bundleIdentifier];
}

- (UIImage*)icon
{
	if(nil == _icon)
	{
        _icon = [UIImage _applicationIconImageForBundleIdentifier:self.bundleIdentifier format:10 scale:2.0];
        //_icon = [UIImage imageNamed:@"App Icon.png"];
        
        if([self.bundleIdentifier  isEqual: @"com.apple.Preferences"])
        {
            _icon = [UIImage imageNamed:@"Icon-29@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.MobileStore"])
        {
            _icon = [UIImage imageNamed:@"Icon-6@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.mobilesafari"])
        {
            _icon = [UIImage imageNamed:@"Icon-24@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.podcasts"])
        {
            _icon = [UIImage imageNamed:@"Icon-12@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.stocks"])
        {
            _icon = [UIImage imageNamed:@"Icon-9@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.compass"])
        {
            _icon = [UIImage imageNamed:@"Icon-3@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.weather"])
        {
            _icon = [UIImage imageNamed:@"Icon-13@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.gamecenter"])
        {
            _icon = [UIImage imageNamed:@"Icon-14@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.reminders"])
        {
            _icon = [UIImage imageNamed:@"Icon-31@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.MobileAddressBook"])
        {
            _icon = [UIImage imageNamed:@"Icon-10@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.Passbook"])
        {
            _icon = [UIImage imageNamed:@"Icon-7@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.VoiceMemos"])
        {
            _icon = [UIImage imageNamed:@"Icon-21@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.facetime"])
        {
            _icon = [UIImage imageNamed:@"Icon-18@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.calculator"])
        {
            _icon = [UIImage imageNamed:@"Icon-1@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.iCloudDriveApp"])
        {
            _icon = [UIImage imageNamed:@"Icon-34@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.mobileme.fmip1"])
        {
            _icon = [UIImage imageNamed:@"Icon-39@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.mobileme.fmf1"])
        {
            _icon = [UIImage imageNamed:@"Icon-33@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.Maps"])
        {
            _icon = [UIImage imageNamed:@"Icon-35@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.mobilesslideshow"])
        {
            _icon = [UIImage imageNamed:@"Icon-5@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.mobilenotes"])
        {
            _icon = [UIImage imageNamed:@"Icon-30@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.mobilecal"])
        {
            _icon = [UIImage imageNamed:@"Icon-32@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.iBooks"])
        {
            _icon = [UIImage imageNamed:@"Icon-36@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.MobileStore"])
        {
            _icon = [UIImage imageNamed:@"Icon-37@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.videos"])
        {
            _icon = [UIImage imageNamed:@"Icon-11@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.appleseed.FeedbackAssistant"])
        {
            _icon = [UIImage imageNamed:@"Icon-38@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.mobilephone"])
        {
            _icon = [UIImage imageNamed:@"Icon-22@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.mobiletimer"])
        {
            _icon = [UIImage imageNamed:@"Icon-2@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.MobileSMS"])
        {
            _icon = [UIImage imageNamed:@"Icon-19@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.AppStore"])
        {
            _icon = [UIImage imageNamed:@"Icon-37@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.camera"])
        {
            _icon = [UIImage imageNamed:@"Icon-40@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.Music"])
        {
            _icon = [UIImage imageNamed:@"Icon-41@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.Health"])
        {
            _icon = [UIImage imageNamed:@"Icon-42@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.tips"])
        {
            _icon = [UIImage imageNamed:@"Icon-16@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.mobilemail"])
        {
            _icon = [UIImage imageNamed:@"Icon-23@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.Bridge"])
        {
            _icon = [UIImage imageNamed:@"Icon-43@2x.png"];
        }
        else if([self.bundleIdentifier  isEqual: @"com.apple.Fitness"])
        {
            _icon = [UIImage imageNamed:@"Icon-44@2x.png"];
        }
	}
	
	return _icon;
}

- (BOOL)isHiddenApp
{
	return [[_applicationProxy appTags] indexOfObject:@"hidden"] != NSNotFound;
}

- (id)initWithPrivateProxy:(id)privateProxy
{
  self = [super init];
  if(self != nil)
  {
    _applicationProxy = (PrivateApi_LSApplicationProxy*)privateProxy;
  }
  
  return self;
}

- (instancetype)initWithBundleIdentifier:(NSString*)bundleIdentifier
{
  self = [super init];
  if(self != nil)
  {
    _applicationProxy = [NSClassFromString(@"LSApplicationProxy") applicationProxyForIdentifier:bundleIdentifier];
  }
  
  return self;
}

+ (instancetype)appWithPrivateProxy:(id)privateProxy
{
  return [[self alloc] initWithPrivateProxy:privateProxy];
}

+ (instancetype)appWithBundleIdentifier:(NSString*)bundleIdentifier
{
  return [[self alloc] initWithBundleIdentifier:bundleIdentifier];
}

@end
