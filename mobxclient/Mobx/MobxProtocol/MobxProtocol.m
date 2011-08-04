//
//  MobxProtocol.m
//  Mobx
//
//  Created by Weicheng Peng on 8/4/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "MobxProtocol.h"


@implementation MobxProtocol

@synthesize asyncSocket, appDelegate;

const int ddLogLevel = LOG_LEVEL_INFO;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

/*
 it checks if the server has this iPhone's UDID, if not it creates the user in the server side
 */
- (void) createUserProfileAndLogin {
	
	self.asyncSocket = [[AsyncSocket alloc] initWithDelegate:self];
    
    
    DDLogInfo(@"Connecting to \"%@\" on port %hu...", MOBX_SERVER_ADDRESS, MOBX_SERVER_PORT);
    
    NSError *error = nil;
    if (![self.asyncSocket connectToHost:MOBX_SERVER_ADDRESS onPort:MOBX_SERVER_PORT error:&error])
    {
        DDLogError(@"Error connecting: %@", error);
    }
    
}

- (void) createUser {
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    [self.appDelegate window ].rootViewController = [self.appDelegate tabBarController];
    [[self.appDelegate window] makeKeyAndVisible];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark AsyncSocket Delegate
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (BOOL)onSocketWillConnect:(AsyncSocket *)sock {

    return YES;
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
	DDLogInfo(@"socket:%p didReadData:withTag:%d", sock, tag);
	
	NSString *response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	DDLogInfo(@"HTTP Response:\n%@", response);
    
    if (tag == TAG_GETUSER) {
        DDLogInfo(@"GETUSER Response:\n%@", response);
        if ([response isEqualToString:@"0\r\n"] ){
            DDLogInfo(@"user does not exist:\n");
            // create a new user
            [self createUser];             
        }
    }
	
	[response release];
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag {
    DDLogInfo(@"socket:%p didWriteDataWithTag:%d", sock, tag);
}

- (void) onSocket: (AsyncSocket*) sock willDisconnectWithError: (NSError*) err {

}

- (void) onSocket: (AsyncSocket*) sock didConnectToHost: (NSString*) host port: (UInt16) port {

	DDLogInfo(@"socket:%p didConnectToHost:%@ port:%hu", sock, host, port);
	
    /*
     check if the current iPhone has been registered. currently we use \r\n as the end of the message, we can config MINA
     to support other ending later for example \0 etc. but really \r\n probably is enough as we can copy the same mechanism of HTTP protocol or we can create a separate message filter.
     For now, i am thinking that we just use \r\n as the end of a Mobx message, we need http encode then send out.
     
     */
    NSString *uid = [[UIDevice currentDevice] uniqueIdentifier];
    NSString *requestStr = [NSString stringWithFormat:@"%@ %@\r\n", @"GETUSER", uid];
	NSData *requestData = [requestStr dataUsingEncoding:NSUTF8StringEncoding];
    [self.asyncSocket writeData:requestData withTimeout:-1.0 tag:TAG_GETUSER];
    
    // Start asynchronous read operation.
    // if the user exists, it will return the user information otherwise return 0
    [self.asyncSocket readDataToData:[AsyncSocket CRLFData] withTimeout:-1 tag:TAG_GETUSER];
}

@end
