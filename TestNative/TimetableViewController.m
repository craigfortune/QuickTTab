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
}

- (void) loadWebView
{
	NSURL* url = [NSURL URLWithString:self.ttData.completeURLString];
	
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	[self.timetableView loadRequest:requestObj];
	
	[self.timetableView setScalesPageToFit:YES];
}

- (IBAction)removeTT:(id)sender
{	
	CGRect frame = self.view.frame;
	frame.origin.x = frame.origin.x + 1024;
	frame.origin.y = frame.origin.y - 1024;
	[UIView animateWithDuration:0.5f
					 animations:^{self.view.frame = frame;}
					 completion:^(BOOL finished){[self.ttRemovalDelegate removeTT:self];}
	 ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
	[self setTimetableView:nil];
	[self setRemoveButton:nil];
	[super viewDidUnload];
}
@end
