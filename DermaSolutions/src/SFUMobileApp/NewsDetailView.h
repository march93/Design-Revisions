//
//  ViewController.h
//  TableViewApplication
//
//  Created by Daphne Chiang on 2015-03-01.
//  Copyright (c) 2015 Daphne Chiang. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder

#import <UIKit/UIKit.h>

@interface NewsDetailView : UIViewController{
    
    
    //Create activity indicator that shows if the webview is still loading
    IBOutlet UIActivityIndicatorView *ActInd;
    
    // a timer that limits the maximum loading time
    NSTimer *timer;
    
}

@property (copy, nonatomic) NSString *url;
@property (strong, nonatomic) IBOutlet UIWebView *webview;


@end
