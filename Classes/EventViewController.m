//
//  EventViewController.m
//  JugEventsIPhone
//
//  Created by Balint Domokos on 01/09/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EventViewController.h"
#import "EventHelper.h"

@implementation EventViewController
@synthesize eventData;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withEventData:(NSDictionary*)theData {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.eventData = theData;
		
		UIWebView *webView = (UIWebView*)[self.view viewWithTag:101];
		[webView loadHTMLString: [self.eventData objectForKey: @"description"] baseURL: [NSURL URLWithString:@"http://www.jugevents.org"]];
		
		UILabel *label = (UILabel*)[self.view viewWithTag:102];
		
		label.text =  [[self.eventData objectForKey: @"jugName"]
					   stringByAppendingFormat:@"\n%@",
					   [EventHelper getEventTimeWithStart:[self.eventData objectForKey:@"start"]
												  withEnd: [self.eventData objectForKey:@"end"]]];
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
/*
- (void)viewDidLoad {
	self.view = [[[NSBundle mainBundle] loadNibNamed:@"EventViewController" owner:self options:NULL] lastObject];
	textView = (UITextView*)[self.view viewWithTag:101];
}*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	self.eventData = nil;
    [super dealloc];
}


@end
