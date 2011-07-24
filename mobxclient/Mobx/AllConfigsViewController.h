//
//  AllConfigsViewController.h
//  Mobx
//
//  Created by Weicheng Peng on 7/22/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IASKAppSettingsViewController.h"

@interface AllConfigsViewController : UIViewController<IASKSettingsDelegate> {

}

-(IBAction) doneEditing:(id) sender;

@end
