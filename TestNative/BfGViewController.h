//
//  BfGViewController.h
//  TestNative
//
//  Created by Craig Fortune on 16/01/2013.
//  Copyright (c) 2013 Craig Fortune. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimetableData.h"

@interface BfGViewController : UIViewController  <UITextFieldDelegate, UIScrollViewDelegate>
{
	TimeTableModel* _timeTableModel;
	NSMutableArray* viewControllerArr;
	UIView* inputView;
}

@property (retain) TimeTableModel* timeTableModel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)valChanged:(id)sender;

- (void) setupInputScene;
- (void) refreshFromModel;
- (void) showFirstPage;
- (void) showPage:(int)page;
- (void) resizeScrollView:(int)width height:(int) height;

@end
