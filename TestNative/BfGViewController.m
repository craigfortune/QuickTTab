//
//  BfGViewController.m
//  TestNative
//
//  Created by Craig Fortune on 16/01/2013.
//  Copyright (c) 2013 Craig Fortune. All rights reserved.
//

#import "BfGViewController.h"
#import "TimeTableViewController.h"
#import "InputViewController.h"

@interface BfGViewController ()

@end

@implementation BfGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	// TimeTable model with some testing data
	self.timeTableModel = [[TimeTableModel alloc] init];
	
	/*
	[self.timeTableModel addNewTimeTable:@"7040253" semester:1];
	[self.timeTableModel addNewTimeTable:@"7040253" semester:2];
	[self.timeTableModel addNewTimeTable:@"7080628" semester:1];
	[self.timeTableModel addNewTimeTable:@"7080628" semester:2];
	*/
	
	viewControllerArr = [NSMutableArray arrayWithCapacity:5];
	
	// Setup input screen and then all the timetable screens
	[self setupInputScene];
	[self refreshFromModel];
	
	// Neatly at the start
	[self showFirstPage];
	
	// Don't know why, but there is an extra view here, hence the -1
	int numSubViews = self.scrollView.subviews.count;
	[self.pageControl setNumberOfPages:numSubViews];
	[self resizeScrollView:(1024 * numSubViews) height:699];
}

- (void) setupInputScene
{
	InputViewController* tmp = [self.storyboard instantiateViewControllerWithIdentifier:@"inputScene"];
	[self.scrollView addSubview:tmp.view];
	
	inputView = tmp.view;
	
	int height = 699;
	
	CGRect frame = tmp.view.frame;
	frame.origin.x = 0;
	frame.origin.y = 0;
	frame.size.width = 1024;
	frame.size.height = height;
	
	tmp.view.frame = frame;
	
	[tmp setBfgViewController:self];
	[viewControllerArr addObject:tmp];
}

- (void) refreshFromModel
{
	// Not actually removing views at the moment, just spazzing them in from a standing start

	
	for(UIView* subView in [self.scrollView subviews])
	{
		if(subView != inputView)
			[subView removeFromSuperview];
	}
	
	//
	
	TimetableViewController* tmp;
	CGRect frame;
	
	int i = 0;
	int height = 699;
	
	// Iterate through the data in the model and instantiate ViewControllers for each data entry
	for (TimetableData* ttData in self.timeTableModel.timeTableArr)
	{
		tmp = (TimetableViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"timeTableScene"];
		[self.scrollView addSubview:tmp.view];
		
		frame = tmp.view.frame;
		frame.origin.x = 1024 + (1024 * i);
		frame.origin.y = 0;
		frame.size.width = 1024;
		frame.size.height = height;
		
		tmp.view.frame = frame;
		
		[tmp setTtData:ttData];
		[tmp loadWebView];
	
		[viewControllerArr addObject:tmp];
		
		i++;
		
		tmp.ttRemovalDelegate = self;
	}
	
	int numSubViews = self.scrollView.subviews.count;
	[self.pageControl setNumberOfPages:numSubViews];
	[self resizeScrollView:(1024 * numSubViews) height:699];
}

- (void) showFirstPage
{
	[self.scrollView scrollRectToVisible:CGRectMake(0, 0, 1024, 699) animated:YES];
	[self.pageControl setCurrentPage:0];
}

- (void) showPage:(int)page
{
	CGRect frameRect = self.scrollView.frame;
	
	[self.scrollView scrollRectToVisible:CGRectMake(frameRect.size.width * page, 0, 1024, 699) animated:YES];
	[self.pageControl setCurrentPage:page];
}

- (void) resizeScrollView:(int)width height:(int) height
{
	[self.scrollView setContentSize:CGSizeMake(width, height)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
	[self setPageControl:nil];
	[self setScrollView:nil];

	[super viewDidUnload];
}

//

- (IBAction)valChanged:(id)sender
{
	NSLog(@"PageControlValChanged");
	UIPageControl* pageControl = (UIPageControl*)sender;
	int currPage = pageControl.currentPage;	
	//

	[self showPage:currPage];
}

//

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
	CGRect frameRect = self.scrollView.frame;
	
	int remainder = (int)self.scrollView.contentOffset.x % (int)frameRect.size.width;
	int page = (int)(self.scrollView.contentOffset.x - remainder) / frameRect.size.width;
	
	if(remainder > frameRect.size.width /2)
		page++;
	
	[self showPage:page];
}

//

- (void) removeTT:(TimetableViewController*)ttViewContr
{
	[ttViewContr removeFromParentViewController];
	[ttViewContr.view removeFromSuperview];
	[self.timeTableModel removeTimeTable:ttViewContr.ttData];
	[self refreshFromModel];
}

@end
