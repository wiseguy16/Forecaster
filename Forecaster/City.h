//
//  City.h
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface City : NSObject <NSCoding>

@property (strong, nonatomic) Weather *currentWeather;

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *cityLatString;
@property (nonatomic) NSString *cityLongString;
@property (nonatomic) NSString *stateShortName;
@property (nonatomic) NSNumber *cityLatDouble;
@property (nonatomic) NSNumber *cityLongDouble;
@property (nonatomic) NSString *zipCode;

- (instancetype)initWithName:(NSString *)cityName latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude andZipCode:(NSString *)zipCode;

+ (City *)cityWithDictionary:(NSDictionary *)cityDict;

//+(instancetype)





@end
