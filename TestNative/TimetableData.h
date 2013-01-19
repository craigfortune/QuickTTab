//
//  TimetableData.h
//  TestNative
//
//  Created by Craig Fortune on 18/01/2013.
//  Copyright (c) 2013 Craig Fortune. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimetableData : NSObject
{
	NSString* _idStr;
	int _sem;
}

@property (retain) NSString* idStr;
@property (assign) int sem;

@end

//

@interface TimeTableModel : NSObject
{
	NSMutableArray* _timeTableArr;
}

@property (retain) NSMutableArray* timeTableArr;

- (void) addNewTimeTable:(NSString*)idStr semester:(int)sem;
- (void) removeTimeTable:(id)timeTable;

@end
