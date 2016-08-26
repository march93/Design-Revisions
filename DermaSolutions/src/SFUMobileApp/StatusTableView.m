//
//  StatusTableView.m
//  SFUStatus
//
//  Created Daphne Chiang on 2015-03-14.
//  Copyright (c) 2015 Derma Solution. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//

#import "StatusTableView.h"
#import "TFHpple.h"
#import "Tutorial.h"
#import "StatusCell.h"
#import "StatusViewController.h"
#import "AppDelegate.h"

@interface StatusTableView ()

@end

@implementation StatusTableView

-(void)loadTutorials {
    
    // 1
    NSURL *tutorialsUrl = [NSURL URLWithString:@"http://www.sfu.ca/security/sfuroadconditions/"];
    
    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    
    // 2
    TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
    
    // 3
    //A dictionary store paths of different information
    _Path = @{
      @"Burnaby Campus" : @"//div[@class='campus-status normal']/h1",
      @"Surrey Campus" : @"//div[@class='status-container half first']/a/div[@class='campus-status normal other-campuses']/h3",
      @"Vancouver Campus" : @"//div[@class= 'status-container half last']/a/div[@class='campus-status normal other-campuses']/h3",
      @"Burnaby Roads" : @"//div[@class='status-title first']/h3/span",
      @"Burnaby Adjacent Roads" : @"//div[@class='extra-weather-conditions last']/ul/li[1]/span",
      @"Burnaby Classes and Exams" : @"//div[@class='extra-weather-conditions last']/ul/li[2]/span",
      @"Burnaby Translink Buses" : @"//div[@class='extra-weather-conditions last']/ul/li[3]/span",
      @"Surrey Classes and Exams" : @"//div[@class='status-container half first']/p/span/strong",
      @"Vancouver Classes and Exams" : @"//div[@class='status-container half last']/p/span/strong",
      @"Announcements" : @"//section[@class='announcements']",
      @"University Drive North" : @"//div[@class='webcam'][1]/a/img/@src",
      @"Gaglardi Intersection" : @"//div[@class='webcam'][2]/a/img/@src",
      @"Convocation Mall" : @"//div[@class='webcam'][3]/a/img/@src"};
    
    //The Array that has the correct order!
    //The order that we are going to disply on the table view
    
    NSArray *TitleName = @[@"Burnaby Campus",
                           @"Burnaby Classes and Exams",
                           @"Burnaby Roads",
                           @"Burnaby Adjacent Roads",
                           @"Burnaby Translink Buses",
                           @"Announcements",
                           @"Surrey Campus",
                           @"Surrey Classes and Exams",
                           @"Vancouver Campus",
                           @"Vancouver Classes and Exams",
                           @"University Drive North",
                           @"Gaglardi Intersection",
                           @"Convocation Mall"];
    
    _GroupedTitle = @[@"Burnaby",
                      @"Surrey",
                      @"Vancouver",
                      @"Burnaby Webcams"];
    
    //Get the array size
    NSInteger TitleNameSize = (unsigned long)[TitleName count];
    
    
    //_Data = [NSMutableDictionary dictionaryWithDictionary:@{}];
    _Title = [NSMutableArray arrayWithObjects:@[], nil];
    _Status = [NSMutableArray arrayWithObjects:@[], nil];
    
    
    //for each path, parse the html and put the data content to Dictionary_Data
    
    for (int i=0;i< TitleNameSize; i++){
        NSArray *Nodes = [tutorialsParser searchWithXPathQuery:_Path[TitleName[i]]];
        if ([Nodes count] > 0){
           
        TFHppleElement *NodesData = Nodes[0];
        
        //_Data[key] = NodesData.content;
        
        [_Title addObject:TitleName[i]];
        if (i == 5) {
            [_Status addObject:NodesData.raw];
        }else{
            [_Status addObject:NodesData.content];

        }
        }
        
        //NSLog(@"%@ is %@ \n \n \n ", key, _Data[key]);
    }
    
    //Remove the first(empty) entry, which are already exist when we CREATED the array
    if (sizeof(_Title)>0){
    [_Title removeObjectAtIndex:0];
    }
    if (sizeof(_Status)>0) {
    [_Status removeObjectAtIndex:0];
    }    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Run function, loadTutorials
    [self loadTutorials];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self portraitUnLock];
}

// Allow rotation
-(void) portraitUnLock {
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.screenIsPortraitOnly = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    //Sections are the following:
    //Burnaby, Surrey, Vancouver, and Burnaby Webcams
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    //Section 0 : Burnaby Campus needs 5 rows
    //Section 1 : Surrey Campus needs 2 rows
    //Section 2 : Vancouver Campus needs 2 rows
    //Section 3 : Burnaby Webcams needs 3 rows
    
    if (section == 0) {
        return 6;
    }else if (section == 1){
        return 2;
    }else if (section == 2 ){
        return 2;
    }else if (section == 3){
        return 3;
    }else return 0;
    
    //return _Title.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    int row = (int)[indexPath row];
    //NSLog(@"\n\n indexPath = %ld \n\n", (long)indexPath.section);
    
    // Defualt Cell Setting:
    //                      Disable cell selections, DisclosureIndocator, and description.text
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.userInteractionEnabled = NO;
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.DescriptionLable.text = NULL;
    
    //Enable cell selection, desclosure indicator
    if (indexPath.section == 0) {
        row = (int)[indexPath row];
        if (row == 5) {
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            cell.userInteractionEnabled = YES;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }else if (indexPath.section == 1){
        row = 6 + (int)[indexPath row];
    }else if (indexPath.section == 2){
        row = 8 + (int)[indexPath row];
    }else if (indexPath.section == 3){
        row = 10 + (int)[indexPath row];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.userInteractionEnabled = YES;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    //All section has Title
    if ([_Title count] > 0){
    cell.TitleLable.text = _Title[row];
    }
    //Section 3 dont need to have description
    //Section 0 row 5 need no description
    if (indexPath.section != 3 && (indexPath.section != 0 || row != 5)){
        if ([_Status count] > 0){
        cell.DescriptionLable.text = _Status[row];
    }
    }
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *key = [_GroupedTitle objectAtIndex:section];
    
    return key;

}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"showDetail"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        
        if (indexPath.section == 3) {
            //indexPath.row+10 = 10,11,12 => where webcams links get stored
            NSString *WebcamURL = _Status[indexPath.row+10];
            [[segue destinationViewController] setUrl:WebcamURL];
        }else if (indexPath.section == 0){
            //indexpath.row here is Announcement (_Status[5] which is in section 0)
            NSString *BurnabyAnnocoucement = _Status[indexPath.row];
            
            //Change the font size!
            NSString *tempstring = [@"<body bgcolor='#54585A'><font size=\"8\", color=\"White\", face=\"verdana\">" stringByAppendingString:BurnabyAnnocoucement];
            NSString *tempstring2 = [tempstring stringByAppendingString:@"</font></body>"];
            [[segue destinationViewController] setAnnouncement:tempstring2];
        }//end elseif
        
    
    }
}




@end
