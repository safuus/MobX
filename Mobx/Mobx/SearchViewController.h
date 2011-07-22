//
//  SearchViewController.h
//  Mobx
//
//  Created by Weicheng Peng on 7/17/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchTableViewController.h"

@interface SearchViewController : UINavigationController
{
    IBOutlet SearchTableViewController *searchTableViewCont;
}

@property (nonatomic, retain) IBOutlet SearchTableViewController *searchTableViewCont;

@end
