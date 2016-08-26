//
//  LoginController.h
//  SFUMobileApp
//
//  Created by Ricardo Haro Colmenero
//             Emre Erhan
//                          on 2015-03-08.
//  Copyright (c) 2015 Ricardo Haro Colmenero. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//
//LoginController.h/.m are the view controllers for the login option for Course Schedule
//here a javascript is injected onto go.sfu.ca to provide access and then it is redirected to the CourseViewer

#import <UIKit/UIKit.h>
#import "CourseViewer.h"

@interface LoginController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
-(IBAction)textField:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *password;
-(IBAction)password:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *logIn;

@property (weak, nonatomic) IBOutlet UIWebView *loginWebview;

@property (weak, nonatomic) IBOutlet UIButton *readyButton;

@end
