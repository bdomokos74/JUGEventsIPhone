//
//  EventService.m
//  JugEventsIPhone
//
//  Created by Balint Domokos on 31/08/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EventService.h"

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
	return [[self.events objectAtIndex: index ] objectForKey: @"title"];
}

- (NSString*)getEventTimeAtIndex: (NSUInteger)index
{
	NSString *startTime = [[self.events objectAtIndex: index ] objectForKey: @"start"];
	NSString *endTime = [[self.events objectAtIndex: index ] objectForKey: @"end"];
	NSRange r; 
	r.location = 0; 
	r.length = 10;
	NSString *datePart = [startTime substringWithRange: r];
	NSLog(@"datePart=%@", datePart);
	NSString *secondPart = endTime;
	if ([endTime hasPrefix:datePart]) {
		NSRange timeRange;
		timeRange.location = 11;
		timeRange.length = 8;
		secondPart = [endTime substringWithRange:timeRange];
	}
	NSLog(@"secondPart=%@", secondPart);
	NSString *eventTime = [startTime stringByAppendingFormat:@" - %@", secondPart];
	return eventTime;
}

- (NSDictionary*)getDataAtIndex:(NSUInteger)index
{
	return [self.events objectAtIndex: index ];
}

- (NSUInteger)count
{
	NSLog(@"self.events count=%d", [self.events count]);
	return [self.events count];
}

@end
