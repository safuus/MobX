//
//  HomeViewController.h
//  Mobx
//
//  Created by Weicheng Peng on 7/17/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryListViewHandler.h"
#import "MobxLocationController.h"

@interface HomeViewController : UIViewController {

    IBOutlet UILabel *userInfo;
    IBOutlet UILabel *location;
    IBOutlet UIImageView *imageView;
    
    IBOutlet UINavigationItem *navItem;
    
    // New messages etc table list data view handler
    IBOutlet CategoryListViewHandler *categoryListHandler;
    IBOutlet UITableView *categoryListView;
    
    MobxLocationController *locationController;
}

@property(retain) IBOutlet UILabel *userInfo;
@property(retain) IBOutlet UILabel *location;
@property(retain) IBOutlet UIImageView *imageView;
@property(retain) IBOutlet UINavigationItem *navItem;
@property(retain) IBOutlet UINavigationItem *destroyButton;

@property (nonatomic, retain) IBOutlet CategoryListViewHandler *categoryListHandler;
@property (nonatomic, retain) IBOutlet UITableView *categoryListView;

- (void) startUpdatingLocation;

- (IBAction)destroyApplication:(id)sender;

@end
