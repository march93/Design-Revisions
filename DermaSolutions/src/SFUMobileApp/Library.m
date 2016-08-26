//
//  Library.m
//  SFUMobileApp
//
//  Created by Emre Erhan on 2015-03-23.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
//

#import "Library.h"
#import "AppDelegate.h"

@interface Library ()

@end

@implementation Library

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *libraryURLString = @"http://www.lib.sfu.ca/m";
    NSURL *libraryURL = [NSURL URLWithString:libraryURLString];
    NSURLRequest *libraryRequest = [NSURLRequest requestWithURL:libraryURL];
    [_libraryWebview loadRequest:libraryRequest];
    self.automaticallyAdjustsScrollViewInsets=NO;
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
