//
//  FTGooglePlacesAPIExamplesListViewController.m
//  FTGooglePlacesAPI
//
//  Created by Lukas Kukacka on 20/11/13.
//  Copyright (c) 2013 Fuerte Int. Ltd. All rights reserved.
//

#import "FTGooglePlacesAPIExamplesListViewController.h"

#import "FTGooglePlacesAPI.h"
#import "FTGooglePlacesAPIExampleResultsViewController.h"

typedef NS_ENUM(NSUInteger, FTGooglePlacesAPIExampleType) {
    FTGooglePlacesAPIExampleTypeNearestCulture,
    FTGooglePlacesAPIExampleTypeMuseumKeyword,
    FTGooglePlacesAPIExampleTypeTextSearchPizzaInLondon,
    FTGooglePlacesAPIExampleTypeExpensiveRestaurant
};


@interface FTGooglePlacesAPIExamplesListViewController ()

@property (nonatomic, assign) CLLocationCoordinate2D locationCoordinate;

@end

@implementation FTGooglePlacesAPIExamplesListViewController

/*- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"FTGooglePlacesAPI";
        
        //  For sake of simplicity of the example, we do not get real location, which would require
        //  additional code and just use constant latitude and longitude of London's Big Ben
        //  For easy to use getting of current location, you take a look at FTLocationManager
        //  https://github.com/FuerteInternational/FTLocationManager
        self.locationCoordinate = CLLocationCoordinate2DMake(49.277616, -122.914254);
        
        NSLog(@"Init with Style location %@", self.locationCoordinate);
    }
    return self;
}*/

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.locationCoordinate = CLLocationCoordinate2DMake(49.277616, -122.914254);
    //NSLog(@"View Did Load location %@", self.locationCoordinate);
    
}

#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return 4;   //  Number of items in FTGooglePlacesAPIExampleType enum
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ExampleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    FTGooglePlacesAPIExampleType exampleType = (FTGooglePlacesAPIExampleType)indexPath.row;
    
    //cell.textLabel.text = [self titleForExampleType:exampleType];
    //cell.detailTextLabel.text = [self subtitleForExampleType:exampleType];
    cell.textLabel.text = @"Restaurant";
    cell.detailTextLabel.text = @"String";
    
    
    return cell;
}

#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //  Get request for current row
    FTGooglePlacesAPIExampleType exampleType = (FTGooglePlacesAPIExampleType)indexPath.row;
    
    
    id<FTGooglePlacesAPIRequest> request = [self googlePlacesAPIRequestForExampleType:exampleType];
    
    //NSLog(@"List View Location Coordinates: %@", self.locationCoordinate);
    
    //  Create search / results controller and push it to the navigation controller
    FTGooglePlacesAPIExampleResultsViewController *controller = [[FTGooglePlacesAPIExampleResultsViewController alloc] initWithGooglePlacesAPIRequest:request locationCoordinate:self.locationCoordinate];
    
    [self.navigationController pushViewController:controller animated:YES];
    
}


#pragma mark - Creating Google Places API requests objects

/**
 *  This method constructs request for each API example type
 *
 *  @param type Example type
 *
 *  @return Request object conforming to <FTGooglePlacesAPIRequest> protocol, which can be used in API service
 */
- (id<FTGooglePlacesAPIRequest>)googlePlacesAPIRequestForExampleType:(FTGooglePlacesAPIExampleType)type
{
    id<FTGooglePlacesAPIRequest> result;
    
    
    FTGooglePlacesAPINearbySearchRequest *request = [[FTGooglePlacesAPINearbySearchRequest alloc] initWithLocationCoordinate:self.locationCoordinate];
                request.keyword = @"restaurant";
                request.openNow = NO;
                request.radius = 1000;
    
                result = request;

    
    return result;
}

@end
