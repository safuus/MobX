//
//  MobxAppDelegate.h
//  Mobx
//
//  Created by Weicheng Peng on 7/17/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"
#import "MobxProtocol.h"

@interface MobxAppDelegate : NSObject <UIApplicationDelegate> {
    MobxProtocol *mobxHandler;
}

@property (nonatomic, retain) MobxProtocol *mobxHandler;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
