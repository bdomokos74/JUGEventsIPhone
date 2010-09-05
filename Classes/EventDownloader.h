//
//  EventDownloader.h
//  JugEventsIPhone
//
//  Created by Balint Domokos on 04/09/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventService.h"

@protocol DownloaderDelegate <NSObject>
- (void) invalidateData: (NSString*) lastUpdated;
@end

@interface EventDownloader : NSObject {
}

@property (nonatomic,retain) EventService* service;
@property (nonatomic,retain) NSString *urlString;
@property (nonatomic,retain) NSURLConnection *urlConnection;
@property (nonatomic,retain) NSMutableData *data;
@property (nonatomic,retain) NSURLResponse *response;
@property (nonatomic,retain) id<DownloaderDelegate> observer;

- (id) initWithUrl: (NSString*)theUrl withService: (EventService *)theService;
- (void) startDowload;

@end