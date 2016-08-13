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
    NSString *cityName = [aDecoder decodeObjectForKey:kNameKey];
    NSNumber *latitude = [aDecoder decodeObjectForKey:kLatitudeKey];
    NSNumber *longitude = [aDecoder decodeObjectForKey:kLongitudeKey];
    NSString *zipCode = [aDecoder decodeObjectForKey:kZipCodeKey];
    
//    City *aCity = nil;
//    aCity = [[City alloc] init];
//    aCity.name = cityName;
//    aCity.cityLatDouble = latitude;
//    aCity.cityLongDouble = longitude;
//    aCity.zipCode = zipCode;
    
    //return aCity;
    
    
   return [self initWithName:cityName latitude:latitude longitude:longitude andZipCode:zipCode];

}

@end


/*
 
 /Users/GregNewMac/Desktop/TheIronYard2016/Homework/Forecaster/Forecaster/City.m:99:17: No visible @interface for 'City' declares the selector 'initWithName:latitude:longitude:andZipCode:'
 
 // These two methods are used in a model class to enable NSCoding. Be sure to also make the model class conform to the NSCoding protocol by putting `<NSCoding>` at the top of the .h or .m file.
 
 ```
 #pragma mark - NSCoding
 
 #define kNameKey @"name"
 #define kLatitudeKey @"latitude"
 #define kLongitudeKey @"longitude"
 #define kZipCodeKey @"zipCode"
 
 - (void)encodeWithCoder:(NSCoder *)aCoder
 {
 [aCoder encodeObject:self.name forKey:kNameKey];
 [aCoder encodeDouble:self.latitude forKey:kLatitudeKey];
 [aCoder encodeDouble:self.longitude forKey:kLongitudeKey];
 [aCoder encodeObject:self.zipCode forKey:kZipCodeKey];
 }
 
 - (id)initWithCoder:(NSCoder *)aDecoder
 {
 NSString *cityName = [aDecoder decodeObjectForKey:kNameKey];
 double latitude = [aDecoder decodeDoubleForKey:kLatitudeKey];
 double longitude = [aDecoder decodeDoubleForKey:kLongitudeKey];
 NSString *zipCode = [aDecoder decodeObjectForKey:kZipCodeKey];
 return [self initWithName:cityName latitude:latitude longitude:longitude andZipCode:zipCode];
 }
 ```
 
 // These two methods are used in a view controller to push NSCoding compliant model objects into Standard User Defaults, an area in your app used to store configuration data.
 
 ```
 - (void)loadCityData
 {
 NSData *cityData = [[NSUserDefaults standardUserDefaults] objectForKey:kCitiesKey];
 if (cityData)
 {
 self.cities = [NSKeyedUnarchiver unarchiveObjectWithData:cityData];
 }
 else
 {
 self.cities = [[NSMutableArray alloc] init];
 }
 }
 
 - (void)saveCityData
 {
 NSData *cityData = [NSKeyedArchiver archivedDataWithRootObject:self.cities];
 [[NSUserDefaults standardUserDefaults] setObject:cityData forKey:kCitiesKey];
 }
 ```
 
 // This method is implemented in the AppDelegate to enable saving of the NSCoding compliant model objects when the app is being put to sleep by iOS.
 
 ```
 - (void)applicationDidEnterBackground:(UIApplication *)application
 {
 // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
 // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
 UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
 CitiesTableViewController *citiesVC = [navController viewControllers][0];
 [citiesVC saveCityData];
 }
 
 
 
 @property (nonatomic) NSString *name;
 @property (nonatomic) NSString *cityLatString;
 @property (nonatomic) NSString *cityLongString;
 @property (nonatomic) NSString *stateShortName;
 @property (nonatomic) double cityLatDouble;
 @property (nonatomic) double cityLongDouble;
 */