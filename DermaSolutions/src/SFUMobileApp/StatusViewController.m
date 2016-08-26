//
//  StatusViewController.m
//  SFUStatus
//
//  Created by Daphne Chiang on 2015-03-19.
//  Copyright (c) 2015 Derma Solution. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//

#import "StatusViewController.h"
#import "AppDelegate.h"

@interface StatusViewController ()

@end

@implementation StatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *URL = [NSURL URLWithString:[self.url stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSString *CheckURL = self.url;
    if (request == (id)[NSNull null] || CheckURL.length == 0){
        [self setAnnouncement:_announcement];
    }else{
        [self.webview loadRequest:request];
    }
    
    [self portraitUnLock];
     self.automaticallyAdjustsScrollViewInsets=NO;
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

-(void)setAnnouncement:(NSString *)announcement{

    _announcement = announcement;
    
    [self.webview loadHTMLString:_announcement baseURL:nil];
    
    

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
