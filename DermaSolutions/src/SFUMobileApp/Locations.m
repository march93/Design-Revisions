//
//  Locations.m
//  search suggestions
//
//  Created by Ricardo Haro Colmenero on 3/26/15.
//  Copyright (c) 2015 Ricardo Haro Colmenero. All rights reserved.
//
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
#import "Locations.h"

@implementation Locations
@synthesize category;
@synthesize name;


+ (id)LocationOfCategory:(NSString *)category name:(NSString *)name coordinates:(NSString *)coordinates
{
    Locations *newLocation = [[self alloc] init];
    newLocation.category = category;
    newLocation.name = name;
    newLocation.coordinates = coordinates;
    return newLocation;
}

@end
