//
//  CategoryListViewHandler.m
//  Mobx
//
//  Created by Weicheng Peng on 7/17/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "CategoryListViewHandler.h"

@implementation CategoryListViewHandler

@synthesize tableListData;

- (void) fillList {
    NSArray * tempArray = [[[NSArray alloc] initWithObjects:@"New messages", @"Friends' status update", @"Activities around you", nil] autorelease];
    
    self.tableListData = tempArray; 
}

#pragma mark table view delegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark table view data source
-(NSInteger) tableView : (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
    return [self.tableListData count]; 
}

-(UITableViewCell *) tableView : (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryListCell"]; 
    if(cell == nil) { 
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"categoryListCell"] autorelease]; 
    }
        
    NSUInteger index = [indexPath row];
    NSString *text = [self.tableListData objectAtIndex: index];
    cell.textLabel.text = text;
    
    return cell; 
}

#pragma mark -
- (void)dealloc { 
    [self.tableListData release]; 
    [super dealloc];
}

@end
