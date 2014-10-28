//
//  LMAppController.h
//  WatchSpringboard
//
//  Created by Andreas Verhoeven on 28-10-14.
//  Copyright (c) 2014 Lucas Menge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LMApp.h"

@interface LMAppController : NSObject

@property (nonatomic, readonly) NSArray* installedApplications;

- (BOOL)openAppWithBundleIdentifier:(NSString*)bundleIdentifier;

+ (instancetype)sharedInstance;

@end
