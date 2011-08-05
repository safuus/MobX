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
    
    // New messages etc table list data view handler
    IBOutlet CategoryListViewHandler *categoryListHandler;
    IBOutlet UITableView *categoryListView;
    
    MobxLocationController *locationController;
}

@property(retain) IBOutlet UILabel *userInfo;
@property(retain) IBOutlet UILabel *location;

@property (nonatomic, retain) IBOutlet CategoryListViewHandler *categoryListHandler;
@property (nonatomic, retain) IBOutlet UITableView *categoryListView;

@end
