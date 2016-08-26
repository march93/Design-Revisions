//
//  TableViewController_menu.h
//  TableViewApplication
//
//  Created by Daphne Chiang on 2015-03-01.
//  Copyright (c) 2015 Daphne Chiang. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder

#import <UIKit/UIKit.h>

@interface NewsMenu : UITableViewController



//3 arraies to store 1.Names of 5 image files
//                   2.Names of 5 news title
//                   3.URL links of 5 news categories
@property (nonatomic, strong) NSArray *Images;
@property (nonatomic, strong) NSArray *Title;
@property (nonatomic, strong) NSArray *Description;

@end
