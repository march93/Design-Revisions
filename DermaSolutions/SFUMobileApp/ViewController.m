//
//  ViewController.m
//  TestingTalkingWithWebsites
//
//  Created by Emre Erhan on 2015-03-05.
//  Copyright (c) 2015 Emre Erhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.Label.text = @"Information";
    [self.logIn setTitle:@"Login" forState:UIControlStateNormal];
    [self.webView loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString:@"https://go.sfu.ca/"]]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)injectJavascript:(NSString *)resource {
    NSString *jsPath = [[NSBundle mainBundle] pathForResource:resource ofType:@"js"];
    NSString *js = [NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:NULL];
    
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}
- (IBAction)buttonAction:(id)sender {
    
    NSString *username = self.textField.text;
    NSString *password = self.password.text;
    NSString *jsCallBack = [NSString stringWithFormat:@"updateWebForm('%@','%@');",username,password];
    [self injectJavascript:@"updateWebForm"];
    [self.webView stringByEvaluatingJavaScriptFromString:jsCallBack];
    
    
    
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
}

@end
