/**
 * ti.testfairy
 *
 * Copyright (c) 2020 TestFairy. All rights reserved.
 */

#import "ComTestfairyTitestfairyModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

#import "TestFairy.h"
#import <CoreLocation/CoreLocation.h>

@implementation ComTestfairyTitestfairyModule

#pragma mark Internal

// This is generated for your module, please do not change it
- (id)moduleGUID
{
  return @"66eab273-78f5-4634-95ac-6e7a189cc519";
}

// This is generated for your module, please do not change it
- (NSString *)moduleId
{
  return @"com.testfairy.titestfairy";
}

#pragma mark Lifecycle

- (void)startup
{
  // This method is called when the module is first loaded
  // You *must* call the superclass
  [super startup];
  DebugLog(@"[DEBUG] %@ loaded", self);
}

#pragma Public APIs

-(void)begin:(id)apitoken {
    
    ENSURE_SINGLE_ARG(apitoken, NSString);
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy begin:apitoken];
    });
}

-(id)version {
    return [TestFairy version];
}

// hideView() is not currently implemented

-(void)hideWebViewElements:(id)cssSelector {
    ENSURE_SINGLE_ARG(cssSelector, NSString);
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy hideWebViewElements:cssSelector];
    });
}

-(void)pushFeedbackController:(id)args {
    
    ENSURE_UI_THREAD_0_ARGS;
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy showFeedbackForm];
    });
}

-(void)sendUserFeedback:(id)note {
    
    ENSURE_SINGLE_ARG(note, NSString);
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy sendUserFeedback:note];
    });
}

-(void)updateLocation:(id)locations
{
//    expect an array of objects with longitude, latitude - allows flexibility for population from
//    actual Titanium LocationCoordinates in Titanium or from lat/long pairs sourced in other ways -
//    then create CLLocations using initWithLatitude:longitude: via custom private Class LocationCoordinates
    
    ENSURE_SINGLE_ARG(locations, NSArray);
    
    NSMutableArray *locs = [[NSMutableArray alloc] init];
    
    uint i;
    for (i = 0; i < [locations count]; i++) {
        
        double latitude = [[[locations objectAtIndex:i] valueForKey:@"latitude"] doubleValue];
        double longitude = [[[locations objectAtIndex:i] valueForKey:@"longitude"] doubleValue];
        
        CLLocation *loc = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
        
        [locs addObject:loc];
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy updateLocation:locs];
    });
}

-(void)checkpoint:(id)name {
    ENSURE_SINGLE_ARG(name, NSString);
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy addEvent:name];
    });
}

-(void)setCorrelationId:(id)correlationId {
    ENSURE_SINGLE_ARG(correlationId, NSString);
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy setUserId:correlationId];
    });
}

-(void)setUserId:(id)userId {
    ENSURE_SINGLE_ARG(userId, NSString);
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy setUserId:userId];
    });
}

-(void)setAttribute:(id)args {
    NSString *value = [((NSArray *)args) objectAtIndex:0];
    NSString *key = [((NSArray *)args) objectAtIndex:1];
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy setAttribute:key withValue:value];
    });
}

-(void)setScreenName:(id)name {
    ENSURE_SINGLE_ARG(name, NSString);
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy setScreenName:name];
    });
}

-(void)setServerEndpoint:(id)endpoint {
    ENSURE_SINGLE_ARG(endpoint, NSString);
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy setServerEndpoint:endpoint];
    });
}

-(void)log:(id)message {
    ENSURE_SINGLE_ARG(message, NSString);
    dispatch_async(dispatch_get_main_queue(), ^{
        TFLog(@"%@", message);
    });
}

-(void)pause:(id)args {
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy pause];
    });
}

-(void)resume:(id)args {
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy resume];
    });
}

-(void)stop:(id)args {
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy stop];
    });
}

-(id)sessionUrl:(id)args {
    return [TestFairy sessionUrl];
}

-(void)takeScreenshot:(id)args {
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy takeScreenshot];
    });
}

@end
