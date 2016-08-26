//
//  Transit.m
//  SFUMobileApp
//
//  Created by Angela Lee on 2015-03-21.
//  Copyright (c) 2015 Derma Solutions. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//

#import "BusStop.h"
#import "Transit.h"
#import "BusTimes.h"

@interface Transit ()

//@property (strong, nonatomic) NSMutableArray *selectedBusStop;

@property (strong, nonatomic) NSMutableData *receiveData;
@property (strong, nonatomic) NSString *elementTag;
@property (strong, nonatomic) NSString *routeNo;

@property (strong, nonatomic) NSMutableArray *OneThirtyFive;
@property (strong, nonatomic) NSMutableArray *OneFourtyThree;
@property (strong, nonatomic) NSMutableArray *OneFourtyFour;
@property (strong, nonatomic) NSMutableArray *OneFourtyFive;


@property (strong, nonatomic) NSMutableArray *OneThirtyFive_CountDown;
@property (strong, nonatomic) NSMutableArray *OneFourtyThree_CountDown;
@property (strong, nonatomic) NSMutableArray *OneFourtyFour_CountDown;
@property (strong, nonatomic) NSMutableArray *OneFourtyFive_CountDown;

@property (strong, nonatomic) NSString *selectedRouteNo;

@end

@implementation Transit



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    self.OneThirtyFive = [[NSMutableArray alloc] init];
//    self.OneFourtyThree = [[NSMutableArray alloc] init];
//    self.OneFourtyFour = [[NSMutableArray alloc] init];
//    self.OneFourtyFive = [[NSMutableArray alloc] init];
//
//    self.OneThirtyFive_CountDown = [[NSMutableArray alloc] init];
//    self.OneFourtyThree_CountDown = [[NSMutableArray alloc] init];
//    self.OneFourtyFour_CountDown = [[NSMutableArray alloc] init];
//    self.OneFourtyFive_CountDown = [[NSMutableArray alloc] init];
    
    
    
    if ([self.selectedBusStop isEqualToString: @"0"]) { // Production Way
        
        self.OneFourtyFive = [[NSMutableArray alloc] init];
        self.OneFourtyFive_CountDown = [[NSMutableArray alloc] init];
        
        [self callAPIWithURL:@"http://api.translink.ca/rttiapi/v1/stops/59314/estimates?apikey=q1HyKkwRb5u8BgAsnrAn&count=10"];
    }
    else if ([self.selectedBusStop isEqualToString: @"1"]){ // Upper Bus Loop
        
        self.OneThirtyFive = [[NSMutableArray alloc] init];
        self.OneFourtyThree = [[NSMutableArray alloc] init];
        self.OneFourtyFour = [[NSMutableArray alloc] init];
        self.OneFourtyFive = [[NSMutableArray alloc] init];
        
        self.OneThirtyFive_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyThree_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyFour_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyFive_CountDown = [[NSMutableArray alloc] init];
        
        [self callAPIWithURL:@"http://api.translink.ca/rttiapi/v1/stops/52807/estimates?apikey=q1HyKkwRb5u8BgAsnrAn&count=10"]; // 135
        [self callAPIWithURL:@"http://api.translink.ca/rttiapi/v1/stops/52998/estimates?apikey=q1HyKkwRb5u8BgAsnrAn&count=10"]; // 143
        [self callAPIWithURL:@"http://api.translink.ca/rttiapi/v1/stops/52157/estimates?apikey=q1HyKkwRb5u8BgAsnrAn&count=10"]; // 144
        [self callAPIWithURL:@"http://api.translink.ca/rttiapi/v1/stops/53096/estimates?apikey=q1HyKkwRb5u8BgAsnrAn&count=10"]; // 145
    }
    else if ([self.selectedBusStop isEqualToString: @"2"]){ // Nesters
        
        self.OneThirtyFive = [[NSMutableArray alloc] init];
        self.OneFourtyThree = [[NSMutableArray alloc] init];
        self.OneFourtyFour = [[NSMutableArray alloc] init];
        self.OneFourtyFive = [[NSMutableArray alloc] init];
        
        self.OneThirtyFive_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyThree_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyFour_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyFive_CountDown = [[NSMutableArray alloc] init];
        
        [self callAPIWithURL:@"http://api.translink.ca/rttiapi/v1/stops/59044/estimates?apikey=q1HyKkwRb5u8BgAsnrAn&count=10"];
    }
    else if ([self.selectedBusStop isEqualToString: @"3"]){ // Science Road
        
        self.OneThirtyFive = [[NSMutableArray alloc] init];
        self.OneFourtyThree = [[NSMutableArray alloc] init];
        self.OneFourtyFour = [[NSMutableArray alloc] init];
        self.OneFourtyFive = [[NSMutableArray alloc] init];
        
        self.OneThirtyFive_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyThree_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyFour_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyFive_CountDown = [[NSMutableArray alloc] init];
        
        [self callAPIWithURL:@"http://api.translink.ca/rttiapi/v1/stops/51862/estimates?apikey=q1HyKkwRb5u8BgAsnrAn&count=10"];
    }
    else if ([self.selectedBusStop isEqualToString: @"4"]){ // Lower Bus Loop North Bound
        
        self.OneThirtyFive = [[NSMutableArray alloc] init];
        self.OneFourtyThree = [[NSMutableArray alloc] init];
        self.OneFourtyFour = [[NSMutableArray alloc] init];
        self.OneFourtyFive = [[NSMutableArray alloc] init];
        
        self.OneThirtyFive_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyThree_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyFour_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyFive_CountDown = [[NSMutableArray alloc] init];
        
        [self callAPIWithURL:@"http://api.translink.ca/rttiapi/v1/stops/51806/estimates?apikey=q1HyKkwRb5u8BgAsnrAn&count=10"]; // SFU TRANSPORTATION CENTRE BAY 2
        [self callAPIWithURL:@"http://api.translink.ca/rttiapi/v1/stops/51860/estimates?apikey=q1HyKkwRb5u8BgAsnrAn&count=10"]; // SFU TRANSPORTATION CENTRE BAY 3
    }
    else if ([self.selectedBusStop isEqualToString: @"5"]){ // Lower Bus Loop South Bound
        
        self.OneThirtyFive = [[NSMutableArray alloc] init];
        self.OneFourtyThree = [[NSMutableArray alloc] init];
        self.OneFourtyFour = [[NSMutableArray alloc] init];
        self.OneFourtyFive = [[NSMutableArray alloc] init];
        
        self.OneThirtyFive_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyThree_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyFour_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyFive_CountDown = [[NSMutableArray alloc] init];
        
        [self callAPIWithURL:@"http://api.translink.ca/rttiapi/v1/stops/51863/estimates?apikey=q1HyKkwRb5u8BgAsnrAn&count=10"];
    }
    else if ([self.selectedBusStop isEqualToString: @"6"]){ // University Drive
        
        self.OneThirtyFive = [[NSMutableArray alloc] init];
        self.OneFourtyThree = [[NSMutableArray alloc] init];
        self.OneFourtyFour = [[NSMutableArray alloc] init];
        self.OneFourtyFive = [[NSMutableArray alloc] init];
        
        self.OneThirtyFive_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyThree_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyFour_CountDown = [[NSMutableArray alloc] init];
        self.OneFourtyFive_CountDown = [[NSMutableArray alloc] init];
        
        [self callAPIWithURL:@"http://api.translink.ca/rttiapi/v1/stops/51864/estimates?apikey=q1HyKkwRb5u8BgAsnrAn&count=10"];
    }
    
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([self.selectedBusStop isEqualToString: @"0"]) {
        return 1;
    }
    // Return the number of rows in the section.
    return 4;
}

