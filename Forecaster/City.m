//
//  City.m
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "City.h"

@implementation City

+ (City *)cityWithDictionary:(NSDictionary *)cityDict
{
    City *aCity = nil;
    if (cityDict)
    {
        aCity = [[City alloc] init];
        
        NSArray *resultsArray = cityDict[@"results"];
        NSDictionary *resultsDict = resultsArray[0];
        NSString *fullAddress = resultsDict[@"formatted_address"];
        
        NSString *list = fullAddress;
        NSArray *listItems = [list componentsSeparatedByString:@", "];
        
        aCity.name = listItems[0];
        NSString *newList = listItems[1];
        NSArray *newListItems = [newList componentsSeparatedByString:@" "];
        aCity.stateShortName = newListItems[0];
        
        NSDictionary *geometryDict = resultsDict[@"geometry"];
        NSDictionary *locationDict = geometryDict[@"location"];
        aCity.cityLatString = locationDict[@"lat"];
        aCity.cityLongString = locationDict[@"lng"];
        aCity.cityLatDouble = locationDict[@"lat"];
        aCity.cityLongDouble = locationDict[@"lng"];
        
        
        
       // aCity.name = cityDict[@"name"];
        
        /*
        aCity.cityLatString = cityDict[@"login"];
        aCity.cityLongString = cityDict[@"location"];
        aCity.stateShortName = cityDict[@"avatar_url"];
        aCity.cityLatDouble = cityDict[@"public_repos"];
        aCity.cityLongDouble = cityDict[@"public_repos"];
         */
    }
    
    return aCity;
}


@end


/*
 @property (nonatomic) NSString *name;
 @property (nonatomic) NSString *cityLatString;
 @property (nonatomic) NSString *cityLongString;
 @property (nonatomic) NSString *stateShortName;
 @property (nonatomic) double cityLatDouble;
 @property (nonatomic) double cityLongDouble;
 */