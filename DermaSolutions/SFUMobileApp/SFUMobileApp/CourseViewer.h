//
//  SecondLoginController.h
//  SFUMobileApp
//
//  Created by Ricardo Haro Colmenero
//             Emre Erhan
//                          on 2015-03-08.
//  Copyright (c) 2015 Ricardo Haro Colmenero. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//
//This viewcontroller has a webview to load the course schedule in two different formats, it obtains the html strings from LoginController upon succesfull login

#import <UIKit/UIKit.h>

@interface CourseViewer : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *SecondWebView;
@property (strong, nonatomic) IBOutlet NSString *weeklySchedule;
@property (strong, nonatomic) IBOutlet NSString *listView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *viewselect;

@end
