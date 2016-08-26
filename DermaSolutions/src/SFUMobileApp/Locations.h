//
//  Locations.h
//  search suggestions
//
//  Created by Ricardo Haro Colmenero on 3/26/15.
//  Copyright (c) 2015 Ricardo Haro Colmenero. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
//

#import <Foundation/Foundation.h>
#import <GoogleMaps/GoogleMaps.h>

@interface Locations : NSObject {
    NSString *category;
    NSString *name;
}

@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *coordinates;

+ (id)LocationOfCategory:(NSString *)category name:(NSString *)name coordinates:(NSString *)coordinates;

@end
