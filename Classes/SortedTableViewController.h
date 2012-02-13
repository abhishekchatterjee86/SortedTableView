//
//  SortedTableViewController.h
//  SortedTableView
//
//  Created by abhishek chatterjee on 13/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SortedTableViewController : UITableViewController {

	NSMutableArray *mDataSourceArray;
	NSMutableArray *mAlphabetArray;
}

@property (nonatomic, retain) NSMutableArray *dataSourceArray;
@property (nonatomic, retain) NSMutableArray *alphabetArray;

@end
