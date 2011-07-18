//
//  HomeViewController.m
//  Mobx
//
//  Created by Weicheng Peng on 7/17/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "HomeViewController.h"


@implementation HomeViewController

@synthesize userInfo = _userInfo;
@synthesize categoryListHandler = _categoryList;

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    _userInfo.text = @"Wallace Peng";
    [_categoryList fillList];
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
    [super dealloc];
    [_categoryList dealloc];
}

@end