# pragma mark - API 
- (void) callAPIWithURL: (NSString *)urlString{
    
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPShouldHandleCookies:NO];
    //request.setHTTPShouldHandleCookies(NO);
    
    
    [request setValue:@"Agent name goes here" forHTTPHeaderField:@"User-Agent"];
    [NSURLConnection connectionWithRequest:request delegate:self]; // request url
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    
    self.receiveData = [[NSMutableData alloc] init];
    NSLog(@"in 1");
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    NSLog(@"in 2");
    //receiveData.appendData(data);
    [self.receiveData appendData:data];
    
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    NSLog(@"in 3");
    
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"in 4");
    
    
    NSLog(@"data is: %@", self.receiveData);
    
    
    
    NSXMLParser *parser = [[NSXMLParser alloc]initWithData:self.receiveData];
    
    [parser setDelegate:self]; // after you declare the parser, call this before you use the parser
    //parser.parse()
    BOOL success = [parser parse];
    
    
    if(success){
        NSLog(@"No Errors");
    }
    else{
        NSLog(@"Error Error Error!!!");
    }
    
    
    //    for (int i =0; i<[somelist count]; i++){
    //        NSString *string = [somelist objectAtIndex:i];
    //        NSLog(@"string is: %@", string);
    //    }
    //
    //    for (NSString *string in listOfStrings){
    //        NSLog("string is: %@", string);
    //    }
    
}


