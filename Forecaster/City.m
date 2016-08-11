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
        aCity.name = cityDict[@"name"];
        aCity.cityLatString = cityDict[@"login"];
        aCity.cityLongString = cityDict[@"location"];
        aCity.stateShortName = cityDict[@"avatar_url"];
        aCity.cityLatDouble = cityDict[@"public_repos"];
        aCity.cityLongDouble = cityDict[@"public_repos"];

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