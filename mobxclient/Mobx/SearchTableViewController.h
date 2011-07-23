//
//  SearchTableViewController.h
//  Mobx
//
//  Created by Weicheng Peng on 7/19/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobxRecord.h"

@interface SearchTableViewController : UITableViewController<UISearchDisplayDelegate, UISearchBarDelegate> {
    NSArray			*listContent;			// The master content.
	NSMutableArray	*filteredListContent;	// The content filtered as a result of a search.
	
	// The saved state of the search UI if a memory warning removed the view.
    NSString		*savedSearchTerm;
    NSInteger		savedScopeButtonIndex;
    BOOL			searchWasActive;    
    
    IBOutlet UINavigationController *navController;
}


@property (nonatomic, retain) NSArray *listContent;
@property (nonatomic, retain) NSMutableArray *filteredListContent;

@property (nonatomic, copy) NSString *savedSearchTerm;
@property (nonatomic) NSInteger savedScopeButtonIndex;
@property (nonatomic) BOOL searchWasActive;

@property (nonatomic, retain) IBOutlet UINavigationController *navController;

- (void) initializeSearchTableView;
@end
