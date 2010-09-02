//
//  EventService.h
//  JugEventsIPhone
//
//  Created by Balint Domokos on 31/08/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EventService : NSObject {
	NSArray *events;
}

-(id)initWithEvents: (NSArray*) theEvents;
-(NSString*)getTitleAtIndex:(NSUInteger)index;
-(NSString*)getEventTimeAtIndex:(NSUInteger)index;
-(NSDictionary*)getDataAtIndex:(NSUInteger)index;
-(NSUInteger)count;

@end
