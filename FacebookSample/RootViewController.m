//
//  RootViewController.m
//  FacebookSample
//
//  Created by Vladmir on 10/09/2012.
//  Copyright (c) 2012 www.develoers-life.com. All rights reserved.
//

#import "RootViewController.h"
#import "DEFacebookComposeViewController.h"
#import <FacebookSDK/FacebookSDK.h>

#import <Social/Social.h>

@interface RootViewController ()
@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction) shareViaFacebook: (id)sender {
    DEFacebookComposeViewController *facebookViewComposer = [[DEFacebookComposeViewController alloc] init];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    [facebookViewComposer setInitialText:@"Look on this"];
    
    // optional
    //[facebookViewComposer addImage:[UIImage imageNamed:@"1.jpg"]];
    // or
    // optional
	//    [facebookViewComposer addURL:@"http://www.yogatracker.com"];
    
    [facebookViewComposer setCompletionHandler:^(DEFacebookComposeViewControllerResult result) {
        switch (result) {
            case DEFacebookComposeViewControllerResultCancelled:
                NSLog(@"Facebook Result: Cancelled");
                break;
            case DEFacebookComposeViewControllerResultDone:
                NSLog(@"Facebook Result: Sent");
                break;
        }
        
        [self dismissModalViewControllerAnimated:YES];
    }];
    
    [self presentViewController:facebookViewComposer animated:YES completion:nil];
}

@end
