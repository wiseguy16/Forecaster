//
//  Weather.m
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "Weather.h"

@implementation Weather

+ (Weather *)weatherWithDictionary:(NSDictionary *)weatherDict
{
    Weather *aWeather = nil;
    if (weatherDict)
    {
        aWeather = [[Weather alloc] init];
        
        NSDictionary *currentlyDict = weatherDict[@"currently"];
        
        aWeather.summary = currentlyDict[@"summary"];
        aWeather.icon = currentlyDict[@"icon"];
        aWeather.precipProbability = currentlyDict[@"precipProbability"];
        aWeather.temperature = currentlyDict[@"temperature"];
        aWeather.apparentTemperature = currentlyDict[@"apparentTemperature"];
        aWeather.humidity = currentlyDict[@"humidity"];
        aWeather.windSpeed = currentlyDict[@"windSpeed"];
    }
    
    return aWeather;
    
}

@end








/*
 @property (nonatomic) NSString *summary;
 @property (nonatomic) NSString *temperature;
 @property (nonatomic) NSString *humidity;
 @property (nonatomic) NSString *windSpeed;
 @property (nonatomic) NSString *icon;
 @property (nonatomic) NSString *precipProbability;
 @property (nonatomic) NSString *apparentTemperature;
 
 */