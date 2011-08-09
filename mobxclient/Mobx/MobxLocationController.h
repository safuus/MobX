//
//  MobxLocationController.h
//  Mobx
//
//  Created by Weicheng Peng on 8/5/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>
#import <CoreLocation/CoreLocation.h>

@interface MobxLocationController : NSObject<MKReverseGeocoderDelegate, CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    id delegate; 
    
    UInt16 count;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, assign) id  delegate;

@property (nonatomic, assign) UInt16 count;


@end
