//
//  User.h
//  Mobx
//
//  Created by Weicheng Peng on 8/6/11.
//  Copyright (c) 2011 Mobx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * iphone_udid;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSString * photo_path;
@property (nonatomic, retain) NSDate * created_date;

@end
