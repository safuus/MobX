//
//  MobxContext.m
//  Mobx
//
//  Created by Weicheng Peng on 8/4/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "MobxContext.h"

@implementation MobxContext

@synthesize currentViewController;

static MobxContext *instance = nil;

#pragma mark Singleton Methods
+ (id)getInstance {
    @synchronized(self) {
        if(instance == nil) {
            instance = [[super allocWithZone:NULL] init];
        }
    }
    return instance;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [[self getInstance] retain];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX; //denotes an object that cannot be released
}

- (void)release {
    // never release
}

- (id)autorelease {
    return self;
}

- (id)init {
    if (self = [super init]) {
        self.currentViewController = nil;
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
    [currentViewController release];
    [super dealloc];
}

@end
