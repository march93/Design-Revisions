//
//  Transit.h
//  SFUMobileApp
//
//  Created by Angela Lee on 2015-03-21.
//  Copyright (c) 2015 Derma Solutions. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//

#import <UIKit/UIKit.h>


@interface Transit : UITableViewController <NSURLConnectionDataDelegate, NSURLConnectionDelegate, NSXMLParserDelegate>

@property (strong, nonatomic) NSString *selectedBusStop;

@end
