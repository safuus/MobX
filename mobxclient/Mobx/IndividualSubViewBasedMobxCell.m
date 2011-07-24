//
//  IndividualSubViewBasedMobxCell.m
//  Mobx
//
//  Created by Weicheng Peng on 7/21/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "IndividualSubViewBasedMobxCell.h"


@implementation IndividualSubViewBasedMobxCell

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    
    iconView.backgroundColor = backgroundColor;
    nameLabel.backgroundColor = backgroundColor;
}

- (void)setIcon:(UIImage *)newIcon
{
    [super setIcon:newIcon];
    iconView.image = newIcon;
}

- (void)setName:(NSString *)newName
{
    [super setName:newName];
    nameLabel.text = newName;
}

- (void)dealloc
{
    [iconView release];
    [nameLabel release];
    
    [super dealloc];
}


@end
