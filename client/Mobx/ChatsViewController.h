//
//  ChatsViewController.h
//  Mobx
//
//  Created by Weicheng Peng on 7/17/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatsTableViewController.h"

@interface ChatsViewController : UINavigationController
{
    IBOutlet ChatsTableViewController *chatsTableViewCont;
}

@property (nonatomic, retain) IBOutlet ChatsTableViewController *chatsTableViewCont;

@end
