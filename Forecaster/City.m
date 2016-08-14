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
        aCity.zipCode = newListItems[1];
        
        NSDictionary *geometryDict = resultsDict[@"geometry"];
        NSDictionary *locationDict = geometryDict[@"location"];
        aCity.cityLatString = locationDict[@"lat"];
        aCity.cityLongString = locationDict[@"lng"];
        aCity.cityLatDouble = locationDict[@"lat"];
        aCity.cityLongDouble = locationDict[@"lng"];
        
    }
    
    return aCity;
}

- (City *)initWithName:(NSString *)cityName latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude andZipCode:(NSString *)zipCode
{
    City *aCity = nil;
    if (cityName)
    {
        aCity = [[City alloc] init];
        aCity.name = cityName;
        aCity.cityLatDouble = latitude;
        aCity.cityLongDouble = longitude;
        aCity.zipCode = zipCode;
        
    }
    return aCity;

}

#pragma mark - NSCoding

#define kNameKey @"name"
#define kLatitudeKey @"latitude"
#define kLongitudeKey @"longitude"
#define kZipCodeKey @"zipCode"
#define kCitiesKey @"kCitiesKey"



- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:kNameKey];
    [aCoder encodeObject:self.cityLatDouble forKey:kLatitudeKey];
    [aCoder encodeObject:self.cityLongDouble forKey:kLongitudeKey];
    [aCoder encodeObject:self.zipCode forKey:kZipCodeKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{

    NSString *cityName = [aDecoder decodeObjectForKey:kNameKey];
    NSNumber *latitude = [aDecoder decodeObjectForKey:kLatitudeKey];
    NSNumber *longitude = [aDecoder decodeObjectForKey:kLongitudeKey];
    NSString *zipCode = [aDecoder decodeObjectForKey:kZipCodeKey];
    
//    City *aCity = nil;
//    aCity = [[City alloc] init];
//    if (aCity)
//    {
//    aCity.name = [aDecoder decodeObjectForKey:kNameKey];
//    aCity.cityLatDouble = [aDecoder decodeObjectForKey:kLatitudeKey];
//    aCity.cityLongDouble = [aDecoder decodeObjectForKey:kLongitudeKey];
//    aCity.zipCode = [aDecoder decodeObjectForKey:kZipCodeKey];
//    }
//    return aCity;
    
//    City *aCity = nil;
//    aCity = [[City alloc] init];
//    aCity.name = cityName;
//    aCity.cityLatDouble = latitude;
//    aCity.cityLongDouble = longitude;
//    aCity.zipCode = zipCode;
    
    //return aCity;
    
// ******************* THIS PART SEEMS TO NOT MAKE IT STORE IN NSUSERDEFAULTS!!!  ************************
    
   return [self initWithName:cityName latitude:latitude longitude:longitude andZipCode:zipCode];

}

@end


