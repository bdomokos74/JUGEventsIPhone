//
//  EventDataSource.m
//  JugEventsIPhone
//
//  Created by Balint Domokos on 24/08/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EventDataSource.h"

@implementation EventDataSource

-(id) initWithService:(EventService*)myService
{
	if( self = [super init])
	{
		service = [myService retain];
	}
	return self;
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSLog(@"numrowsinsection: sec=%d", section);
	if (section==0) {
		return [service count];
	}
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [[[UITableViewCell alloc]  
							  initWithStyle: UITableViewCellStyleSubtitle 
							  reuseIdentifier: @"noreuse" ] autorelease];
	
	cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
	
	cell.textLabel.text =  [service getTitleAtIndex: [indexPath indexAtPosition:1]];

    cell.detailTextLabel.text = [service getEventLabelAtIndex: [indexPath indexAtPosition:1]];
	
	return cell;
}

@end
