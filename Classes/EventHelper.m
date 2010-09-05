//
//  EventHelper.m
//  JugEventsIPhone
//
//  Created by Balint Domokos on 06/09/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EventHelper.h"


@implementation EventHelper

+ (NSString*) getEventTimeWithStart: (NSString*)startTime withEnd: (NSString*) endTime {
	NSRange r; 
	r.location = 0; 
	r.length = 10;
	NSString *datePart = [startTime substringWithRange: r];
	NSString *secondPart = endTime;
	if ([endTime hasPrefix:datePart]) {
		NSRange timeRange;
		timeRange.location = 11;
		timeRange.length = 8;
		secondPart = [endTime substringWithRange:timeRange];
	}
	NSString *eventTime = [startTime stringByAppendingFormat:@" - %@", secondPart];
	return eventTime;
}

@end
