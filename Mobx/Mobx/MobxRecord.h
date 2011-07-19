//
//  MobxObject.h
//  Mobx
//
//  Created by Weicheng Peng on 7/18/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MobxRecord : NSObject {
    NSString *type;
	NSString *name;
}

@property (nonatomic, copy) NSString *type, *name;

+ (id)recordWithType:(NSString *)type name:(NSString *)name;

@end
