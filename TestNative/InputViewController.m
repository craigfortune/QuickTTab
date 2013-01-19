//
//  BfGViewController.m
//  TestNative
//
//  Created by Craig Fortune on 12/01/2013.
//  Copyright (c) 2013 Craig Fortune. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()

@end

@implementation InputViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
	[self setTextField:nil];
	[self setSemesterSegment:nil];
	
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    if (theTextField == self.textField)
	{
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (IBAction)loadTT:(id)sender
{
	NSString* idNum = self.textField.text;
	if([idNum length] == 0)
	{
		idNum = @"7040253";
	}
	
	int sem = self.semesterSegment.selectedSegmentIndex + 1;
	
	[self.bfgViewController.timeTableModel addNewTimeTable:idNum semester:sem];
	[self.bfgViewController refreshFromModel];
	
	[self.bfgViewController showPage:self.bfgViewController.pageControl.numberOfPages -1];
}
@end
