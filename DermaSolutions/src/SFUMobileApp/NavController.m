//
//  NavController.m
//  SFUMobileApp
//
//  Created by Ricardo Haro Colmenero
//             Daphne Chiang
//                                 on   2015-03-07.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//
//

#import "NavController.h"
#import "UIColor+Helper.h"

@interface NavController ()

@end

@implementation NavController

- (void)viewDidLoad {
   
    // Do any additional setup after loading the view.
    //UIColor *soupcolor = [UIColor colorWithRGBA:0xA6192E01];
    //[[UINavigationBar appearance ] setBarTintColor:soupcolor];
    //[[UINavigationBar appearance ] setBarTintColor:[UIColor colorWithRed:.647058 green:.098039 blue:.180392 alpha:1]];
    [[UINavigationBar appearance ] setBarTintColor:[UIColor colorWithRed:(166/255.0) green:(25/255.0) blue:(46/255.0) alpha:1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


