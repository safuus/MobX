//
//  JsonClassFactory.h
//  Mobx
//
//  Created by Weicheng Peng on 8/6/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonClassFactory : NSObject

+ (id) getClassInstance:(NSInteger)classId;

@end
