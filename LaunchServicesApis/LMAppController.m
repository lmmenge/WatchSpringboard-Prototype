//
//  LMAppController.m
//  WatchSpringboard
//
//  Created by Andreas Verhoeven on 28-10-14.
//  Copyright (c) 2014 Lucas Menge. All rights reserved.
//

#import "LMAppController.h"

@interface PrivateApi_LSApplicationWorkspace
-(NSArray*)allInstalledApplications;
- (bool)openApplicationWithBundleID:(id)arg1;
@end

@implementation LMAppController
{
	PrivateApi_LSApplicationWorkspace* _workspace;
	NSArray* _installedApplications;
}

+(instancetype)sharedInstance
{
	static dispatch_once_t once;
	static id sharedInstance;
	dispatch_once(&once, ^{
		sharedInstance = [[self alloc] init];
	});
	return sharedInstance;
}

-(id)init
{
	self = [super init];
	if(self != nil)
	{
		_workspace = [NSClassFromString(@"LSApplicationWorkspace") new];
	}
	
	return self;
}

-(NSArray*)readApplications
{
	NSArray* allInstalledApplications = [_workspace allInstalledApplications];
	NSMutableArray* applications = [NSMutableArray arrayWithCapacity:allInstalledApplications.count];
	for(id proxy in allInstalledApplications)
	{
		LMApp* app = [LMApp appWithPrivateProxy:proxy];
		if(!app.isHiddenApp)
		{
			[applications addObject:app];
		}
	}
	
	return applications;
}

-(NSArray*)installedApplications
{
	if(nil == _installedApplications)
	{
		_installedApplications = [self readApplications];
	}
	
	return _installedApplications;
}

-(BOOL)openAppWithBundleIdentifier:(NSString *)bundleIdentifier
{
	return (BOOL)[_workspace openApplicationWithBundleID:bundleIdentifier];
}

@end
