//
//  TimetableViewController.h
//  TestNative
//
//  Created by Craig Fortune on 18/01/2013.
//  Copyright (c) 2013 Craig Fortune. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimetableViewController : UIViewController
{
	
}
@property (strong, nonatomic) IBOutlet UIWebView *timetableView;


- (void) loadWebView:(NSString*)urlStr;

@end
