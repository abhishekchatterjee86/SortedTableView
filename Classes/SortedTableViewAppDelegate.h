//
//  SortedTableViewAppDelegate.h
//  SortedTableView
//
//  Created by abhishek chatterjee on 13/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SortedTableViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *mNavcontroller;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navcontroller;

@end

