//
//  EventViewController.h
//  JugEventsIPhone
//
//  Created by Balint Domokos on 01/09/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EventViewController : UIViewController {
}

@property (nonatomic,retain) NSDictionary *eventData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withEventData:(NSDictionary*)theData;

@end
