//
//  TimetableData.m
//  TestNative
//
//  Created by Craig Fortune on 18/01/2013.
//  Copyright (c) 2013 Craig Fortune. All rights reserved.
//

#import "TimetableData.h"

@implementation TimetableData

- (NSString*) completeURLString
{
	return [NSString stringWithFormat:@"http://www.bolton.ac.uk/Timetables/MyTimetable/S%iTimetable.asp?Boltonid=%@", self.sem, self.idStr];
}

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

- (void) removeTimeTable:(TimetableData*)ttData
{
	[self.timeTableArr removeObject:ttData];
}

@end