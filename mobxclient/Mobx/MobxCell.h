//
//  ChatsTableViewCell.h
//  Mobx
//
//  Created by Weicheng Peng on 7/21/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MobxCell : UITableViewCell {
    BOOL useDarkBackground;
    
    UIImage *icon;
    NSString *name;
}

@property BOOL useDarkBackground;

@property(retain) UIImage *icon;
@property(retain) NSString *name;

@end
