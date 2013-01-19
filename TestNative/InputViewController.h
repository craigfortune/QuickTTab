//
//  BfGViewController.h
//  TestNative
//
//  Created by Craig Fortune on 12/01/2013.
//  Copyright (c) 2013 Craig Fortune. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BfGViewController.h"

@interface InputViewController : UIViewController <UITextFieldDelegate>
{
	BfGViewController* _bfgViewController;
}

@property BfGViewController* bfgViewController;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *semesterSegment;

- (IBAction)loadTT:(id)sender;


@end
