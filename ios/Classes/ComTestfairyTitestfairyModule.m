/**
 * Copyright 21015 TestFairy
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComTestfairyTitestfairyModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

#import "TestFairy.h"

#import <CoreLocation/CoreLocation.h>


@implementation ComTestfairyTitestfairyModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"80945dee-668b-4252-9f92-7cfa7861ffaf";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.testfairy.titestfairy";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
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

-(void)hideWebViewElements:(NSString *)cssSelector {
    ENSURE_SINGLE_ARG(cssSelector, NSString);
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy hideWebViewElements:cssSelector];
    });
}

-(void)pushFeedbackController:(id)args {
    
    ENSURE_UI_THREAD_0_ARGS;
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy pushFeedbackController];
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
        [TestFairy checkpoint:name];
    });
}

-(void)setCorrelationId:(id)correlationId {   
    ENSURE_SINGLE_ARG(correlationId, NSString);
    dispatch_async(dispatch_get_main_queue(), ^{
        [TestFairy setCorrelationId:correlationId];
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
