//
//  TimetableData.m
//  TestNative
//
//  Created by Craig Fortune on 18/01/2013.
//  Copyright (c) 2013 Craig Fortune. All rights reserved.
//

#import "TimetableData.h"

@implementation TimetableData

@end

@implementation TimeTableModel

- (id) init
{
	if((self = [super init]))
	{
		self.timeTableArr = [NSMutableArray arrayWithCapacity:5];
	}
	
	return self;
}

- (void) addNewTimeTable:(NSString*)idStr semester:(int)sem
{
	TimetableData* ttData = [[TimetableData alloc] init];
	ttData.idStr = idStr;
	ttData.sem = sem;
	
	[self.timeTableArr addObject:ttData];
}

- (void) removeTimeTable:(id)timeTable
{
}

@end