//
//  TimetableViewController.m
//  TestNative
//
//  Created by Craig Fortune on 18/01/2013.
//  Copyright (c) 2013 Craig Fortune. All rights reserved.
//

#import "TimetableViewController.h"

@interface TimetableViewController ()

@end

@implementation TimetableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	self.timetableView.hidden = NO;
	
	int sem = 2;
	NSString* idNum = @"7040253";
	NSString* urlStr = [NSString stringWithFormat:@"http://www.bolton.ac.uk/Timetables/MyTimetable/S%iTimetable.asp?Boltonid=%@", sem, idNum];
	[self loadWebView:urlStr];
}

- (void) loadWebView:(NSString*)urlStr
{
	NSURL *url = [NSURL URLWithString:urlStr];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	[self.timetableView loadRequest:requestObj];
	
	[self.timetableView setScalesPageToFit:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
	[self setTimetableView:nil];
	[super viewDidUnload];
}
@end
