//
//  FGAppReader.m
//  WatchSpringboard
//
//  Created by Finn Gaida on 27.10.14.
//  Copyright (c) 2014 Lucas Menge. All rights reserved.
//
// All links from http://stackoverflow.com/questions/5667920/iphone-apps-that-supports-url-schema

#import "FGAppReader.h"

@implementation FGAppReader

+ (void)openApp:(NSString *)app {
    
    NSDictionary *appKeys = @{@"Safari" : @"http://",
                              @"Mail" : @"mailto://",
                              @"Phone" : @"tel:1",
                              @"FaceTime" : @"facetime:1",
                              @"Messages" : @"sms://",
                              @"Maps" : @"http://maps.apple.com/",
                              @"iTunes" : @"http://phobos.apple.com/WebObjects/MZStore.woa/wa/",
                              @"Music" : @"music://",
                              @"Videos" : @"videos://",
                              @"AppStore" : @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/",
                              @"iBooks" : @"ibooks://",
                              @"Tweetbot" : @"tweetbot://",
                              @"Settings" : @"prefs:root=General",
                              @"Facebook" : @"fb://"};
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appKeys[app]]];
    
}

#pragma mark all testing area here, nothing works yet...
/*
 + (BOOL)appInstalled:(NSString *)app {
 
 NSDictionary *appKeys = @{@"Safari" : @"http://",
 @"Mail" : @"mailto:",
 @"Phone" : @"tel:",
 @"FaceTime" : @"facetime:",
 @"Messages" : @"sms:",
 @"Maps" : @"http://maps.apple.com/",
 @"iTunes" : @"http://phobos.apple.com/WebObjects/MZStore.woa/wa/",
 @"Facebook" : @"fb://"};
 
 BOOL available = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appKeys[app]]];
 
 return available;
 }
 
- (NSMutableArray *)desktopAppsFromDictionary:(NSDictionary *)dictionary {
    NSMutableArray *desktopApps = [NSMutableArray array];
 
    for (NSString *appKey in dictionary)
    {
        [desktopApps addObject:appKey];
    }
    return desktopApps;
}

- (NSArray *)installedApps {
    
    NSLog(@"Installed: %@", (APCheckIfAppInstalled(@"de.finngaida.sunup")) ? @"YES" : @"NO");
    
    BOOL isDir = NO;
    if([[NSFileManager defaultManager] fileExistsAtPath:installedAppListPath isDirectory: &isDir] && !isDir) {
        
        NSMutableDictionary *cacheDict = [NSMutableDictionary dictionaryWithContentsOfFile: installedAppListPath];
        NSDictionary *system = [cacheDict objectForKey: @"System"];
        NSMutableArray *installedApp = [NSMutableArray arrayWithArray:[self desktopAppsFromDictionary:system]];
        
        NSDictionary *user = [cacheDict objectForKey: @"User"];
        [installedApp addObjectsFromArray:[self desktopAppsFromDictionary:user]];
        
        return installedApp;
        
    } else {
    
        NSLog(@"can not find installed app plist");
        return nil;
        
    }
}

BOOL APCheckIfAppInstalled(NSString *bundleIdentifier) {
    
    static NSString *const cacheFileName = @"com.apple.mobile.installation.plist";
    NSString *relativeCachePath = [[@"Library" stringByAppendingPathComponent: @"Caches"] stringByAppendingPathComponent: cacheFileName];
    NSDictionary *cacheDict = nil;
    NSString *path = nil;
    // Loop through all possible paths the cache could be in
    for (short i = 0; 1; i++)
    {
        
        switch (i) {
            case 0: // Jailbroken apps will find the cache here; their home directory is /var/mobile
                path = [NSHomeDirectory() stringByAppendingPathComponent: relativeCachePath];
                break;
            case 1: // App Store apps and Simulator will find the cache here; home (/var/mobile/) is 2 directories above sandbox folder
                path = [[NSHomeDirectory() stringByAppendingPathComponent: @"../.."] stringByAppendingPathComponent: relativeCachePath];
                break;
            case 2: // If the app is anywhere else, default to hardcoded /var/mobile/
                path = [@"/var/mobile" stringByAppendingPathComponent: relativeCachePath];
                break;
            default: // Cache not found (loop not broken)
                return NO;
            break; }
        
        BOOL isDir = NO;
        if ([[NSFileManager defaultManager] fileExistsAtPath: path isDirectory: &isDir] && !isDir) // Ensure that file exists
            cacheDict = [NSDictionary dictionaryWithContentsOfFile: path];
        
        if (cacheDict) // If cache is loaded, then break the loop. If the loop is not "broken," it will return NO later (default: case)
            break;
    }
    
    NSDictionary *system = [cacheDict objectForKey: @"System"]; // First check all system (jailbroken) apps
    if ([system objectForKey: bundleIdentifier]) return YES;
    NSDictionary *user = [cacheDict objectForKey: @"User"]; // Then all the user (App Store /var/mobile/Applications) apps
    if ([user objectForKey: bundleIdentifier]) return YES;
    
    // If nothing returned YES already, we'll return NO now
    return NO;
}*/

@end
