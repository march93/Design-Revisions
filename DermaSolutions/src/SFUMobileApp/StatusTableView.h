//
//  StatusTableView.h
//  SFUStatus
//
//  Created by Daphne Chiang on 2015-03-14.
//  Copyright (c) 2015 Derma Solution. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//

#import <UIKit/UIKit.h>

@interface StatusTableView : UITableViewController

@property (nonatomic, strong) NSMutableDictionary *Data;
@property (nonatomic, strong) NSDictionary *Path;

@property (nonatomic, strong) NSMutableArray *Title;
@property (nonatomic, strong) NSMutableArray *Status;
@property (nonatomic, strong) NSArray *GroupedTitle;


@end
