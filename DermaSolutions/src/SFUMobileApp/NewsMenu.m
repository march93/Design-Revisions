//
//  TableViewController_menu.m
//  TableViewApplication
//
//  Created by Daphne Chiang on 2015-03-01.
//  Copyright (c) 2015 Daphne Chiang. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder

#import "NewsMenu.h"
#import "NewsMenuTableCell.h"
#import "RSS_TableViewController.h"
#import "RSS_TableViewCell.h"
#import "AppDelegate.h"

@interface NewsMenu ()

@end

@implementation NewsMenu

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create 3 arrays with required information

    _Title = @[@"People",
               @"Community",
               @"Sports",
               @"Learning",
               @"Research",];
    
    _Description = @[@"http://www.sfu.ca/content/sfu/sfunews/people/jcr:content/main_content/list.feed",
                     @"http://www.sfu.ca/content/sfu/sfunews/community/jcr:content/main_content/list.feed",
                     @"http://www.sfu.ca/content/sfu/sfunews/sports/jcr:content/main_content/list.feed",
                     @"http://www.sfu.ca/content/sfu/sfunews/learning/jcr:content/main_content/list.feed",
                     @"http://www.sfu.ca/content/sfu/sfunews/research/jcr:content/main_content/list.feed",];
    
    _Images  = @[@"people.jpg",
                 @"community.jpg",
                 @"sports.jpg",
                 @"learning.jpg",
                 @"research.jpg",];

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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _Title.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    NewsMenuTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    // Get image, title, and description ready to show on the cell
    int row = (int)[indexPath row];
    
    cell.TitleLable.text = _Title[row];
    cell.DescriptionLable.text = _Description[row];
    cell.ThumbImage.image = [UIImage imageNamed:_Images[row]];
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
        
        //Create a RSS_TableViewController object
        //and pass the information of image names, title, and description throught "DetailModal" to the object we created
        
        RSS_TableViewController *rss_tableviewcontroller = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        int row = (int)[myIndexPath row];
        rss_tableviewcontroller.DetailModal = @[_Title[row],_Description[row],_Images[row]];
        
    }
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
