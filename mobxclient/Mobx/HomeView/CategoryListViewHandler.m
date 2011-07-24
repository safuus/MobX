//
//  CategoryListViewHandler.m
//  Mobx
//
//  Created by Weicheng Peng on 7/17/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "CategoryListViewHandler.h"
#import "CompositeSubviewBasedMobxCell.h"
#import "MobxUIConstants.h"

@implementation CategoryListViewHandler

@synthesize tableListData;


- (void) fillList {
    
    NSBundle* bundle = [NSBundle mainBundle];
    NSString *dataPath = [bundle pathForResource:@"CategoryList" ofType:@"plist"];
    self.tableListData = [[NSArray alloc] initWithContentsOfFile:dataPath]; 
}

#pragma mark table view delegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = ((MobxCell *)cell).useDarkBackground ? DARK_BACKGROUND : LIGHT_BACKGROUND;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSUInteger section = [indexPath section];
    //NSUInteger row = [indexPath row];
    
    // do something here
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark table view data source
-(NSInteger) tableView : (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
    return [self.tableListData count]; 
}

-(UITableViewCell *) tableView : (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {
    static NSString *CellIdentifier = @"categoryListCell";
    
    MobxCell *cell = (MobxCell *)[tableView dequeueReusableCellWithIdentifier: CellIdentifier];     
        
    if (cell == nil)
    {
        cell = [[[CompositeSubviewBasedMobxCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                            reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Display dark and light background in alternate rows -- see tableView:willDisplayCell:forRowAtIndexPath:.
    cell.useDarkBackground = (indexPath.row % 2 == 0);
    // Configure the data for the cell.
    NSDictionary *dataItem = [self.tableListData objectAtIndex:indexPath.row];
    cell.icon = [UIImage imageNamed:[dataItem objectForKey:@"Icon"]];
    cell.name = [dataItem objectForKey:@"Name"];
    
    return cell; 
}

#pragma mark -
- (void)dealloc { 
    [self.tableListData release]; 
    [super dealloc];
}

@end
