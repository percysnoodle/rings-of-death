//
//  AppDelegate.m
//  Rings Of Death
//
//  Created by Simon Booth on 11/09/2016.
//  Copyright © 2016 percysnoodle.com. All rights reserved.
//

#import "RODAppDelegate.h"
#import "RODRingsController.h"

@interface RODAppDelegate ()

@end

@implementation RODAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    // Three concentric rings - like the activity view
    
    RODRing *outerRing = [[RODCircleRing alloc] initWithRadius:7.0/16 lineWidth:1.9/16];
    outerRing.relativeFrame = CGRectMake(0, 0, 1, 1);
    outerRing.tintColor = [UIColor redColor];
    
    RODRing *middleRing = [[RODCircleRing alloc] initWithRadius:5.0/12 lineWidth:1.9/12];
    middleRing.relativeFrame = CGRectMake(0.125, 0.125, 0.75, 0.75);
    middleRing.tintColor = [UIColor greenColor];
    
    RODRing *innerRing = [[RODCircleRing alloc] initWithRadius:3.0/8 lineWidth:1.95/8];
    innerRing.relativeFrame = CGRectMake(0.25, 0.25, 0.5, 0.5);
    innerRing.tintColor = [UIColor cyanColor];
    
    RODRingsController *circlesController = [[RODRingsController alloc] initWithRings:@[ outerRing, middleRing, innerRing ]];
    circlesController.title = @"Circles";
    
    UINavigationController *circlesNavigationController = [[UINavigationController alloc] initWithRootViewController:circlesController];
    [viewControllers addObject:circlesNavigationController];
    
    // a skull and two rings for the eyes
    
    RODRing *skullRing = [[RODSkullRing alloc] init];
    skullRing.relativeFrame = CGRectMake(0, 0, 1, 1);
    skullRing.tintColor = [UIColor colorWithWhite:0.8 alpha:1];
    
    RODRing *leftEyeRing = [[RODCircleRing alloc] initWithRadius:0.5 lineWidth:0.5];
    leftEyeRing.relativeFrame = CGRectMake(0.2, 0.35, 0.2, 0.2);
    leftEyeRing.tintColor = [UIColor colorWithRed:0.8 green:1 blue:0.8 alpha:1];
    
    RODRing *rightEyeRing = [[RODCircleRing alloc] initWithRadius:0.5 lineWidth:0.5];
    rightEyeRing.relativeFrame = CGRectMake(0.6, 0.35, 0.2, 0.2);
    rightEyeRing.tintColor = [UIColor colorWithRed:1 green:0.8 blue:1 alpha:1];
    
    RODRingsController *skullController = [[RODRingsController alloc] initWithRings:@[ skullRing, leftEyeRing, rightEyeRing ]];
    skullController.title = @"Skull";
    
    UINavigationController *skullNavigationController = [[UINavigationController alloc] initWithRootViewController:skullController];
    [viewControllers addObject:skullNavigationController];
    
    // rock & roll!
    
    RODRing *leftHornsRing = [[RODHornsRing alloc] initWithFlip:NO];
    leftHornsRing.relativeFrame = CGRectMake(0.0, 0.35, 0.3, 0.3);
    leftHornsRing.tintColor = [UIColor yellowColor];
    
    RODRing *starRing = [[RODStarRing alloc] init];
    starRing.relativeFrame = CGRectMake(0.35, 0.35, 0.3, 0.3);
    starRing.tintColor = [UIColor redColor];
    
    RODRing *rightHornsRing = [[RODHornsRing alloc] initWithFlip:YES];
    rightHornsRing.relativeFrame = CGRectMake(0.7, 0.35, 0.3, 0.3);
    rightHornsRing.tintColor = [UIColor yellowColor];
    
    RODRingsController *rockAndRollController = [[RODRingsController alloc] initWithRings:@[ leftHornsRing, starRing, rightHornsRing ]];
    rockAndRollController.title = @"Rock & Roll";
    
    UINavigationController *rockAndRollNavigationController = [[UINavigationController alloc] initWithRootViewController:rockAndRollController];
    [viewControllers addObject:rockAndRollNavigationController];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = viewControllers;
    
    self.window = [[UIWindow alloc] init];
    self.window.backgroundColor = [UIColor blackColor];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
