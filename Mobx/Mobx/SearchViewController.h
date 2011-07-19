//
//  SearchViewController.h
//  Mobx
//
//  Created by Weicheng Peng on 7/17/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate>
{
	NSArray			*listContent;			// The master content.
	NSMutableArray	*filteredListContent;	// The content filtered as a result of a search.
	
	// The saved state of the search UI if a memory warning removed the view.
    NSString		*savedSearchTerm;
    NSInteger		savedScopeButtonIndex;
    BOOL			searchWasActive;
}

@property (nonatomic, retain) NSArray *listContent;
@property (nonatomic, retain) NSMutableArray *filteredListContent;

@property (nonatomic, copy) NSString *savedSearchTerm;
@property (nonatomic) NSInteger savedScopeButtonIndex;
@property (nonatomic) BOOL searchWasActive;

@end
