//
//  Weather.h
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (nonatomic) NSString *summary;
@property (nonatomic) NSNumber *temperature;
@property (nonatomic) NSNumber *humidity;
@property (nonatomic) NSNumber *windSpeed;
@property (nonatomic) NSString *icon;
@property (nonatomic) NSNumber *precipProbability;
@property (nonatomic) NSNumber *apparentTemperature;

+ (Weather *)weatherWithDictionary:(NSDictionary *)weatherDict;

@end
