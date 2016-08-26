//
//  BusTimes.h
//  SFUMobileApp
//
//  Created by Angela Lee on 2015-03-21.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder

#import <UIKit/UIKit.h>

@interface BusTimes : UITableViewController


//Change this to just two arrays, one for each direction
//@property(strong, nonatomic) NSMutableArray *OneThirtyFive;
//@property(strong, nonatomic) NSMutableArray *OneFourtyThree;
//@property(strong, nonatomic) NSMutableArray *OneFourtyFour;
//@property(strong, nonatomic) NSMutableArray *OneFourtyFive;

@property(strong, nonatomic) NSMutableArray *schedule;

@property (strong, nonatomic) NSString *routeNo;

@end