#pragma mark NSXML Delegates

- (void) parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"parserDidStartDocument");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    
    self.elementTag = elementName;
    NSLog(@"didStartElement --> %@", elementName);
}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
//    NSLog(@"---------------------------------------------------------------------------------------------------------------------------");
//    NSLog(@"size of 145 in transit.m array is: %lu:",(unsigned long)[self.OneFourtyFive_CountDown count]);
    
    if ([self.elementTag isEqualToString:
         @"RouteNo"]){
        self.routeNo = string;
    }
    
    if ([self.routeNo isEqualToString: @"135"]) {
        
        if ([self.elementTag isEqualToString:
             @"ExpectedCountdown"]){
            [self.OneThirtyFive_CountDown addObject: string];
        }
        
        
        if([self.elementTag isEqualToString:@"ExpectedLeaveTime"]){
            [self.OneThirtyFive addObject:string];
        }
    }
    
    if ([self.routeNo isEqualToString: @"143"]) {
        
        if ([self.elementTag isEqualToString:
             @"ExpectedCountdown"]){
            [self.OneFourtyThree_CountDown addObject: string];
        }
        
        if([self.elementTag isEqualToString:@"ExpectedLeaveTime"]){
            [self.OneFourtyThree addObject:string];
        }
    }
    
    if ([self.routeNo isEqualToString: @"144"]) {
        
        if ([self.elementTag isEqualToString:
             @"ExpectedCountdown"]){
            [self.OneFourtyFour_CountDown addObject: string];
        }
        
        if([self.elementTag isEqualToString:@"ExpectedLeaveTime"]){
            [self.OneFourtyFour addObject:string];
        }
    }
    
    if ([self.routeNo isEqualToString: @"145"]) {
        
        if ([self.elementTag isEqualToString:
             @"ExpectedCountdown"]){
            [self.OneFourtyFive_CountDown addObject: string];
        }
        
        if([self.elementTag isEqualToString:@"ExpectedLeaveTime"]){
            [self.OneFourtyFive addObject:string];
        }
    }
    
    
    
    NSLog(@"foundCharacters --> %@", string);
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    //NSLog(@"didEndElement   --> %@", elementName);
}

- (void) parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"parserDidEndDocument");
    
    NSLog(@"the 145 is coming in %@ mins", self.OneFourtyFive_CountDown);
    [self.tableView reloadData];
    
    
}

