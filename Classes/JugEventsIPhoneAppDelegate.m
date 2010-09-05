//
//  JugEventsIPhoneAppDelegate.m
//  JugEventsIPhone
//
//  Created by Balint Domokos on 23/08/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "JugEventsIPhoneAppDelegate.h"
#import "RootViewController.h"
#import "EventDataSource.h"
#import "EventDownloader.h"
#import "JSON.h"
#import "JugEvents.h"

@implementation JugEventsIPhoneAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize downloader;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    UIWindow *localWindow;
	localWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// test with json from filesystem
	/*
	NSBundle * bundle = [NSBundle bundleForClass:[self class]];
	NSString *bundlePath = [bundle bundlePath];
	NSLog(@"bundlePath=%@", bundlePath);
	NSString *jsonPath = [bundle pathForResource:@"example" ofType: @"json"];
	NSLog(@"jsonPath=%@", jsonPath);
	NSString *json = [NSString stringWithContentsOfFile: jsonPath encoding: NSUTF8StringEncoding error: NULL];
	 
	service.events = [json JSONValue];
     */
	
	EventService *service = [[EventService alloc] init];
	NSString *path = [NSHomeDirectory() stringByAppendingPathComponent: JUGEVENTS_FILE_PATH];
	service.events = [NSArray arrayWithContentsOfFile:path];
	
	id<UITableViewDataSource> dataSource = [[EventDataSource alloc ] initWithService: service];

	RootViewController *rootViewController = [[RootViewController alloc] 
											  initWithDataSource: dataSource 
											  withService: service];

	self.downloader = [[EventDownloader alloc] initWithUrl: JUGEVENTS_JSON_URL withService: service];
	self.downloader.observer = rootViewController;

	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: rootViewController];
	
	[service release];
	[dataSource release];
	[self.downloader release];
	[rootViewController release];
	
	[localWindow addSubview:nav.view];
    [localWindow makeKeyAndVisible];

	NSString *lastUpdatedPath = [NSHomeDirectory() stringByAppendingPathComponent: JUGEVENTS_UPDATED_FILE_PATH];
	NSString *lastUpdated = [NSString stringWithContentsOfFile:lastUpdatedPath encoding: NSUTF8StringEncoding error:nil];
	NSLog(@"loaded prev timestamp: %@", lastUpdated);
	rootViewController.lastUpdated = lastUpdated;
	
	[downloader startDowload];
	
    return YES;
}

- (void)dealloc {
	self.downloader = nil;
	[navigationController release];
	[window release];
	[super dealloc];
}

@end

