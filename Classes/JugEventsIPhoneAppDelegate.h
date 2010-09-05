//
//  JugEventsIPhoneAppDelegate.h
//  JugEventsIPhone
//
//  Created by Balint Domokos on 23/08/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventDownloader.h"

@interface JugEventsIPhoneAppDelegate : NSObject <UIApplicationDelegate> {    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) EventDownloader *downloader;

@end

