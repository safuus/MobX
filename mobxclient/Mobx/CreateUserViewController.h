//
//  CreateUserViewController.h
//  Mobx
//
//  Created by Weicheng Peng on 8/4/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobxLocationController.h"
#import <AudioToolbox/AudioServices.h>
#import "OverlayViewController.h"

@interface CreateUserViewController : UIViewController<UIImagePickerControllerDelegate, OverlayViewControllerDelegate> {
    IBOutlet UITextField *userName;
    IBOutlet UILabel     *location;
    MobxLocationController *locationController;
    
    UIImageView *imageView;
    OverlayViewController *overlayViewController; // the camera custom overlay view
    UIImage *takenPicture;
}

@property (nonatomic, retain) UITextField *userName;
@property (nonatomic, retain) UILabel *location;

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) OverlayViewController *overlayViewController;
@property (nonatomic, retain) UIImage *takenPicture;

// toolbar buttons
- (IBAction)photoLibraryAction:(id)sender;
- (IBAction)cameraAction:(id)sender;

-(IBAction) onSubmitClick: (id) sender;
-(IBAction) onUserNameDone: (id) sender;

@end
