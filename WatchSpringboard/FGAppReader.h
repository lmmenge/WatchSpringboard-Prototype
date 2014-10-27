//
//  FGAppReader.h
//  WatchSpringboard
//
//  Created by Finn Gaida on 27.10.14.
//  Copyright (c) 2014 Lucas Menge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FGAppReader : NSObject

// - (NSArray *)installedApps;
// + (BOOL)appInstalled:(NSString *)app;
+ (void)openApp:(NSString *)app;

@end
