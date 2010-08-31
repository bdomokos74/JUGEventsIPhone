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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero ] autorelease];
	NSLog(@"indexPath: len=%d, [0]=%d, [1]=%d", [indexPath length], [indexPath indexAtPosition:0], [indexPath indexAtPosition:1]);
	cell.textLabel.text =  [service getTitleAtIndex: [indexPath indexAtPosition:1]];

	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView  numberOfRowsInSection:(NSInteger)section 
{
	return [service count];
}

@end
