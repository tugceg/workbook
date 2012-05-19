//
//  OOOAppDelegate.m
//  NSIndexSet
//
//  Created by 大森 智史 on 12/05/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark indexSetWithIndexesInRange:
-(void)method001
{
    
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",[NSNumber numberWithFloat:2.0],@"bbb",@"ccc",@"ddd",@"eee",@"fff",@"ggg",@"hhh",nil];
    NSRange range = NSMakeRange(3,4);
    NSIndexSet *indexSet = [NSMutableIndexSet indexSetWithIndexesInRange:range];

    
    NSArray *retArray = [anArray objectsAtIndexes:indexSet];
    
    NSLog(@"001 = %s : %@", __FUNCTION__,[retArray description]);
    //=>001 = -[OOOAppDelegate method001] :  (ccc,ddd,eee,fff)

}

#pragma mark indexSet:
-(void)method002
{
    NSMutableArray *anArray = [NSMutableArray arrayWithObjects:@"111",[NSNumber numberWithFloat:2.0],@"333",@"444",@"555",@"666",@"777",@"888",@"999",nil];

    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    [indexSet addIndex:3];
    [indexSet addIndex:4];
    [indexSet addIndex:5];
    [indexSet addIndex:6];
    [indexSet addIndex:7];

    
    NSArray *retArray = [anArray objectsAtIndexes:indexSet];
    
    NSLog(@"002 = %s : %@", __FUNCTION__,[retArray description]);
    //=>001 = -[OOOAppDelegate method002] : (444,555,666,777,888)
}
#pragma mark indexGreaterThanOrEqualToIndex:
-(void)method003
{

    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    [indexSet addIndex:3];
    [indexSet addIndex:5];
    [indexSet addIndex:7];
    [indexSet addIndex:3];
    [indexSet addIndex:9];
    [indexSet addIndex:10];
    [indexSet addIndex:11];
    
    NSUInteger integer = [indexSet indexGreaterThanOrEqualToIndex:6];
    
    NSLog(@"003 = %s %@: %d", __FUNCTION__,[indexSet description],integer);
    //=>003 = -[OOOAppDelegate method003] : 7
    
}

#pragma mark containsIndexesInRange:
-(void)method004
{

    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];

    [indexSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,19)]];
    [indexSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,39)]];
    [indexSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,59)]];
    [indexSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,79)]];
    
    NSLog(@"%s ", __FUNCTION__);
    NSLog(@"10-15 %@",([indexSet containsIndexesInRange:NSMakeRange(10,15)]?@"YES":@"NO"));
    NSLog(@"20-25 %@",([indexSet containsIndexesInRange:NSMakeRange(20,25)]?@"YES":@"NO"));
    NSLog(@"10-25 %@",([indexSet containsIndexesInRange:NSMakeRange(10,25)]?@"YES":@"NO"));
    NSLog(@"10-35 %@",([indexSet containsIndexesInRange:NSMakeRange(10,35)]?@"YES":@"NO"));
    //=>-[OOOAppDelegate method004]
    //=>10-15 YES
    //=>20-25 NO
    //=>10-25 NO
    //=>10-35 NO
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [self method001];
    [self method002];
    [self method003];
    [self method004];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
