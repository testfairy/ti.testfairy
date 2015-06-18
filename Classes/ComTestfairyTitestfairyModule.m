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
    [TestFairy begin:apitoken];
    return;
}

-(id)version {
    
    return [TestFairy version];
}

// hideView() is not currently implemented

-(void)pushFeedbackController:(id)args {
    
    ENSURE_UI_THREAD_0_ARGS;
    [TestFairy pushFeedbackController];
    return;
}

-(void)sendUserFeedback:(id)note {
    
    ENSURE_SINGLE_ARG(note, NSString);
    [TestFairy sendUserFeedback:note];
    return;
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
    
    [TestFairy updateLocation:locs];
    return;
}

-(void)checkpoint:(id)name {
    
    ENSURE_SINGLE_ARG(name, NSString);
    [TestFairy checkpoint:name];
    return;
}

-(void)setCorrelationId:(id)correlationId {
    
    ENSURE_SINGLE_ARG(correlationId, NSString);
    [TestFairy setCorrelationId:correlationId];
    return;
}

-(void)pause:(id)args {
    
    [TestFairy pause];
    return;
}

-(void)resume:(id)args {
    
    [TestFairy resume];
    return;
}

-(id)sessionUrl:(id)args {
    
    return [TestFairy sessionUrl];
}

-(void)takeScreenshot:(id)args {
    
    [TestFairy takeScreenshot];
    return;
}

@end
