//
//  ChatsTableViewController.m
//  Mobx
//
//  Created by Weicheng Peng on 7/21/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "ChatsTableViewController.h"
#import "MobxUIConstants.h"

@implementation ChatsTableViewController

@synthesize navController;
@synthesize tmpCell, data, cellNib;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark -
#pragma mark View controller methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set up the edit and add buttons.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
	self.navController.navigationBar.tintColor = [UIColor darkGrayColor];
	
	// Configure the table view.
    self.tableView.rowHeight = 73.0;
    self.tableView.backgroundColor = DARK_BACKGROUND;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
	// Load the data.
    NSBundle* bundle = [NSBundle mainBundle];
    NSString *dataPath = [bundle pathForResource:@"ChatsViewTableData" ofType:@"plist"];
    self.data = [[NSArray alloc] initWithContentsOfFile:dataPath]; //[NSArray arrayWithContentsOfFile:dataPath];
    
    // create our UINib instance which will later help us load and instanciate the
	// UITableViewCells's UI via a xib file.
	//
	// Note:
	// The UINib classe provides better performance in situations where you want to create multiple
	// copies of a nib file’s contents. The normal nib-loading process involves reading the nib file
	// from disk and then instantiating the objects it contains. However, with the UINib class, the
	// nib file is read from disk once and the contents are stored in memory.
	// Because they are in memory, creating successive sets of objects takes less time because it
	// does not require accessing the disk.
	//
	self.cellNib = [UINib nibWithNibName:@"ChatsTableViewCell" bundle:nil];
	
}

- (void)viewDidUnload
{
	[super viewDidLoad];
	
	self.data = nil;
	self.tmpCell = nil;
    self.cellNib = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}


#pragma mark -
#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [self.data count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MobxCell";
    
    IndividualSubViewBasedMobxCell *cell = (IndividualSubViewBasedMobxCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil)
    {
        [self.cellNib instantiateWithOwner:self options:nil];
		cell = tmpCell;
		self.tmpCell = nil;		
    }
    
	// Display dark and light background in alternate rows -- see tableView:willDisplayCell:forRowAtIndexPath:.
    cell.useDarkBackground = (indexPath.row % 2 == 0);
	
	// Configure the data for the cell.
    NSDictionary *dataItem = [data objectAtIndex:indexPath.row];
    cell.icon = [UIImage imageNamed:[dataItem objectForKey:@"Icon"]];
    cell.name = [dataItem objectForKey:@"Name"];
	
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = ((IndividualSubViewBasedMobxCell *)cell).useDarkBackground ? DARK_BACKGROUND : LIGHT_BACKGROUND;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
    [self.data release];
	[self.tmpCell release];
    [self.cellNib release];
    [self.navController release];
	
    [super dealloc];
}

@end
