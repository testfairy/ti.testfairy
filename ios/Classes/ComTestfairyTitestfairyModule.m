/**
 * ti.testfairy
 *
 * Copyright (c) 2020 TestFairy. All rights reserved.
 */

#import "ComTestfairyTitestfairyModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

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

- (NSString *)example:(id)args
{
  // Example method.
  // Call with "MyModule.example(args)"
  return @"hello world";
}

- (NSString *)exampleProp
{
  // Example property getter.
  // Call with "MyModule.exampleProp" or "MyModule.getExampleProp()"
  return @"Titanium rocks!";
}

- (void)setExampleProp:(id)value
{
  // Example property setter.
  // Call with "MyModule.exampleProp = 'newValue'" or "MyModule.setExampleProp('newValue')"
}

@end
