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

#define TAG_GETUSER_OR_CREATEUSER 1000
#define TAG_CREATEUSER 1001

@interface MobxProtocol : NSObject {
     AsyncSocket *asyncSocket;
}

@property (nonatomic, retain) AsyncSocket *asyncSocket;

- (void) createUserProfileAndLogin;
- (void) createUserView;

- (void) createUser: (NSString*) userName;

@end
