//
//  Maps.m
//  SFUMobileApp
//
//  Created by Marc Ho on 2015-03-16.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
#import "Maps.h"
#import "Locations.h"

@interface Maps ()

@end

@implementation Maps

@synthesize LocationArray;
@synthesize filteredLocationArray;

UIAlertView *unsuccessfulSearchAlertView;
NSString *mapSearchQuery;
NSString *mapSearchQueryFinal;
GMSMarker *testMarker;
CLLocation *searchResult;
NSDictionary *locationsDictionary;
int clickcounter = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    unsuccessfulSearchAlertView = [[UIAlertView alloc] initWithTitle:@"Bad News"
                                                             message:@"No elements were found, search unsuccessful"
                                                            delegate:self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil, nil];
    
    //Default location set to SFU when page loads
    [_mapView animateToLocation:CLLocationCoordinate2DMake(49.278087, -122.919862)];
    
    [_mapView animateToZoom:14];
    
    //Controls whether the My Location dot and accuracy circle is enabled.
    self.mapView.myLocationEnabled = YES;
    
    //Controls the type of map tiles that should be displayed.
    self.mapView.mapType = kGMSTypeNormal;
    
    //Shows the compass button on the map
    self.mapView.settings.compassButton = YES;
    
    //Shows the my location button on the map
    self.mapView.settings.myLocationButton = YES;
    
    //Sets the view controller to be the GMSMapView delegate
    self.mapView.delegate = self;
    
    self.searchBar.delegate = self;
    self.suggestionsTableView.delegate = self;
    
    _searchBar.showsCancelButton = YES;
    
    //Set dictionary values////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    CLLocation *SFU = [[CLLocation alloc] initWithLatitude:49.278087
                       
                                                 longitude:-122.919862];
    
    CLLocation *MaggieBenston = [[CLLocation alloc] initWithLatitude:49.279077
                                 
                                                           longitude:-122.919193];
    
    
    CLLocation *ASB = [[CLLocation alloc] initWithLatitude:49.277691
                       
                                                 longitude:-122.913877];
    
    CLLocation *AQ = [[CLLocation alloc] initWithLatitude:49.279416 longitude:-122.915771];
    
    CLLocation *ConvocationMall = [[CLLocation alloc] initWithLatitude:49.279280 longitude:-122.918946];
    
    CLLocation *Library = [[CLLocation alloc] initWithLatitude:49.279373 longitude:-122.918754];
    
    CLLocation *Theatre = [[CLLocation alloc] initWithLatitude:49.279311 longitude:-122.918490];
    
    CLLocation *Bookstore = [[CLLocation alloc] initWithLatitude:49.278941 longitude:-122.919247];
    
    CLLocation *CBuilding = [[CLLocation alloc] initWithLatitude:49.278048 longitude: -122.917707];
    
    CLLocation *BBuilding = [[CLLocation alloc] initWithLatitude:49.277926 longitude:-122.916932];
    
    CLLocation *PBuilding = [[CLLocation alloc] initWithLatitude:49.277860 longitude:-122.916111];
    
    CLLocation *KBuilding = [[CLLocation alloc] initWithLatitude:49.277521 longitude:-122.916210];
    
    CLLocation *ShrumScienceCentre = [[CLLocation alloc] initWithLatitude:49.278185 longitude: -122.916838];
    
    CLLocation *SouthScienceBuilding = [[CLLocation alloc] initWithLatitude:49.277279 longitude:-122.918004];
    
    CLLocation *TASC1 = [[CLLocation alloc] initWithLatitude:49.276796 longitude: -122.914520];
    
    CLLocation *TASC2 = [[CLLocation alloc] initWithLatitude:49.277521 longitude: -122.916210];
    
    CLLocation *IRMACS = [[CLLocation alloc] initWithLatitude:49.277223 longitude: -122.914324 ];
    
    CLLocation *StrandHallAnnex = [[CLLocation alloc] initWithLatitude:49.278294 longitude: -122.914246];
    
    CLLocation *StrandHall = [[CLLocation alloc] initWithLatitude:49.278878 longitude:-122.914517];
    
    CLLocation *LotE = [[CLLocation alloc] initWithLatitude:49.278759 longitude:-122.913508];
    
    CLLocation *RCB = [[CLLocation alloc] initWithLatitude:49.280033 longitude: -122.916885 ];
    
    CLLocation *EducationBuilding = [[CLLocation alloc] initWithLatitude:49.279631 longitude:-122.915654];
    
    CLLocation *DiamondAlumniCentre = [[CLLocation alloc] initWithLatitude:49.280990 longitude:-122.916614];
    
    CLLocation *LotC = [[CLLocation alloc] initWithLatitude:49.280070 longitude:-122.913192];
    
    CLLocation *SaywellHall = [[CLLocation alloc] initWithLatitude:49.279307 longitude: -122.914471];
    
    CLLocation *BlussonHall = [[CLLocation alloc] initWithLatitude:49.279087 longitude: -122.912864];
    
    CLLocation *BusLoop = [[CLLocation alloc] initWithLatitude:49.278618 longitude:-122.912738];
    
    CLLocation *TownSquare = [[CLLocation alloc] initWithLatitude:49.278051 longitude: -122.912703];
    
    CLLocation *Cornerstone = [[CLLocation alloc] initWithLatitude:49.277848 longitude:-122.911740];
    
    CLLocation *TheHub = [[CLLocation alloc] initWithLatitude:49.277649 longitude:-122.910085];
    
    CLLocation *LotB = [[CLLocation alloc] initWithLatitude:49.277156 longitude:-122.910619];
    
    CLLocation *SouthEastClassroom = [[CLLocation alloc] initWithLatitude:49.276978 longitude: -122.912553];
    
    CLLocation *Univercity = [[CLLocation alloc] initWithLatitude:49.278493 longitude:-122.911322];
    
    CLLocation *FacilitiesServices = [[CLLocation alloc] initWithLatitude:49.275786 longitude:-122.913028];
    CLLocation *LotD = [[CLLocation alloc] initWithLatitude:49.275870 longitude:-122.911413];
    CLLocation *Townhouse = [[CLLocation alloc] initWithLatitude:49.280093 longitude:-122.929757];
    CLLocation *Pauline = [[CLLocation alloc] initWithLatitude:49.280415 longitude:-122.927622];
    CLLocation *Barbara = [[CLLocation alloc] initWithLatitude:49.280264 longitude:-122.926614];
    CLLocation *Shadbolt = [[CLLocation alloc] initWithLatitude:49.280114 longitude:-122.925643];
    CLLocation *DiningHall = [[CLLocation alloc] initWithLatitude:49.279901 longitude:-122.924715];
    CLLocation *Hamilton = [[CLLocation alloc] initWithLatitude:49.280009 longitude:-122.927692];
    CLLocation *LouisRiel = [[CLLocation alloc] initWithLatitude:49.279656 longitude:-122.925627];
    CLLocation *McTaggart = [[CLLocation alloc] initWithLatitude:49.279208 longitude:-122.925418];
    CLLocation *Shell = [[CLLocation alloc] initWithLatitude: 49.279465 longitude: -122.924026];
    CLLocation *field4 = [[CLLocation alloc] initWithLatitude:49.279383 longitude:-122.927880];
    CLLocation *beediesoftball = [[CLLocation alloc] initWithLatitude:49.278791 longitude:-122.926276];
    CLLocation *field2 = [[CLLocation alloc] initWithLatitude:49.278459 longitude:-122.924736];
    CLLocation *terryfox = [[CLLocation alloc] initWithLatitude:49.278588 longitude:-122.922322];
    CLLocation *lornedavies = [[CLLocation alloc] initWithLatitude:49.279428 longitude:-122.922317];
    CLLocation *WMC =[[CLLocation alloc] initWithLatitude: 49.279820 longitude:-122.922194];
    CLLocation *tennisnorth =[[CLLocation alloc] initWithLatitude: 49.280055 longitude: -122.921711];
    CLLocation *tennissouth =[[CLLocation alloc] initWithLatitude: 49.277876 longitude: -122.923178];
    CLLocation *childcare =[[CLLocation alloc] initWithLatitude: 49.280741 longitude: -122.924774];
    CLLocation *Madge =[[CLLocation alloc] initWithLatitude: 49.280386 longitude: -122.923200];
    CLLocation *VN =[[CLLocation alloc] initWithLatitude: 49.280634 longitude: -122.921596];
    CLLocation *visitor =[[CLLocation alloc] initWithLatitude: 49.280001 longitude: -122.923457];
    
    CLLocation *Discovery1 =[[CLLocation alloc] initWithLatitude: 49.274419 longitude: -122.912494];
    CLLocation *Discovery2 =[[CLLocation alloc] initWithLatitude: 49.273705 longitude: -122.912239];
    CLLocation *Herbert =[[CLLocation alloc] initWithLatitude: 29.979076 longitude: 31.134154];
    CLLocation *Watertower =[[CLLocation alloc] initWithLatitude: 49.279529 longitude: -122.907971];
    CLLocation *halpern =[[CLLocation alloc] initWithLatitude: 49.279604 longitude: -122.917642];
    CLLocation *Campussecurity =[[CLLocation alloc] initWithLatitude: 49.279213 longitude: -122.920395];
    CLLocation *Residenceb =[[CLLocation alloc] initWithLatitude: 49.280088 longitude: -122.925660];
    CLLocation *TransportationCentre =[[CLLocation alloc] initWithLatitude: 49.279521 longitude: -122.920277];
    CLLocation *timhortons =[[CLLocation alloc] initWithLatitude: 49.280056 longitude: -122.921692];
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    ///////Locations dictionary initialization//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    locationsDictionary  = @{
                             
                             @"sfu": SFU,
                             
                             @"maggiebenston": MaggieBenston,
                             
                             @"maggiebenstoncentre": MaggieBenston,
                             
                             @"bookstore": Bookstore,
                             
                             @"convocationmall":ConvocationMall,
                             
                             @"sfutheatre":Theatre,
                             
                             @"theatre":Theatre,
                             
                             @"w.a.cbennetlibrary":Library,
                             
                             @"simonfraseruniversity": SFU,
                             
                             @"asb": ASB,
                             
                             @"appliedsciencebuilding": ASB,
                             
                             @"aq": AQ,
                             
                             @"academicquadrangle": AQ,
                             
                             @"library": Library,
                             
                             @"cbuilding": CBuilding,
                             
                             @"bbuilding": BBuilding,
                             
                             @"pbuilding": PBuilding,
                             
                             @"kbuilding": KBuilding,
                             
                             @"shrumsciencecentre":ShrumScienceCentre,
                             
                             @"southsciencesbuilding":SouthScienceBuilding,
                             
                             @"technology&sciencecomplex2":TASC2,
                             
                             @"tasc2":TASC2,
                             
                             @"technology&sciencecomplex":TASC1,
                             
                             @"tasc1":TASC1,
                             
                             @"tasc":TASC1,
                             
                             @"irmacs":IRMACS,
                             
                             @"strandhallannex":StrandHallAnnex,
                             
                             @"strandhall":StrandHall,
                             
                             @"lote":LotE,
                             
                             @"robertcbrownhall":RCB,
                             
                             @"rcb":RCB,
                             
                             @"educationbuilding":EducationBuilding,
                             
                             @"diamonalumnicentre":DiamondAlumniCentre,
                             
                             @"lotc":LotC,
                             
                             @"saywellhall":SaywellHall,
                             
                             @"blussonhall":BlussonHall,
                             
                             @"busloop":BusLoop,
                             
                             @"townsquare":TownSquare,
                             @"townhouse":Townhouse,
                             @"cornerstone":Cornerstone,
                             
                             @"thehub":TheHub,
                             
                             @"lotb":LotB,
                             
                             @"southeastclassroom":SouthEastClassroom,
                             
                             @"univercity":Univercity,
                             
                             @"facilitiesservices":FacilitiesServices,
                             
                             @"lotd":LotD,
                             @"westmallcentre": WMC,
                             @"wmc": WMC,
                             @"library": Library,
                             @"paulinejewetthouse": Pauline,
                             @"barbararaehouse": Barbara,
                             @"shadbolthouse": Shadbolt,
                             @"dininghall": DiningHall,
                             @"hamiltonhallresidence": Hamilton,
                             @"louisrielresidence": LouisRiel,
                             @"mctaggartcowanresidence": McTaggart,
                             @"field4": field4,
                             @"beediesoftballfield": beediesoftball,
                             @"field2": field2,
                             @"terryfoxfield": terryfox,
                             @"lornedaviescomplex": lornedavies,
                             @"tenniscourtsnorth": tennisnorth,
                             @"tenniscourtssouth": tennissouth,
                             @"childcarecentre": childcare,
                             @"madgehogarthhouse": Madge,
                             @"shellhouseresidence": Shell,
                             @"vnlot": VN,
                             @"visitorparkade": visitor,
                             ///formal name section
                             
                             @"aqacademicquadrangle": AQ,
                             @"asbappliedsciencebuilding":ASB,
                             @"blublussonhall":BlussonHall,
                             @"busloop":BusLoop,
                             @"cbcornerstonebuilding":Cornerstone,
                             @"cccchildcarecentre":childcare,
                             @"cscampussecurity":Campussecurity,
                             @"dacdiamondalumnicentre":DiamondAlumniCentre,
                             @"dhdininghall":DiningHall,
                             @"dis1discovery1":Discovery1,
                             @"dis2discovery2":Discovery2,
                             @"edbeducationbuilding":EducationBuilding,
                             @"fsfacilitiesservices":FacilitiesServices,
                             @"hbthehub":TheHub,
                             @"hchalperncentre":halpern,
                             @"herbert'soffice":Herbert,
                             @"ldclornedaviscomplex":lornedavies,
                             @"libw.a.cbennetlibrary":Library,
                             @"mbcmaggiebenstoncentre":MaggieBenston,
                             @"rcbrobertc.brownhall":RCB,
                             @"rbbresidencebuildingb":Residenceb,
                             @"shstrandhall":StrandHall,
                             @"shastrandhallannex":StrandHallAnnex,
                             @"shrshellhouseresidence":Shell,
                             @"ssbsouthsciencesbuilding":SouthScienceBuilding,
                             @"scbshrumsciencecentreb":BBuilding,
                             @"sccshrumsciencecentrec":CBuilding,
                             @"sckshrumsciencecentrek":KBuilding,
                             @"scpshrumsciencecentrep":PBuilding,
                             @"scpsoutheastclassroomblock":SouthEastClassroom,
                             @"sfu":SFU,
                             @"swhsaywellhall":SaywellHall,
                             @"tasc1technology&sciencecomplex1":TASC1,
                             @"tasc2technology&sciencecomplex2":TASC2,
                             @"tctransportationcentre":TransportationCentre,
                             @"thsfutheatre":Theatre,
                             @"timhortons":timhortons,
                             @"wmcwestmallcentre":WMC,
                             @"wtbwatertowerbuilding":Watertower
                        
                             
                             
                             
                             
                             
                             };
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    testMarker = [[GMSMarker alloc] init];
    NSLog(@"did load%@",_qrScanQuery);
    
	/// search suggestions array
    LocationArray = [NSArray arrayWithObjects:
                     [Locations LocationOfCategory:@"Building" name:@"AQ Academic Quadrangle" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"ASB Applied Science Building" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"BLU Blusson Hall" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"Bus Loop" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"CB Cornerstone Building" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"CCC Childcare Centre" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"CS Campus Security" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"DAC Diamond Alumni Centre" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"DH Dining Hall" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"DIS1 Discovery 1" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"DIS2 Discovery 2" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"EDB Education Building" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"FS Facilities Services" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"HB The Hub" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"HC Halpern Centre" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Recreation" name:@"Herbert's Office" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Food" name:@"LDC Lorne Davis Complex" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"LIB W.A.C Bennett Library" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"MBC Maggie Benston Centre" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"RCB Robert C. Brown Hall" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"RBB Residence Building B" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"SH Strand Hall" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"SHA Strand Hall Annex" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"SHR Shell House Residence" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"SSB South Sciences Building" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"SCB Shrum Science Centre B" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"SCC Shrum Science Centre C" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"SCK Shrum Science Centre K" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"SCP Shrum Science Centre P" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"SCP South East Classroom Block" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"SWH Saywell Hall" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"TASC1 Technology & Science Complex 1" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"TASC2 Technology & Science Complex 2" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"TC Transportation Centre" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"TH SFU Theatre" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Food" name:@"Tim Hortons" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"WMC West Mall Centre" coordinates:@"soup"],
                     [Locations LocationOfCategory:@"Building" name:@"WTB Water Tower Building" coordinates:@"soup"],
                     nil];
    
    self.filteredLocationArray = [NSMutableArray arrayWithCapacity:[LocationArray count]];
    
    // Reload the table
    [self.suggestionsTableView reloadData];
    
}

