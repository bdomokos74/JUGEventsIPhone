//
//  EventDownloader.m
//  JugEventsIPhone
//
//  Created by Balint Domokos on 04/09/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EventDownloader.h"
#import "JSON.h"
#import "JugEvents.h"

@implementation EventDownloader

@synthesize service;
@synthesize urlString;
@synthesize response;
@synthesize data;
@synthesize urlConnection;
@synthesize observer;

- (id) initWithUrl: (NSString*)theUrl withService: (EventService *)theService {
	if (self = [super init]) {
		self.service = theService;
		self.urlString = theUrl;
	}
	return self;
}

- (void) handleFailure: (NSString*) errorMessage {
	NSLog(@"%@", errorMessage);
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:FALSE];
}

- (void) startDowload {
	NSLog(@"starting downloader !!!!!!!!!!!!!!!!!!");
	NSURL *url = [NSURL URLWithString: self.urlString];
	if (!url)
	{
		[self handleFailure: [NSString stringWithFormat: @"Could not create URL from string %@", self.urlString]];
		return;
	}
	
	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
	if (!theRequest)
	{
		[self handleFailure: [NSString stringWithFormat: @"Could not create URL request from string %@", self.urlString]];
		return;
	}
	
	self.urlConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	if (!self.urlConnection)
	{
		[self handleFailure: [NSString stringWithFormat: @"URL connection failed for string %@", self.urlString]];
		return;
	}
	
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	
//	self.isDownloading = YES;
	
	// Create the new data object
	self.data = [NSMutableData data];
	self.response = nil;
	NSLog(@"scheduling downloader !!!!!!!!!!!!!!!!!!");
	[self.urlConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)cleanup {
	service = nil;
	response = nil;
	urlConnection = nil;
	data = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)aResponse {
	NSLog(@"didReceiveResponse , explength=%d", [aResponse expectedContentLength]);	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData {
	NSLog(@"didReceiveData ");
	[self.data appendData:theData];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	NSLog(@"didFailWithError ");
	[self handleFailure: [NSString stringWithFormat: @"Error: Failed connection, %@", [error localizedDescription]]];
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	[self cleanup];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSLog(@"didFinishLoading, notifying observer: %@, respondsto: %d", self.observer, [self.observer respondsToSelector: @selector(invalidateData:)]);
	NSString *jsonString = [[NSString alloc] initWithData: self.data encoding: NSUTF8StringEncoding];
	service.events = [jsonString JSONValue];
	
	NSString *path = [NSHomeDirectory() stringByAppendingPathComponent: JUGEVENTS_FILE_PATH];
	if ([service.events writeToFile:path atomically:YES]) {
		NSLog(@"File was written successfully");
	} else {
		NSLog(@"Failed to write file");
	}
	
	if (self.observer && [self.observer respondsToSelector: @selector(invalidateData)]) {
		[self.observer performSelector:@selector(invalidateData)];
	} else {
		NSLog(@"observer can't be notified");
	}

	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	[self.urlConnection unscheduleFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
	[self cleanup];
}

@end
