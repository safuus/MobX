//
//  mobxAppDelegate.h
//  mobx
//
//  Created by Weicheng Peng on 7/16/11.
//  Copyright 2011 HomeNet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mobxAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
