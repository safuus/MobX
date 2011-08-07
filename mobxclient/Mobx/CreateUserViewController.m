//
//  CreateUserViewController.m
//  Mobx
//
//  Created by Weicheng Peng on 8/4/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "CreateUserViewController.h"
#import "MobxUIConstants.h"

@implementation CreateUserViewController

@synthesize userName;
@synthesize location;
@synthesize overlayViewController;
@synthesize imageView;
@synthesize takenPicture;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    [takenPicture release];
    [imageView release];
    [overlayViewController release];
    [locationController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)locationUpdate:(NSString *)city {
    self.location.text = city;
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    locationController = [[MobxLocationController alloc] init];
    locationController.delegate = self;
    [locationController.locationManager startUpdatingLocation];
    
    self.overlayViewController =
    [[[OverlayViewController alloc] initWithNibName:@"OverlayViewController" bundle:nil] autorelease];
    
    // as a delegate we will be notified when pictures are taken and when to dismiss the image picker
    self.overlayViewController.delegate = self;             
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.imageView = nil;
    
    self.overlayViewController = nil;
    self.takenPicture = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Toolbar Actions

- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType
{
    if ([UIImagePickerController isSourceTypeAvailable:sourceType])
    {
        [self.overlayViewController setupImagePicker:sourceType];
        [self presentModalViewController:self.overlayViewController.imagePickerController animated:YES];
    }
}

- (IBAction)photoLibraryAction:(id)sender
{   
	[self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (IBAction)cameraAction:(id)sender
{
    [self showImagePicker:UIImagePickerControllerSourceTypeCamera];
}

#pragma mark -
#pragma mark OverlayViewControllerDelegate

// as a delegate we are being told a picture was taken
- (void)didTakePicture:(UIImage *)picture
{
    //TODO: save it locally.
    self.takenPicture = picture;
    
    //
    // Saving into Documents folder
    //
    NSString* path = [NSHomeDirectory() stringByAppendingString:@"/Documents/myImage.png"];
    
    BOOL ok = [[NSFileManager defaultManager] createFileAtPath:path 
                                                      contents:nil attributes:nil];    
    if (!ok) {
        NSLog(@"Error creating file %@", path);
    } else {
        NSFileHandle* myFileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
        [myFileHandle writeData:UIImagePNGRepresentation(self.takenPicture)];
        [myFileHandle closeFile];
    }    
}

// as a delegate we are told to finished with the camera
- (void)didFinishWithCamera
{
    [self dismissModalViewControllerAnimated:YES];
    
    [self.imageView setImage: self.takenPicture];
}

#pragma mark - Actions

-(IBAction) onUserNameDone: (id) sender {
    [[self userName] resignFirstResponder];
}

// submit button clicked
-(IBAction) onSubmitClick: (id) sender {
    // create the user on the server then redirect to tab controller view
    NSString *l_userName = [[self userName] text];
    [[UIAppDelegate mobxHandler] createUser: l_userName];
}

@end
