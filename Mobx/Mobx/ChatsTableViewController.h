//
//  ChatsTableViewController.h
//  Mobx
//
//  Created by Weicheng Peng on 7/21/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndividualSubViewBasedMobxCell.h"

@interface ChatsTableViewController : UITableViewController {
    
    IBOutlet UINavigationController *navController;
    
    IBOutlet IndividualSubViewBasedMobxCell *tmpCell;
    
    NSArray *data;	
    // referring to our xib-based UITableViewCell ('IndividualSubViewBasedMobxCell')
	UINib *cellNib;
}

@property (nonatomic, retain)  UINavigationController *navController;

@property (nonatomic, retain) IBOutlet IndividualSubViewBasedMobxCell *tmpCell;
@property (nonatomic, retain) NSArray *data;
@property (nonatomic, retain) UINib *cellNib;

@end
