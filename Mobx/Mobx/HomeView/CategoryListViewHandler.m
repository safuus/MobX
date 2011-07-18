//
//  CategoryListViewHandler.m
//  Mobx
//
//  Created by Weicheng Peng on 7/17/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "CategoryListViewHandler.h"

@implementation CategoryListViewHandler

@synthesize tableListData = _listData;

- (void) fillList {
    NSArray * tempArray = [[[NSArray alloc] initWithObjects:@"New messages", @"Friends' status update", @"Activities around you", nil] autorelease];
    
    _listData = tempArray; 
}

-(NSInteger) tableView : (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
    return [_listData count]; 
}

-(UITableViewCell *) tableView : (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"acell"]; 
    if(cell == nil) { 
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"acell"] autorelease]; 
    }
    cell.textLabel.text = [_listData objectAtIndex:[indexPath row]];
    return cell; 
}

- (void)dealloc { 
    [_listData release]; 
    [super dealloc];
}

@end
