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

@implementation JugEventsIPhoneAppDelegate

@synthesize window;
@synthesize navigationController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    UIWindow *localWindow;
	localWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// test with json from filesystem
	NSBundle * bundle = [NSBundle bundleForClass:[self class]];
	NSString *bundlePath = [bundle bundlePath];
	NSLog(@"bundlePath=%@", bundlePath);
	NSString *jsonPath = [bundle pathForResource:@"example" ofType: @"json"];
	NSLog(@"jsonPath=%@", jsonPath);
	NSString *json = [NSString stringWithContentsOfFile: jsonPath encoding: NSUTF8StringEncoding error: NULL];

	EventService *service = [[EventService alloc] init];
	service.events = [json JSONValue];
	
	id<UITableViewDataSource> dataSource = [[EventDataSource alloc ] initWithService: service];

	RootViewController *rootViewController = [[RootViewController alloc] 
											  initWithDataSource: dataSource 
											  withService: service];
	
	EventDownloader *downloader = [[EventDownloader alloc] initWithUrl: @"http://www.jugevents.org/jugevents/event/json.html?continent=&country=&jugName=&pastEvents=false&order=asc" withService: service];
	downloader.observer = rootViewController;

	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: rootViewController];
	
	[service release];
	[dataSource release];
	
	[localWindow addSubview:nav.view];
    [localWindow makeKeyAndVisible];

	[downloader startDowload];
	
    return YES;
}

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end

