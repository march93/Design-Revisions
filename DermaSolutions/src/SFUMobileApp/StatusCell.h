//
//  StatusCell.h
//  SFUStatus
//
//  Created by Daphne Chiang on 2015-03-15.
//  Copyright (c) 2015 Derma Solution. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//
#import <UIKit/UIKit.h>

@interface StatusCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *TitleLable;
@property (strong, nonatomic) IBOutlet UILabel *DescriptionLable;

@end
