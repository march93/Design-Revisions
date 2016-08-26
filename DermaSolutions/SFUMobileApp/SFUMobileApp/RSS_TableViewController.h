//
//  RSS_TableViewController.h
//  TableViewApplication
//
//  Created by Daphne Chiang on 2015-03-01.
//  Copyright (c) 2015 Daphne Chiang. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder

#import <UIKit/UIKit.h>

@interface RSS_TableViewController : UITableViewController <NSXMLParserDelegate>


//The tableview for listing the 5 news categories
@property (strong, nonatomic) IBOutlet UITableView *tableView;


//Three Lables to shown on the cell
@property (strong, nonatomic) IBOutlet UILabel *RSSTitleLable;
@property (strong, nonatomic) IBOutlet UILabel *RSSDescriptionLable;
@property (strong, nonatomic) IBOutlet UIImageView *RSSImageView;


//The array that stores data from NewsMenuTableCell.m
@property (strong, nonatomic) IBOutlet NSArray *DetailModal;

@end
