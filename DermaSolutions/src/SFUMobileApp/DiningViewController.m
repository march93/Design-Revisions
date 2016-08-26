//
//  DiningViewController.m
//  SFUMobileApp
//
//  Created by Emre Erhan on 2015-04-06.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
//
//  Credit to Lukas Kukacka from Fuerte Int. Ltd.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder

#import "DiningViewController.h"

@interface DiningViewController ()

@end

@implementation DiningViewController
@synthesize webview;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    
    
    // Create a webview
    // Load the url link of selected news
    NSLog(@"VIEW CONTROLER url = %@\n\n\n", self.url);
    
    //NSString *WebsiteURL = self.url;
    
    UIWebView *tempwebview = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSString *WebsiteURL = @"http://www.sfucoffee.com/";
    NSURL *URL = [NSURL URLWithString:WebsiteURL];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    self.webview = tempwebview;
    [self.webview loadRequest:request];
    webview.delegate=self;
    

    
    
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
