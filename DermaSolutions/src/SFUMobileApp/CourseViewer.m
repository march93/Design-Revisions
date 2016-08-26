//
//  SecondLoginController.m
//  SFUMobileApp
//
//  Created by Ricardo Haro Colmenero
//             Emre Erhan
//                          on 2015-03-08.
//  Copyright (c) 2015 Ricardo Haro Colmenero. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder

#import "CourseViewer.h"
#import "LoginController.h"
#import "AppDelegate.h"

@interface CourseViewer ()

@end

@implementation CourseViewer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //add bundlepath to load local css
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:bundlePath];
    
    //Load the Weekly Schedule as a default, information is obtained from viewcontroller LoginController
    [_SecondWebView loadHTMLString:self.weeklySchedule baseURL:baseURL];
    
    [_viewselect addTarget:self action:@selector(switchBetweenTheViews:) forControlEvents:UIControlEventValueChanged];
    
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

//enables a segmented control to switch between loading weekly schedule or list onto the webview
-(void)switchBetweenTheViews:(id)sender {
    
    //add bundlepath to load local css
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:bundlePath];
    
    UISegmentedControl *sc = (UISegmentedControl*)sender;
    NSString *selectedURL;
    if (sc.selectedSegmentIndex == 0) {
        selectedURL = _weeklySchedule;
    }
     else {
         selectedURL = _listView;
    }
        [_SecondWebView loadHTMLString:selectedURL baseURL:baseURL];
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
