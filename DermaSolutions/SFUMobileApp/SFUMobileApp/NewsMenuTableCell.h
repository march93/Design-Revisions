//
//  TableCell.h
//  TableViewApplication
//
//  Created by Daphne Chiang on 2015-03-01.
//  Copyright (c) 2015 Daphne Chiang. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder

#import <UIKit/UIKit.h>

@interface NewsMenuTableCell : UITableViewCell


// 2 labels and one imageview
// which will be shown on the cell

@property (strong, nonatomic) IBOutlet UILabel *TitleLable;
@property (strong, nonatomic) IBOutlet UILabel *DescriptionLable;
@property (strong, nonatomic) IBOutlet UIImageView *ThumbImage;

@end
