//
//  RootViewController.h
//  JugEventsIPhone
//
//  Created by Balint Domokos on 23/08/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventService.h"
#import "EventDownloader.h"

@interface RootViewController : UITableViewController  <UITableViewDelegate, DownloaderDelegate> {
	id<UITableViewDataSource> dataSource;
}

@property (nonatomic,retain) id<UITableViewDataSource> dataSource;
@property (nonatomic,retain) EventService *service;

- (id)initWithDataSource:(id<UITableViewDataSource>)theDataSource withService: (EventService*)theService;
- (void)invalidateData ;
@end
