//
//  MobxClientAppDelegate.h
//  MobxClient
//
//  Created by Weicheng Peng on 7/15/11.
//  Copyright 2011 HomeNet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MobxClientAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
