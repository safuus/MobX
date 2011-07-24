//
//  AllConfigsViewController.m
//  Mobx
//
//  Created by Weicheng Peng on 7/22/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "AllConfigsViewController.h"
#import "IASKSpecifier.h"
#import "IASKSettingsReader.h"

@implementation AllConfigsViewController

-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder]; 
}

#pragma mark - View lifecycle


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark IASKAppSettingsViewControllerDelegate protocol
- (void)settingsViewControllerDidEnd:(IASKAppSettingsViewController*)sender {
    [self dismissModalViewControllerAnimated:YES];
	
	// your code here to reconfigure the app for changed settings
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderForKey:(NSString*)key {
	if ([key isEqualToString:@"IASKLogo"]) {
		return [UIImage imageNamed:@"Icon-gear.png"].size.height + 25;
	}
	return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderForKey:(NSString*)key {
	if ([key isEqualToString:@"IASKLogo"]) {
		UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon-gear.png"]];
		imageView.contentMode = UIViewContentModeCenter;
		return [imageView autorelease];
	}
	return nil;
}


@end