-(void)viewDidAppear:(BOOL)animated{

    NSLog(@"did appear %@",_qrScanQuery);
    if(_qrScanQuery != nil){
        mapSearchQuery = _qrScanQuery;
        mapSearchQueryFinal = _qrScanQuery;
        _searchBar.text = mapSearchQueryFinal;
        _qrScanQuery = nil;
        //[_searchBar becomeFirstResponder];
        [self performSearchWithString:mapSearchQueryFinal];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    //mapSearchQuery = _searchBar.text;
    [self.mapView setHidden:YES];
    [self.suggestionsTableView setHidden:NO];
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSLog(@"searchbar did begin editing%@",mapSearchQuery);
    _searchBar.text = nil;
    _searchBar.text = mapSearchQueryFinal;
    [self.searchDisplayController setActive:YES];
    [_suggestionsTableView setUserInteractionEnabled:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    mapSearchQuery = _searchBar.text;
    NSLog(@"text did change%@",mapSearchQuery);
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    mapSearchQueryFinal = _searchBar.text;
    
    if ([mapSearchQueryFinal isEqualToString:@""]) {
        testMarker.opacity=0;
    }
    
    NSLog(@"search bar did end editing, QRSCAN:%@ MapSearchQueryFinal:%@",_qrScanQuery,mapSearchQuery);
    
    [self.mapView setHidden:NO];
    [self.suggestionsTableView setHidden:YES];
    
    /*
     searchResult = locationsDictionary[mapSearchQueryFinal];
     
     if (searchResult != nil){
     testMarker.position = searchResult.coordinate;
     testMarker.map = _mapView;
     testMarker.opacity = 1;
     [_mapView animateToLocation:searchResult.coordinate];}
     */
    /*else{
     [unsuccessfulSearchAlertView show];
     }*/
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [_mapView becomeFirstResponder];
    [self.suggestionsTableView setHidden:YES];
    //[searchBar setText:nil];
    //searchRequested = YES;
    [self.searchDisplayController setActive:NO];
    [searchBar setText:mapSearchQueryFinal];
    searchBar.showsCancelButton = YES;
    // Do the search...
    [self performSearchWithString:mapSearchQueryFinal];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [searchBar resignFirstResponder];
    testMarker.opacity = 0;
    searchBar.text = nil;
    mapSearchQueryFinal = nil;
    searchBar.showsCancelButton = NO;
    [self.searchDisplayController setActive:NO];
    [self.suggestionsTableView setHidden:YES];
    [self.mapView setHidden:NO];
    
    NSLog(@"cancel clicked");
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([_searchBar isFirstResponder] && [touch view] != _searchBar)
    {
        [_searchBar resignFirstResponder];
        [_mapView setUserInteractionEnabled:YES];
        
    }
    [super touchesBegan:touches withEvent:event];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([[segue identifier] isEqualToString:@"QR"]) {
        QRController *controller = [segue destinationViewController];
        if ([controller isKindOfClass:[QRController class]])
        {
            QRController *QRcontroller = controller;
            QRcontroller.delegate = self;
        }
    }
}

-(void)setString:(NSString *)string{
    _qrScanQuery=string;
    _searchBar.text = _qrScanQuery;
    NSLog(@"the string set is %@",_qrScanQuery);
    NSLog(@"the string on the searchbar is %@",_searchBar.text);
    
    //_qrScanQuery = nil;
}

-(void)viewWillDisappear:(BOOL)animated{
   // _searchBar.text=@"";
    NSLog(@"map will disappear");
    //[self.searchDisplayController setActive:NO];
 
    //[self.searchBar resignFirstResponder];
    //testMarker.opacity = 0;
    //_searchBar.text = nil;
    mapSearchQueryFinal = nil;
    //_searchBar.showsCancelButton = NO;
  
    //[self.suggestionsTableView setHidden:YES];
    //[self.mapView setHidden:NO];
    
  
    
    self.view.layer.shouldRasterize = YES;
    self.view.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

//table view section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //if (searchRequested == NO){
    // Check to see whether the normal table or search results table is being displayed and return the count from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [filteredLocationArray count];
    } else {
        return [LocationArray count];
    }
    //  }
    //return (0);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Create a new Candy Object
    Locations *location = nil;
    
    // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        location = [filteredLocationArray objectAtIndex:indexPath.row];
    } else {
        location = [LocationArray objectAtIndex:indexPath.row];
    }
    
    // Configure the cell
    cell.textLabel.text = location.name;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredLocationArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    filteredLocationArray = [NSMutableArray arrayWithArray:[LocationArray filteredArrayUsingPredicate:predicate]];
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
    
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return NO;
}
////segue
#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Perform segue to candy detail
    
    //[self performSegueWithIdentifier:@"LocationDetail" sender:tableView];
    
    if(tableView == self.searchDisplayController.searchResultsTableView) {
        NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
        NSString *destinationTitle = [[filteredLocationArray objectAtIndex:[indexPath row]] name];
        mapSearchQueryFinal = destinationTitle;
        
    }
    else {
        NSIndexPath *indexPath = [self.suggestionsTableView indexPathForSelectedRow];
        NSString *destinationTitle = [[LocationArray objectAtIndex:[indexPath row]] name];
        mapSearchQueryFinal = destinationTitle;
        
    }
    [self.suggestionsTableView resignFirstResponder];
    [self.searchBar becomeFirstResponder];
    [self.suggestionsTableView setHidden:YES];
    _searchBar.text = mapSearchQueryFinal;
    [self performSearchWithString:mapSearchQueryFinal];
    
    [self.searchBar resignFirstResponder];
    [_mapView becomeFirstResponder];
    
    [self.searchDisplayController setActive:NO];
    [self.searchBar setText:mapSearchQueryFinal];
    _searchBar.showsCancelButton = YES;
}


-(void)performSearchWithString:(NSString *)string{
    
    
    
    [self.mapView setHidden:NO];
    [self.suggestionsTableView setHidden:YES];
    NSLog(@"perform search called with %@",string);
    
//perform a search with a string by removing the empty spaces and uppercase characters
    NSString *unformatedString;
    NSString *unformatedStringNoSpaces;
    unformatedString = [string lowercaseString];
    unformatedStringNoSpaces = [unformatedString stringByReplacingOccurrencesOfString:@" " withString:@""];
    unformatedString = [unformatedString lowercaseString];
    NSLog(@"unformated string is:%@", unformatedString);
    NSLog(@"unformatedNoSpace string is:%@", unformatedStringNoSpaces);
    searchResult = locationsDictionary[unformatedStringNoSpaces];
    
///on succesfull search place marker and zoom to position, else show unsuccessful search alert
    if (searchResult != nil){
        testMarker.position = searchResult.coordinate;
        testMarker.map = _mapView;
        testMarker.opacity = 1;
        _searchBar.text = mapSearchQueryFinal;
        [_mapView animateToLocation:searchResult.coordinate];
        [_mapView animateToZoom:17];}
    else{
        [unsuccessfulSearchAlertView show];
    
    }
    return;
}


@end
