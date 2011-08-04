//
//  MobxProtocol.h
//  Mobx
//
//  Created by Weicheng Peng on 8/4/11.
//  Copyright 2011 Mobx. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AsyncSocket.h"
#import "DDLog.h"
#import "DDTTYLogger.h"
#import "OtherConstants.h"

// Log levels: off, error, warn, info, verbose // we need override this later!
extern const int ddLogLevel;

#define TAG_GETUSER 1000
#define TAG_CREATEUSER 1001

@class MobxAppDelegate;

@interface MobxProtocol : NSObject {
     AsyncSocket *asyncSocket;
     MobxAppDelegate *appDelegate;
}

@property (nonatomic, assign) MobxAppDelegate *appDelegate;

@property (nonatomic, retain) AsyncSocket *asyncSocket;

- (void) createUserProfileAndLogin;

@end
