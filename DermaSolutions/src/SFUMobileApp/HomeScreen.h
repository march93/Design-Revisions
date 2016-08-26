//
//  HomeScreen.h
//  SFUMobileApp
//
//  Created by Marc Ho on 2015-03-02.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//
// This is the homescreen view controller , the main hub for all of the app's features

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <iAd/iAd.h>
#import "Reachability.h"



@class Reachability;
Reachability* internetReachable;
Reachability* hostReachable;

@interface HomeScreen : UIViewController <MFMailComposeViewControllerDelegate, ADBannerViewDelegate>


@property (weak, nonatomic) IBOutlet UIButton *connectClick;

- (IBAction)showEmail:(id)sender;

@property (weak, nonatomic) IBOutlet ADBannerView *adBanner;

@property (weak, nonatomic) IBOutlet UILabel *lblTimerMessage;

-(void) checkNetworkStatus:(NSNotification *)notice;

@end
