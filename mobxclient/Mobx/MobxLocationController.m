//
//  MobxLocationController.m
//  Mobx
//
//  Created by Weicheng Peng on 8/5/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "MobxLocationController.h"
#import <AddressBook/AddressBook.h>

@implementation MobxLocationController

@synthesize locationManager;
@synthesize delegate;

- (void) startFindingLocation {
    
    // this creates the CCLocationManager that will find your current location
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];  
}

- (id)init
{
    self = [super init];
    
    if (self != nil) {
        self.locationManager = [[[CLLocationManager alloc] init] autorelease];
        self.locationManager.delegate = self; // send loc updates to myself
    }
    
    return self;
}

- (void)dealloc {
    [self.locationManager release];
    [super dealloc];
}

#pragma CLLocationManager 

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{    
    // stop it.
    [manager stopUpdatingLocation];
    
    // this creates a MKReverseGeocoder to find a placemark using the found coordinates
    MKReverseGeocoder *geoCoder = [[MKReverseGeocoder alloc] initWithCoordinate:newLocation.coordinate];
    geoCoder.delegate = self;
    [geoCoder start];
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error 
{
    // stop it.
    [manager stopUpdatingLocation];
    
    NSLog(@"locationManager:%@ didFailWithError:%@", manager, error);
    if ([error domain] == kCLErrorDomain) {
        
        // We handle CoreLocation-related errors here
        switch ([error code]) {
                // "Don't Allow" on two successive app launches is the same as saying "never allow". The user
                // can reset this for all apps by going to Settings > General > Reset > Reset Location Warnings.
            case kCLErrorDenied:
                
            case kCLErrorLocationUnknown:
                
            default:
                break;
        }
    } else {
        // We handle all non-CoreLocation errors here
    }
}

#pragma MKReverseGeocoder 

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
    MKPlacemark * myPlacemark = placemark;
    // with the placemark you can now retrieve the city name
    NSString *city = [myPlacemark.addressDictionary objectForKey:(NSString*) kABPersonAddressCityKey];
    
    [geocoder cancel];
    [self.delegate locationUpdate:city];
}


- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
{
    NSLog(@"reverseGeocoder:%@ didFailWithError:%@", geocoder, error);
}


@end
