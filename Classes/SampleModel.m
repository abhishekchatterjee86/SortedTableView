//
//  SampleModel.m
//  SortedTableView
//
//  Created by abhishek chatterjee on 13/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleModel.h"


@implementation SampleModel

@synthesize title = mTitle;

-(id)init
{
	self = [super init];
	if (self) 
	{
		self.title = nil;
	}
	return self;
}

-(void)dealloc
{
	self.title = nil;
	[super dealloc];
}

@end
