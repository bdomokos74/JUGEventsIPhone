//
//  EventServiceTest.m
//  JugEventsIPhone
//
//  Created by Balint Domokos on 03/09/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "EventHelperTest.h"
#import "EventHelper.h"

@implementation EventHelperTest

- (void) testGetEventTimeAtIndex_sameday {
	NSString *actual = [EventHelper getEventTimeWithStart: @"2010-08-30 18:30:00" withEnd: @"2010-08-30 20:30:00"];
	NSString *expected = @"2010-08-30 18:30:00 - 20:30:00";
	
	STAssertTrue([expected isEqualToString: actual], @"Expected: <%@> but was <%@>.", expected, actual );
}

- (void) testGetEventTimeAtIndex_differentday {
	NSString *actual = [EventHelper getEventTimeWithStart:@"2010-08-30 18:30:00" withEnd:@"2010-08-31 20:30:00"];
	NSString *expected = @"2010-08-30 18:30:00 - 2010-08-31 20:30:00";
	
	STAssertTrue([expected isEqualToString: actual], @"Expected: <%@> but was <%@>.", expected, actual );
}

@end