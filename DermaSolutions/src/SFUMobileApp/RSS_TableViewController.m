//
//  RSS_TableViewController.m
//  TableViewApplication
//
//  Created by Daphne Chiang on 2015-03-01.
//  Copyright (c) 2015 Daphne Chiang. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder

#import "RSS_TableViewController.h"
#import "RSS_TableViewCell.h"
#import "NewsDetailView.h"
#import "TFHpple.h"
#import "AppDelegate.h"

@interface RSS_TableViewController (){

    
    // A parser that parses xml
    // A array that stores feeds data which include title and link
    // A dictionary that stores associate link and title
    // Two strings that sotre title and link
    // A string that looks for the element which the parser parses
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;

}

@end

@implementation RSS_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // allocate the array, feeds
    feeds = [[NSMutableArray alloc] init];
    
    //get the url link from DetailModal
    NSURL *url = [NSURL URLWithString:_DetailModal[1]];
    
    //allocate the parser
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    //set the cell title to DetailModal
    self.navigationItem.title = _DetailModal[0];

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
    return feeds.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Create a cell object (RSS_TableViewCell)
    // and set the identifier to "CellV"
   
    /*RSS_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellV" forIndexPath:indexPath];
    
    //Set the cell title to the title stored feeds
    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    //Change the cell colour to SFU gray
    cell.textLabel.textColor = [UIColor colorWithRed:188 green:149 blue:88 alpha:1.0];
    
    return cell;
     */
    
    RSS_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellV" forIndexPath:indexPath];
    //NSLog(@"\n \n Feed[%ld] = %@", (long)indexPath.row, feeds[indexPath.row]);
    //NSLog(@"%@", feeds[indexPath.row][@"id"]);
    
    //----------------------------------------------------------------------------------
    // Pharsing html to get the image link of the news article
    
    
    // store the HTML of both URLS on different NSData Objects
    NSURL *NEWSUrl = [NSURL URLWithString:feeds[indexPath.row][@"id"]];
    
    NSData *NEWSHtmlData = [NSData dataWithContentsOfURL:NEWSUrl];
    
    // initialize html parser object with the contents of myURL
    TFHpple *NEWSParser = [TFHpple hppleWithHTMLData:NEWSHtmlData];
    
    // perform a search using XpathQuery on the source html to extract the list, store in an array of TFHpple Elements, then extract the weekly schedul
    NSString *NEWSXpathQueryString = @"//div[@class='parbase image section']/img/@src";
    NSArray *htmlNodes = [NEWSParser searchWithXPathQuery:NEWSXpathQueryString];
    
    //If the NEWS article does not have image, then we should use the default image
    //If the NEWS article have image, then we use the image!!
    if (!htmlNodes || !htmlNodes.count) {
        //NSLog(@"%@ is null",feeds[indexPath.row][@"title"]);
        cell.rss_ThumbImage.image = [UIImage imageNamed:@"Untitled-1.png"];
        
    }else{
        TFHppleElement *tableNode = htmlNodes[0];
        NSString *ImgUrl_pre = tableNode.content;
        NSString *ImgUrl = [@"http://www.sfu.ca" stringByAppendingString:ImgUrl_pre];
        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:ImgUrl]];
        //NSLog(@"imageData = %@",imageData);
        
        cell.rss_ThumbImage.image = [UIImage imageWithData: imageData];
        
        
    }
    
    
    //----------------------------------------------------------------------------------
    //Set the cell title to the title stored feeds
    cell.rss_TitleLable.text = [[feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    //Change the cell colour to SFU gray
    cell.rss_TitleLable.textColor = [UIColor colorWithRed:188 green:149 blue:88 alpha:1.0];
    //cell.rss_ThumbImage.image = [UIImage imageNamed:@"people.jpg"];
    cell.rss_ThumbImage.contentMode = UIViewContentModeScaleAspectFill;
    cell.rss_ThumbImage.clipsToBounds = YES;
    
    return cell;
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    //allocate all the arrays
    element = elementName;
    if ([element isEqualToString:@"entry"]) {
        item = [[NSMutableDictionary alloc] init];
        title = [[NSMutableString alloc] init];
        link = [[NSMutableString alloc] init];
        
    }
    
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    
    //find the key words!!!
    //"entry" shows us the section of each news
    //"title" gives us the title
    //"id" gives us the url link to the news page
    if ([elementName isEqualToString:@"entry"]) {
        
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"id"];
        
        [feeds addObject:[item copy]];
    }
    
}


-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    //if found "title", then store the title to array_title
    //if founf "id", then store the id + ".html" to array_link
    
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    }else if ([element isEqualToString:@"id"]){
        NSString *htmlString = [string stringByAppendingString:@".html"];
        [link appendString:htmlString];
    }
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
    
    [self.tableView reloadData];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //set up the identifier to "showDetail"
    //pass the url link stored in array_link to cell
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *string = [feeds[indexPath.row] objectForKey:@"id"];
        [[segue destinationViewController] setUrl:string];
    }
    
    
    
}


@end
