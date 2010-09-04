//
//  RootViewController.m
//  JugEventsIPhone
//
//  Created by Balint Domokos on 23/08/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "RootViewController.h"
#import "EventDataSource.h"
#import "EventViewController.h"

@implementation RootViewController

@synthesize dataSource;
@synthesize service;

- (id)initWithDataSource:(id<UITableViewDataSource>)theDataSource withService:(EventService*)theService
{
	if ([self init]) {
		//theTableView = nil;
		self.service = theService;
		self.dataSource = theDataSource;
		self.view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"RootViewController" owner:self options:NULL] lastObject];

		self.title = @"Current Events";
		
		UITableView *tableView =  (UITableView*)[self.view viewWithTag:102];
		
		// set the autoresizing mask so that the table will always fill the view
		tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
		
		// set the cell separator to a single straight line.
		tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
		
		tableView.delegate = self;
		tableView.dataSource = self.dataSource;
		
		tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
		tableView.sectionIndexMinimumDisplayRowCount=10;
		
		//		self.title = [dataSource name];
		//		self.tabBarItem.image = [dataSource tabBarImage];
		
		// set the long name shown in the navigation bar
		//		self.navigationItem.title=[dataSource navigationBarName];
		
		// create a custom navigation bar button and set it to always say "back"
		//		UIBarButtonItem *temporaryBarButtonItem=[[UIBarButtonItem alloc] init];
		//		temporaryBarButtonItem.title=@"Back";
		//		self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
		//		[temporaryBarButtonItem release];
		
	}
	return self;
}

- (void) invalidateData {
	NSLog(@"reloading event list in root view...");
	[(UITableView*)[self.view viewWithTag:102] reloadData];
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	EventViewController *eventController = [[EventViewController alloc]
											initWithNibName:@"EventViewController" 
											bundle: [NSBundle bundleForClass:[self class]]
											withEventData: [service getDataAtIndex: [indexPath indexAtPosition:1]]];
	
	[eventController setTitle: [service getTitleAtIndex: [indexPath indexAtPosition:1]]];
	
	[[self navigationController] pushViewController:eventController animated:YES];
	[eventController release];
	
	[aTableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)dealloc {
    [super dealloc];
}

@end