# pragma mark - Table View


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILabel *busNumber = (UILabel *) [cell viewWithTag:1];
    UILabel *first = (UILabel *) [cell viewWithTag:2];
    UILabel *second = (UILabel *) [cell viewWithTag:3];
    UILabel *third = (UILabel *) [cell viewWithTag:4];
    
    first.text = nil;
    second.text = nil;
    third.text = nil;
    
//    busNumber = [(UILabel *) [cell viewWithTag:1]init];
//    first = [(UILabel *) [cell viewWithTag:2]init];
//    second = [(UILabel *) [cell viewWithTag:3]init];
//    third = [(UILabel *) [cell viewWithTag:4]init];
    
    if ([self.selectedBusStop isEqualToString: @"0"]) {
        busNumber.text = @"145";
        NSLog(@"Cell 4 reads:%@", busNumber.text);
        for (int i =0; i<[self.OneFourtyFive_CountDown count]; i++){
            
            NSString *countD = [self.OneFourtyFive_CountDown objectAtIndex:i];
            
            switch (i) {
                   
                case 0:
                    first.text = [NSString stringWithFormat:@"%@ mins", countD];
                    break;
                case 1:
                    second.text = [NSString stringWithFormat:@"%@ mins", countD];
                    break;
                case 2:
                    third.text = [NSString stringWithFormat:@"%@ mins", countD];
                    break;
                default:
                    break;
            }
        }
        return cell;
    }
    
    // Configure the cell...
    
    switch (indexPath.row) {
        case 0:
            busNumber.text = @"135";
            NSLog(@"Cell 1 reads:%@", busNumber.text);
            
            //cell.textLabel.text = @"135";
            //cell.detailTextLabel.text = self.OneThirtyFive_CountDown;
            
            for (int i =0; i<[self.OneThirtyFive_CountDown count]; i++){
                
                NSString *countD = [self.OneThirtyFive_CountDown objectAtIndex:i];
                
                switch (i) {
                    case 0:
                        first.text = [NSString stringWithFormat:@"%@ mins", countD];
                        break;
                    case 1:
                        second.text = [NSString stringWithFormat:@"%@ mins", countD];
                        break;
                    case 2:
                        third.text = [NSString stringWithFormat:@"%@ mins", countD];
                        break;
                    default:
                        break;
                }
            }
            
            break;
            
        case 1:
            busNumber.text = @"143";
             NSLog(@"Cell 2 reads:%@", busNumber.text);
            //cell.textLabel.text = @"143";
            //cell.detailTextLabel.text = self.OneFourtyThree_CountDown;
            
            for (int i =0; i<[self.OneFourtyThree_CountDown count]; i++){
                
                NSString *countD = [self.OneFourtyThree_CountDown objectAtIndex:i];
                
                switch (i) {
                    case 0:
                        first.text = [NSString stringWithFormat:@"%@ mins", countD];
                        break;
                    case 1:
                        second.text = [NSString stringWithFormat:@"%@ mins", countD];
                        break;
                    case 2:
                        third.text = [NSString stringWithFormat:@"%@ mins", countD];
                        break;
                    default:
                        break;
                }
            }
            
            break;
            
        case 2:
           busNumber.text = @"144";
            NSLog(@"Cell 3 reads:%@", busNumber.text);
            //cell.textLabel.text = @"144";
            //cell.detailTextLabel.text = self.OneFourtyFour_CountDown;
            for (int i =0; i<[self.OneFourtyFour_CountDown count]; i++){
                
                NSString *countD = [self.OneFourtyFour_CountDown objectAtIndex:i];
                
                switch (i) {
                    case 0:
                        first.text = [NSString stringWithFormat:@"%@ mins", countD];
                        break;
                    case 1:
                        second.text = [NSString stringWithFormat:@"%@ mins", countD];
                        break;
                    case 2:
                        third.text = [NSString stringWithFormat:@"%@ mins", countD];
                        break;
                    default:
                        break;
                }
            }
                      break;
            
        case 3:
            busNumber.text = @"145";
            NSLog(@"Cell 4 reads:%@", busNumber.text);
            //cell.textLabel.text = @"145";
            
            
            //            if ([self.OneFourtyFive_CountDown count] > 0){
            //
            //
            //
            //                NSMutableString *countDown = [[NSMutableString alloc]init];
            
            for (int i =0; i<[self.OneFourtyFive_CountDown count]; i++){
                
                NSString *countD = [self.OneFourtyFive_CountDown objectAtIndex:i];
                
                switch (i) {
                    case 0:
                        first.text = [NSString stringWithFormat:@"%@ mins", countD];
                        break;
                    case 1:
                        second.text = [NSString stringWithFormat:@"%@ mins", countD];
                        break;
                    case 2:
                        third.text = [NSString stringWithFormat:@"%@ mins", countD];
                        break;
                    default:
                        break;
                }
                //
                //                    [countDown appendString:countD];
                //
                //
                //                    if (i != [self.OneFourtyFive_CountDown count]-1){
                //                        [countDown appendString:@", "];
                //                    }
                //
                //                    NSLog(@"countD is: %@", countD);
               
            }
             break;
            //                NSLog(@"countDown is: %@", countDown);
            //                [countDown appendString:@" min"];
            //                cell.detailTextLabel.text = countDown;
            //
            //            }else{
            //                cell.detailTextLabel.text = @"NOTHING";
            //            }
        
        default:
            
            break;
    }

    
    
    
    return cell;
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 0){
        return @"Bus Numbers";
    }else{
        return @"";
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.selectedBusStop isEqualToString: @"0"]) {
        self.selectedRouteNo = @"145";
    }
    else{
        switch (indexPath.row) {
            case 0:
                self.selectedRouteNo = @"135";
                break;
            case 1:
                self.selectedRouteNo = @"143";
                break;
            case 2:
                self.selectedRouteNo = @"144";
                break;
            case 3:
                self.selectedRouteNo = @"145";
                break;
                
            default:
                break;
        }
    }
    [self performSegueWithIdentifier:@"goToBusTimes" sender:self]; // ???
    
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //if (self.OneThirtyFive || self.OneFourtyThree || self.OneFourtyFour || self.OneFourtyFive) {
    if ([segue.identifier isEqualToString:@"goToBusTimes"]){
        
        BusTimes *busTimes = (BusTimes *)[segue destinationViewController];
        
        if ([self.selectedRouteNo isEqualToString: @"135"] && [self.OneThirtyFive count] > 0) {
            busTimes.schedule = [[NSMutableArray alloc]init];
            busTimes.schedule = self.OneThirtyFive;
        }
        else if ([self.selectedRouteNo isEqualToString: @"143"] && [self.OneFourtyThree count] > 0) {
            busTimes.schedule = [[NSMutableArray alloc]init];
            busTimes.schedule = self.OneFourtyThree;
        }
        else if ([self.selectedRouteNo isEqualToString: @"144"] && [self.OneFourtyFour count] > 0) {
            busTimes.schedule = [[NSMutableArray alloc]init];
            busTimes.schedule = self.OneFourtyFour;
        }
        else if ([self.selectedRouteNo isEqualToString: @"145"] && [self.OneFourtyFive count] > 0) {
            busTimes.schedule = [[NSMutableArray alloc]init];
            busTimes.schedule = self.OneFourtyFive;
        }
        
        
        busTimes.routeNo = self.selectedRouteNo;
        
        //Check the route No to determine which array to pass
        
        NSLog(@"size of 135 in transit.m array is: %lu:",(unsigned long)[self.OneThirtyFive count]);
        NSLog(@"size of 143 in transit.m array is: %lu:",(unsigned long)[self.OneFourtyThree count]);
        NSLog(@"size of 144 in transit.m array is: %lu:",(unsigned long)[self.OneFourtyFour count]);
        NSLog(@"size of 145 in transit.m array is: %lu:",(unsigned long)[self.OneFourtyFive count]);
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //}
}


@end
