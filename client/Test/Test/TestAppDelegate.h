//
//  TestAppDelegate.h
//  Test
//
//  Created by Weicheng Peng on 7/10/11.
//  Copyright 2011 HomeNet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
