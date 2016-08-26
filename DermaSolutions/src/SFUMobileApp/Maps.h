//
//  Maps.h
//  SFUMobileApp
//
//  Created by Marc Ho on 2015-03-16.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
#import <UIKit/UIKit.h>

@protocol MapviewProtocol

-(void)setString:(NSString *)string;
-(void)performSearchWithString:(NSString *)string;

@end

#import <GoogleMaps/GoogleMaps.h>
#import "QRController.h"

@interface Maps : UIViewController <GMSMapViewDelegate, UISearchBarDelegate,MapviewProtocol,UITableViewDelegate, UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UIButton *QRButton;

@property (copy, nonatomic) NSString *qrScanQuery;

@property (weak, nonatomic) IBOutlet UITableView *suggestionsTableView;

//search suggestions
@property (strong,nonatomic) NSArray *LocationArray;
@property (strong,nonatomic) NSMutableArray *filteredLocationArray;

@end
