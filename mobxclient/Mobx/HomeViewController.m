//
//  HomeViewController.m
//  Mobx
//
//  Created by Weicheng Peng on 7/17/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "HomeViewController.h"
#import "MobxUIConstants.h"
#import <AddressBook/AddressBook.h>
#import "MobxContext.h"

@implementation HomeViewController

@synthesize userInfo = _userInfo;
@synthesize categoryListHandler = _categoryListHandler;
@synthesize imageView;
@synthesize categoryListView = _categoryListView;
@synthesize location;
@synthesize navItem;
@synthesize destroyButton;

- (id)init {
    [super init];
    locationController = nil;
    return self;
}

- (void)viewDidAppear:(BOOL)animated {    
    // load the profile image
    NSString* path = [NSHomeDirectory() stringByAppendingString:@"/Documents/myImage.png"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSFileHandle* myFileHandle = [NSFileHandle fileHandleForReadingAtPath:path];
        UIImage* loadedImage = [UIImage imageWithData:[myFileHandle readDataToEndOfFile]];
        [self.imageView setImage:loadedImage];
    }
            
    MobxContext *context = [MobxContext getInstance];
    context.currentViewController = self;
    [self startUpdatingLocation];
}

- (void)viewDidDisappear:(BOOL)animated {
    MobxContext *context = [MobxContext getInstance];
    context.currentViewController = nil;
}

- (void) startUpdatingLocation {
    if (locationController == nil) {
        locationController = [[MobxLocationController alloc] init];
        locationController.delegate = self;
    }
    [locationController.locationManager startUpdatingLocation];
}

// Destroy the user profile.
- (IBAction)destroyApplication:(id)sender {
    [[UIAppDelegate mobxHandler] deleteUserProfile];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    _userInfo.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"userName"];
    //@"Wallace Peng";

	// Configure the table view.
    _categoryListView.rowHeight = 73.0;
    _categoryListView.backgroundColor = DARK_BACKGROUND;
    _categoryListView.separatorStyle = UITableViewCellSeparatorStyleNone;    
    [_categoryListHandler fillList];
    
    [self startUpdatingLocation];
}

- (void)locationUpdate:(NSString *)city {
    self.location.text = city;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations	
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [self.categoryListView release];
    [self.userInfo release];
    [self.imageView release];
    [self.location release];
    [_categoryListHandler release];
    [super dealloc];
}


@end
