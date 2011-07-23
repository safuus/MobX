//
//  ChatsViewCell.h
//  Mobx
//
//  Created by Weicheng Peng on 7/21/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MobxCell.h"

@interface IndividualSubViewBasedMobxCell : MobxCell {
    IBOutlet UIImageView *iconView;
    IBOutlet UILabel *nameLabel;
}

@end
