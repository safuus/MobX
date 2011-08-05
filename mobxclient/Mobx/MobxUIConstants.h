//
//  MobxUIConstants.h
//  Mobx
//
//  Created by Weicheng Peng on 7/24/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#ifndef Mobx_MobxUIConstants_h
#define Mobx_MobxUIConstants_h

/*
 Predefined colors to alternate the background color of each cell row by row
 (see tableView:cellForRowAtIndexPath: and tableView:willDisplayCell:forRowAtIndexPath:).
 */
#define DARK_BACKGROUND  [UIColor colorWithRed:151.0/255.0 green:152.0/255.0 blue:155.0/255.0 alpha:1.0]
#define LIGHT_BACKGROUND [UIColor colorWithRed:172.0/255.0 green:173.0/255.0 blue:175.0/255.0 alpha:1.0]

@class MobxAppDelegate;
@class UIApplication;

#define UIAppDelegate \
((MobxAppDelegate *)[UIApplication sharedApplication].delegate)

#endif
