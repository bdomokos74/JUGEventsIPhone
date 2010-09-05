//
//  EventServiceTest
//  JugEventsIPhone
//
//  Created by Balint Domokos on 06/09/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EventServiceTest.h"
#import "EventService.h"

@implementation EventServiceTest

- (void) testGetEventLabel {
	NSArray *keys = [NSArray arrayWithObjects: @"start", @"end", @"jugName", nil];
	NSArray *values = [NSArray arrayWithObjects: @"2010-08-30 18:30:00", @"2010-08-30 20:30:00", @"testjug", nil];
	NSDictionary *dict = [NSDictionary dictionaryWithObjects: values forKeys: keys];
	NSArray *events = [NSArray arrayWithObjects: dict, nil];
	EventService *service = [[EventService alloc] init];
	service.events = events;
	
	NSString *actual = [service getEventLabelAtIndex:0];
	NSString *expected = @"testjug - 2010-08-30";
	
	STAssertTrue([expected isEqualToString: actual], @"Expected: <%@> but was <%@>.", expected, actual );
	[service release];
}

@end
