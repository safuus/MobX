//
//  MobxRootNavController.h
//  Mobx
//
//  Created by Weicheng Peng on 7/24/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobxAppDelegate.h"

@interface MobxRootTabBarController : UITabBarController {
    IBOutlet MobxAppDelegate *appDelegate;
}

// not necessary to retain as app will exit at the end.
@property (nonatomic) IBOutlet MobxAppDelegate *appDelegate;

@end
