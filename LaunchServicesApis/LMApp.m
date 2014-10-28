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

@interface PrivateApi_LSApplicationProxy
+(instancetype)applicationProxyForIdentifier:(NSString*)identifier;
@property (nonatomic, readonly) NSString* localizedShortName;
@property (nonatomic, readonly) NSString* localizedName;
@property (nonatomic, readonly) NSString* bundleIdentifier;
@property (nonatomic, readonly) NSArray* appTags;
@end

@implementation LMApp
{
	PrivateApi_LSApplicationProxy* _applicationProxy;
	UIImage* _icon;
}

+(instancetype)appWithPrivateProxy:(id)privateProxy
{
	return [[self alloc] initWithPrivateProxy:privateProxy];
}

-(id)initWithPrivateProxy:(id)privateProxy
{
	self = [super init];
	if(self != nil)
	{
		_applicationProxy = (PrivateApi_LSApplicationProxy*)privateProxy;
	}
	
	return self;
}

+(instancetype)appWithBundleIdentifier:(NSString*)bundleIdentifier
{
	return [[self alloc] initWithBundleIdentifier:bundleIdentifier];
}

-(id)initWithBundleIdentifier:(NSString*)bundleIdentifier
{
	self = [super init];
	if(self != nil)
	{
		_applicationProxy = [NSClassFromString(@"LSApplicationProxy") applicationProxyForIdentifier:bundleIdentifier];
	}
	
	return self;
}

-(NSString*)name
{
	return _applicationProxy.localizedName ?: _applicationProxy.localizedShortName;
}

-(NSString*)bundleIdentifier
{
	return [_applicationProxy bundleIdentifier];
}

-(UIImage*)icon
{
	if(nil == _icon)
	{
		_icon = [UIImage _applicationIconImageForBundleIdentifier:self.bundleIdentifier format:10 scale:2.0];
	}
	
	return _icon;
}

-(BOOL)isHiddenApp
{
	return [[_applicationProxy appTags] indexOfObject:@"hidden"] != NSNotFound;
}

@end
