//
//  EventService.m
//  JugEventsIPhone
//
//  Created by Balint Domokos on 31/08/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EventService.h"
#import "JSON.h"

@implementation EventService

-(id) initWithData
{
	if( self = [super init])
	{
		//		NSFileManager *fm = [NSFileManager defaultManager];
		NSBundle * bundle = [NSBundle bundleForClass:[self class]];
		NSString *bundlePath = [bundle bundlePath];
		NSLog(@"bundlePath=%@", bundlePath);
		NSString *jsonPath = [bundle pathForResource:@"example" ofType: @"json"];
		NSLog(@"jsonPath=%@", jsonPath);
		NSString *json = [NSString stringWithContentsOfFile: jsonPath encoding: NSUTF8StringEncoding error: NULL];
		//NSLog(@"%@", json);
		
		//id response = [self objectWithJsonString: json];
		events = [[json JSONValue] retain];
		
		//NSLog(@"arr1=%@", [dict objectForKey: @"title"]);
	}
	return self;
}

-(NSString*)getTitleAtIndex: (NSUInteger)index
{
	return [[events objectAtIndex: index ] objectForKey: @"title"];
}

-(NSDictionary*)getDataAtIndex:(NSUInteger)index
{
	return [events objectAtIndex: index ];
}

-(NSUInteger)count
{
	return [events count];
}

@end
