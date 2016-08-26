//
//  BusStop.m
//  SFUMobileApp
//
//  Created by Angela Lee on 2015-03-24.
//  Copyright (c) 2015 Marc Ho. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder

#import "BusStop.h"
#import "Transit.h"
#import "BusTimes.h"

@interface BusStop ()

@property (strong, nonatomic) NSString *selectedBusStop;

@end

@implementation BusStop

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILabel *busNumber = (UILabel *) [cell viewWithTag:1];
    
    NSLog(@" Index =  %ld", (long)indexPath.row);
    
    // Configure the cell...

    
    // display bus stops in each cell
    switch (indexPath.row) {
        
        case 0:
            busNumber.text = @"Production Way";
            //cell.textLabel.text = @"Production Way";
            break;
            
        case 1:
            busNumber.text = @"Upper Bus Loop";
            //cell.textLabel.text = @"Upper Bus Loop";
            break;
            
        case 2:
            busNumber.text = @"Nesters";
            //cell.textLabel.text = @"Nesters";
            break;
            
        case 3:
            busNumber.text = @"Science Road";
            //cell.textLabel.text = @"Science Road";
            break;
            
        case 4:
            busNumber.text = @"Lower Bus Loop North Bound";
            //cell.textLabel.text = @"Lower Bus Loop North Bound";
            break;

        case 5:
            busNumber.text = @"Lower Bus Loop South Bound";
            //cell.textLabel.text = @"Lower Bus Loop South Bound";
            break;
        case 6:
            busNumber.text = @"University Drive";
            //cell.textLabel.text = @"University Drive";
            break;
            
        default:
            break;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // display section name
    if (section == 0){
        return @"Bus Stops";
    }else{
            return @"";
    }
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@" Index: selected =  %ld", (long)indexPath.row);
    
    // store the bus stop the user selected
    switch (indexPath.row) {
        case 0:
            self.selectedBusStop = @"0";
            break;
        case 1:
            self.selectedBusStop = @"1";
            break;
        case 2:
            self.selectedBusStop = @"2";
            break;
        case 3:
            self.selectedBusStop = @"3";
            break;
        case 4:
            self.selectedBusStop = @"4";
            break;
        case 5:
            self.selectedBusStop = @"5";
            break;
        case 6:
            self.selectedBusStop = @"6";
            break;
            
        default:
            break;
    }
    [self performSegueWithIdentifier:@"goToTransit" sender:self]; // perform the segue
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
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"soup");
    if ([segue.identifier isEqualToString:@"goToTransit"]){
        
        Transit *transit = (Transit *)[segue destinationViewController];
        
//        transit.selectedBusStop = [[NSString alloc]init];
        
        transit.selectedBusStop = self.selectedBusStop;
        //[self performSegueWithIdentifier:@"goToTransit" sender:self];
    }
    
}


@end
