//
//  CreateUserViewController.h
//  Mobx
//
//  Created by Weicheng Peng on 8/4/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobxLocationController.h"

@interface CreateUserViewController : UIViewController {
    IBOutlet UITextField *userName;
    IBOutlet UILabel     *location;
    MobxLocationController *locationController;
}

@property (nonatomic, retain) UITextField *userName;
@property (nonatomic, retain) UILabel *location;

-(IBAction) onSubmitClick: (id) sender;
-(IBAction) onUserNameDone: (id) sender;

@end
