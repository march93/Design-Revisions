//
//  DiningViewController.h
//  SFUMobileApp
//
//  Created by Emre Erhan on 2015-04-06.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
//
//  Credit to Lukas Kukacka from Fuerte Int. Ltd.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder

#import <UIKit/UIKit.h>

@interface DiningViewController : UIViewController
{
    UIWebView *webview;
}

@property (copy, nonatomic) NSString *url;
@property (retain, nonatomic) IBOutlet UIWebView *webview;

@end
