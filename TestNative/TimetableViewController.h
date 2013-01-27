//
//  TimetableViewController.h
//  TestNative
//
//  Created by Craig Fortune on 18/01/2013.
//  Copyright (c) 2013 Craig Fortune. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimetableData.h"

@class TimetableViewController;

@protocol TTRemovalProtocol <NSObject>

@required

//- (void) removeTT:(TimetableViewController*) ttViewCont;
- (void) removeTT:(TimetableViewController*)ttViewContr;

@end

@interface TimetableViewController : UIViewController
{
}

@property (strong, nonatomic) IBOutlet UIWebView *timetableView;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
@property (retain) id<TTRemovalProtocol> ttRemovalDelegate;
@property (retain) TimetableData* ttData;

- (void) loadWebView;
- (IBAction)removeTT:(id)sender;

@end
