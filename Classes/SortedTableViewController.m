//
//  SortedTableViewController.m
//  SortedTableView
//
//  Created by abhishek chatterjee on 13/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SortedTableViewController.h"
#import "SampleModel.h"

#define ALPHA @"ABCDEFGHIJKLMNOPQRSTUVWXYZ#"
#define ALPHA_ARRAY [NSArray arrayWithObjects: @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z",@"#", nil]


@interface SortedTableViewController (Private)

- (void) createSectionList: (NSMutableArray*) wordArray;
- (void) populateDummyDataSource;

@end

@implementation SortedTableViewController

@synthesize dataSourceArray = mDataSourceArray;
@synthesize alphabetArray   = mAlphabetArray;


#pragma mark -
#pragma mark View lifecycle

-(id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) 
	{
		NSMutableArray *the_array = [[NSMutableArray alloc] init];
		self.dataSourceArray = the_array;
		[the_array release];
		
		NSMutableArray *the_alphabetArr = [[NSMutableArray alloc]init];
		self.alphabetArray	= the_alphabetArr;
		[the_alphabetArr release];
	}
	return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self populateDummyDataSource];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [self.dataSourceArray count];;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self.dataSourceArray objectAtIndex:section] count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	
	for(int i=0;i<[self.alphabetArray count];i++) {
		
		if([[ALPHA_ARRAY objectAtIndex:section] isEqualToString:[[self.alphabetArray objectAtIndex:i] objectAtIndex:0]]){
			
			
			for (SampleModel *word1 in [self.dataSourceArray objectAtIndex:section])
				
			{
				if(word1==nil)
					return @"";
				
				return [NSString stringWithFormat:@"%@", [ALPHA_ARRAY objectAtIndex:section]];
			}
		}
		
	}
	return @"";
	
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    SampleModel *model = [[self.dataSourceArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	
	cell.textLabel.text = model.title;
	
    return cell;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	self.dataSourceArray = nil;
	self.alphabetArray	 = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark Private methods

- (void) populateDummyDataSource
{
	NSMutableArray *the_array = [[NSMutableArray alloc] init];
	
	for (NSInteger cnt = 0; cnt < 10; cnt ++) 
	{
		SampleModel *model = [[SampleModel alloc]init];
		
		switch (cnt) 
		{
			case 0:
				model.title = @"asdsd";
				break;
			case 1:
				model.title = @"fdd";
				break;
			case 2:
				model.title = @"www";
				break;
			case 3:
				model.title = @"ikh";
				break;
			case 4:
				model.title = @"gfgr";
				break;
			case 5:
				model.title = @"eres";
				break;
			case 6:
				model.title = @"sweer";
				break;
			case 7:
				model.title = @"llhggf";
				break;
			case 8:
				model.title = @"qwes";
				break;
			case 9:
				model.title = @"vfgdd";
				break;
			default:
				break;
		}
		[the_array addObject:model];
	}
	
	[self.dataSourceArray addObjectsFromArray:the_array];
	
	[self createSectionList:self.dataSourceArray];
	
	[the_array release];
}

// Build a section/row list from the alphabetically ordered word list
- (void) createSectionList: (NSMutableArray*) wordArray
{
	
	// Build an array with 26 sub-array sections
	NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
	
	NSMutableArray *tempalphabetArray = [[NSMutableArray alloc] init];
	
	for (int i = 0; i < 27; i++) 
	{ 
		NSMutableArray *the_array = [[NSMutableArray alloc] init];
		[sectionArray addObject:the_array];
		[the_array release];
		the_array = nil;
		the_array = [[NSMutableArray alloc] init];
		[tempalphabetArray addObject:the_array];
		[the_array release];
		the_array = nil;
		
	}
	
	// Add each word to its alphabetical section
	for (SampleModel *word1 in wordArray)
	{
		
		NSString *word=word1.title;
		
		if ([word length] == 0) {
			
			[[sectionArray objectAtIndex:26] addObject:word1];
			[[tempalphabetArray objectAtIndex:26]addObject:@"#"];
		}
		
		else {
			// determine which letter starts the name
			NSRange range = [ALPHA rangeOfString:[[word substringToIndex:1] uppercaseString]];
			
			if(range.location>30)
			{
				
				[[sectionArray objectAtIndex:26] addObject:word1];
				[[tempalphabetArray objectAtIndex:26]addObject:@"#"];			}
			
			else {
				
				
				[[sectionArray objectAtIndex:range.location] addObject:word1];
				
				[[tempalphabetArray objectAtIndex:range.location]addObject:[[word substringToIndex:1] uppercaseString]];
			}
			
		}
	}
	[self.dataSourceArray removeAllObjects];
	[self.dataSourceArray addObjectsFromArray:sectionArray];
	
	for (int i = 0; i < 27; i++) {
		
		if([tempalphabetArray objectAtIndex:i]) {
			
			NSArray *dict=[tempalphabetArray objectAtIndex:i];
			
			
			if([dict count]!=0) {
				[self.alphabetArray addObject:dict];
			}
			else {
			}
		}
		
		
	}
	
	[tempalphabetArray release],tempalphabetArray=nil;
	
	[sectionArray release],sectionArray=nil;
	
}

@end

