//
//  EventService.h
//  JugEventsIPhone
//
//  Created by Balint Domokos on 31/08/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventService : NSObject {

}

@property (retain) NSArray *events;

- (void)setEvents: (NSArray*) theEvents;
- (NSString*)getTitleAtIndex:(NSUInteger)index;
- (NSString*)getEventTimeAtIndex:(NSUInteger)index;
- (NSString*)getEventLabelAtIndex:(NSUInteger)index;
- (NSDictionary*)getDataAtIndex:(NSUInteger)index;
- (NSUInteger)count;

@end
