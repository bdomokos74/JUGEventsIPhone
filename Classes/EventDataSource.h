//
//  EventDataSource.h
//  JugEventsIPhone
//
//  Created by Balint Domokos on 24/08/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventService.h"

@interface EventDataSource : NSObject <UITableViewDataSource> {
}

@property (retain) EventService *service;;
-(id)initWithService:(EventService*)service;

@end
