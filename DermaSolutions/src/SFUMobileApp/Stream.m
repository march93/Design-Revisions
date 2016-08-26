//
//  Stream.m
//  SFUMobileApp
//
//  Created by Marc Ho on 2015-04-02.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//

#import "Stream.h"
#import "AppDelegate.h"

@interface Stream ()

@end

@implementation Stream

- (void)viewDidLoad {
    [super viewDidLoad];
    [self portraitUnLock];
    // Do any additional setup after loading the view.
    
    NSString *streamURLString = @"http://www.cjsf.ca/listen.m3u";
    NSURL *streamURL = [NSURL URLWithString:streamURLString];
    NSURLRequest *streamRequest = [NSURLRequest requestWithURL:streamURL];
    [_streamwebView loadRequest:streamRequest];
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
