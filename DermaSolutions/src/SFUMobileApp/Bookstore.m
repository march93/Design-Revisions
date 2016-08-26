//
//  Bookstore.m
//  SFUMobileApp
//
//  Created by Ricardo Haro Colmenero on 2015-04-09.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
#import "Bookstore.h"

@interface Bookstore ()

@end

@implementation Bookstore

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	//load the bookstore mobile website 
    NSString *url = @"http://sfu.collegestoreonline.com/ePOS?form=index.html&store=472&design=mobile";
    NSURL *connectUrl = [NSURL URLWithString:url];
    NSURLRequest *connectRequest = [NSURLRequest requestWithURL:connectUrl];
    [self.webviewBookstore loadRequest:connectRequest];

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
