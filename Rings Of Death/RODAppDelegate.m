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
    outerRing.bodyColor = [UIColor colorWithRed:0.9 green:0.0 blue:0.0 alpha:1];
    outerRing.headColor = [UIColor colorWithRed:1.0 green:0.2 blue:0.5 alpha:1];
    
    RODRing *middleRing = [[RODCircleRing alloc] initWithRadius:5.0/16 lineWidth:1.9/16];
    middleRing.bodyColor = [UIColor colorWithRed:0.5 green:0.9 blue:0.0 alpha:1];
    middleRing.headColor = [UIColor colorWithRed:0.7 green:1.0 blue:0.0 alpha:1];
    
    RODRing *innerRing = [[RODCircleRing alloc] initWithRadius:3.0/16 lineWidth:1.9/16];
    innerRing.bodyColor = [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1];
    innerRing.headColor = [UIColor colorWithRed:0 green:0.9 blue:1.0 alpha:1];
    
    RODRingsController *circlesController = [[RODRingsController alloc] initWithRings:@[ outerRing, middleRing, innerRing ]];
    circlesController.title = @"Circles";
    
    UINavigationController *circlesNavigationController = [[UINavigationController alloc] initWithRootViewController:circlesController];
    [viewControllers addObject:circlesNavigationController];
    
    // Three concentric stars
    
    RODRing *outerStarRing = [[RODStarRing alloc] initWithOuterRadius:14.0/30 innerRadius:7.0/30 lineWidth:1.5/30];
    outerStarRing.bodyColor = [UIColor colorWithRed:0.9 green:0.0 blue:0.0 alpha:1];
    outerStarRing.headColor = [UIColor colorWithRed:1.0 green:0.2 blue:0.0 alpha:1];
    
    RODRing *middleStarRing = [[RODStarRing alloc] initWithOuterRadius:10.0/30 innerRadius:5.0/30 lineWidth:1.5/30];
    middleStarRing.bodyColor = [UIColor colorWithRed:0.9 green:0.4 blue:0.0 alpha:1];
    middleStarRing.headColor = [UIColor colorWithRed:1.0 green:0.6 blue:0.0 alpha:1];
    
    RODRing *innerStarRing = [[RODStarRing alloc] initWithOuterRadius:6.0/30 innerRadius:3.0/30 lineWidth:1.5/30];
    innerStarRing.bodyColor = [UIColor colorWithRed:0.9 green:0.8 blue:0.0 alpha:1];
    innerStarRing.headColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1];
    
    RODRingsController *starsController = [[RODRingsController alloc] initWithRings:@[ outerStarRing, middleStarRing, innerStarRing ]];
    starsController.title = @"Stars";
    
    UINavigationController *starsNavigationController = [[UINavigationController alloc] initWithRootViewController:starsController];
    [viewControllers addObject:starsNavigationController];
    
    // Three concentric hearts
    
    RODRing *outerHeartRing = [[RODHeartRing alloc] initWithInset:0 lineWidth:0.09];
    outerHeartRing.bodyColor = [UIColor colorWithRed:0.9 green:0.0 blue:0.0 alpha:1];
    outerHeartRing.headColor = [UIColor colorWithRed:1.0 green:0.2 blue:0.2 alpha:1];
    
    RODRing *middleHeartRing = [[RODHeartRing alloc] initWithInset:0.1 lineWidth:0.09];
    middleHeartRing.bodyColor = [UIColor colorWithRed:0.9 green:0.3 blue:0.3 alpha:1];
    middleHeartRing.headColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:1];
    
    RODRing *innerHeartRing = [[RODHeartRing alloc] initWithInset:0.2 lineWidth:0.09];
    innerHeartRing.bodyColor = [UIColor colorWithRed:0.9 green:0.6 blue:0.6 alpha:1];
    innerHeartRing.headColor = [UIColor colorWithRed:1.0 green:0.8 blue:0.8 alpha:1];
    
    RODRingsController *heartsController = [[RODRingsController alloc] initWithRings:@[ outerHeartRing, middleHeartRing, innerHeartRing ]];
    heartsController.title = @"Hearts";
    
    UINavigationController *heartsNavigationController = [[UINavigationController alloc] initWithRootViewController:heartsController];
    [viewControllers addObject:heartsNavigationController];
    
    // a skull and two rings for the eyes
    
    RODRing *skullRing = [[RODSkullRing alloc] init];
    skullRing.relativeFrame = CGRectMake(0, 0, 1, 1);
    skullRing.bodyColor = [UIColor colorWithWhite:0.8 alpha:1];
    skullRing.headColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    RODRing *leftEyeRing = [[RODCircleRing alloc] initWithRadius:0.5 lineWidth:0.5];
    leftEyeRing.relativeFrame = CGRectMake(0.2, 0.35, 0.2, 0.2);
    leftEyeRing.bodyColor = [UIColor colorWithRed:0.8 green:1 blue:0.8 alpha:1];
    leftEyeRing.headColor = [UIColor colorWithRed:0.9 green:1 blue:0.9 alpha:1];
    
    RODRing *rightEyeRing = [[RODCircleRing alloc] initWithRadius:0.5 lineWidth:0.5];
    rightEyeRing.relativeFrame = CGRectMake(0.6, 0.35, 0.2, 0.2);
    rightEyeRing.bodyColor = [UIColor colorWithRed:1 green:0.8 blue:1 alpha:1];
    rightEyeRing.headColor = [UIColor colorWithRed:1 green:0.9 blue:1 alpha:1];
    
    RODRingsController *skullController = [[RODRingsController alloc] initWithRings:@[ skullRing, leftEyeRing, rightEyeRing ]];
    skullController.title = @"Skull";
    
    UINavigationController *skullNavigationController = [[UINavigationController alloc] initWithRootViewController:skullController];
    [viewControllers addObject:skullNavigationController];
    
    // rock & roll!
    
    RODRing *leftHornsRing = [[RODHornsRing alloc] initWithFlip:NO];
    leftHornsRing.relativeFrame = CGRectMake(0.0, 0.35, 0.3, 0.3);
    leftHornsRing.bodyColor = [UIColor colorWithRed:0.8 green:0.8 blue:0 alpha:1];
    leftHornsRing.headColor = [UIColor colorWithRed:1.0 green:1.0 blue:0 alpha:1];
    
    RODRing *starRing = [[RODPentagramRing alloc] init];
    starRing.relativeFrame = CGRectMake(0.35, 0.35, 0.3, 0.3);
    starRing.bodyColor = [UIColor colorWithRed:0.6 green:0 blue:0 alpha:1];
    starRing.headColor = [UIColor colorWithRed:0.9 green:0 blue:0 alpha:1];
    
    RODRing *rightHornsRing = [[RODHornsRing alloc] initWithFlip:YES];
    rightHornsRing.relativeFrame = CGRectMake(0.7, 0.35, 0.3, 0.3);
    rightHornsRing.bodyColor = [UIColor colorWithRed:0.8 green:0.8 blue:0 alpha:1];
    rightHornsRing.headColor = [UIColor colorWithRed:1.0 green:1.0 blue:0 alpha:1];
    
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
