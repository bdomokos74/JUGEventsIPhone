//
//  EventServiceTest.m
//  JugEventsIPhone
//
//  Created by Balint Domokos on 03/09/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "EventServiceTest.h"
#import "EventService.h"

@implementation EventServiceTest
- (void) testGetEventTimeAtIndex_sameday {
	NSArray *keys = [NSArray arrayWithObjects: @"start", @"end", nil];
	NSArray *values = [NSArray arrayWithObjects: @"2010-08-30 18:30:00", @"2010-08-30 20:30:00", nil];
	NSDictionary *dict = [NSDictionary dictionaryWithObjects: values forKeys: keys];
	NSArray *events = [NSArray arrayWithObjects: dict, nil];
	EventService *service = [[EventService alloc] initWithEvents: events];
	
	NSString *actual = [service getEventTimeAtIndex:0];
	NSString *expected = @"2010-08-30 18:30:00 - 20:30:00";
	
	STAssertTrue([expected isEqualToString: actual], @"Expected: <%@> but was <%@>.", expected, actual );
	[service release];
}

- (void) testGetEventTimeAtIndex_differentday {
	NSArray *keys = [NSArray arrayWithObjects: @"start", @"end", nil];
	NSArray *values = [NSArray arrayWithObjects: @"2010-08-30 18:30:00", @"2010-08-31 20:30:00", nil];
	NSDictionary *dict = [NSDictionary dictionaryWithObjects: values forKeys: keys];
	NSArray *events = [NSArray arrayWithObjects: dict, nil];
	EventService *service = [[EventService alloc] initWithEvents: events];
	
	NSString *actual = [service getEventTimeAtIndex:0];
	NSString *expected = @"2010-08-30 18:30:00 - 2010-08-31 20:30:00";
	
	STAssertTrue([expected isEqualToString: actual], @"Expected: <%@> but was <%@>.", expected, actual );
	[service release];
}

@end