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

@implementation JugEventsIPhoneAppDelegate

@synthesize window;
@synthesize navigationController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    UIWindow *localWindow;
	localWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	EventService *service = [[EventService alloc] initWithData];
	id<UITableViewDataSource> dataSource = [[EventDataSource alloc ]initWithService: service];
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:
								   [[RootViewController alloc] initWithDataSource: dataSource withService: service]];
	
	[service release];
	[dataSource release];
	
	[localWindow addSubview:nav.view];
    [localWindow makeKeyAndVisible];

    return YES;
}

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
