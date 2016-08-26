//
//  ConnectV2.h
//  SFUMobileApp
//
//  Created by Emre Erhan on 2015-03-07.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//
// This is the View controller for the mail feature, It contains a webview to load connect.sfu.ca

#import <UIKit/UIKit.h>

@interface ConnectV2 : UIViewController

//UIWebview to load Connect.sfu.ca 
@property (strong, nonatomic) IBOutlet UIWebView *webviewConnect;

@end
