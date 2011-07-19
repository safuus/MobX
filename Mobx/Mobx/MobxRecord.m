//
//  MobxObject.m
//  Mobx
//
//  Created by Weicheng Peng on 7/18/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "MobxRecord.h"


@implementation MobxRecord

@synthesize type, name;


+ (id)recordWithType:(NSString *)type name:(NSString *)name
{
	MobxRecord *newRecord = [[[self alloc] init] autorelease];
	newRecord.type = type;
	newRecord.name = name;
	return newRecord;
}


- (void)dealloc
{
	[type release];
	[name release];
	[super dealloc];
}

@end
