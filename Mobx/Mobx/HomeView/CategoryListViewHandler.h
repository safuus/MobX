//
//  CategoryListViewHandler.h
//  Mobx
//
//  Created by Weicheng Peng on 7/17/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CategoryListViewHandler : NSObject <UITableViewDelegate, UITableViewDataSource>{
    NSArray *tableListData;
}

@property (nonatomic, retain) NSArray * tableListData;
- (void) fillList;
@end
