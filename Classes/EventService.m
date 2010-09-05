//
//  EventService.m
//  JugEventsIPhone
//
//  Created by Balint Domokos on 31/08/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EventService.h"
#import "EventHelper.h"

@implementation EventService

@synthesize events;

- (id) init
{
	if( self = [super init])
	{
	}	
	return self;
}

- (NSString*)getTitleAtIndex: (NSUInteger)index
{
	if (self.events==nil) {
		return nil
		;
	}
	return [[self.events objectAtIndex: index ] objectForKey: @"title"];
}

- (NSString*)getEventLabelAtIndex: (NSUInteger)index {
	NSString *startTime = [[self.events objectAtIndex: index ] objectForKey: @"start"];
	NSRange r; 
	r.location = 0; 
	r.length = 10;
	NSString *datePart = [startTime substringWithRange: r];
	NSString *jugName = [[self.events objectAtIndex: index ] objectForKey: @"jugName"];
	NSString *eventLabel = [jugName stringByAppendingFormat:@" - %@", datePart];
	return eventLabel;
}

- (NSString*)getEventTimeAtIndex: (NSUInteger)index
{
	if (self.events==nil) {
		return nil;
	}
	NSString *startTime = [[self.events objectAtIndex: index ] objectForKey: @"start"];
	NSString *endTime = [[self.events objectAtIndex: index ] objectForKey: @"end"];
	return [EventHelper getEventTimeWithStart: startTime withEnd: endTime];
}

- (NSDictionary*)getDataAtIndex:(NSUInteger)index
{
	if (self.events==nil) {
		return nil;
	}
	return [self.events objectAtIndex: index ];
}

- (NSUInteger)count
{
	if (self.events==nil) {
		return 0;
	}
	return [self.events count];
}

@end
