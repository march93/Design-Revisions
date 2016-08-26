//
//  ConnectV2.m
//  SFUMobileApp
//
//  Created by Emre Erhan on 2015-03-07.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
/// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder

#import "ConnectV2.h"
#import "AppDelegate.h"

@interface ConnectV2 ()

@end

@implementation ConnectV2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*Load connect.sfu.ca onto the webview "webviewConnect" through a request */
    NSString *url = @"http://connect.sfu.ca";
    NSURL *connectUrl = [NSURL URLWithString:url];
    NSURLRequest *connectRequest = [NSURLRequest requestWithURL:connectUrl];
    [self.webviewConnect loadRequest:connectRequest];

    [self portraitUnLock];
}

// Allow rotation
-(void) portraitUnLock {
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.screenIsPortraitOnly = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyb/Users/emreerhan/Desktop/SFUMobileApp/SFUMobileApp/SFUMobileApp/Base.lproj/Main.storyboardoard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
