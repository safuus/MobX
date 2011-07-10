//
//  mobxAppDelegate.h
//  mobx
//
//  Created by Weicheng Peng on 7/10/11.
//  Copyright 2011 HomeNet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class mobxViewController;

@interface mobxAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet mobxViewController *viewController;

@end
