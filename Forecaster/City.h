//
//  City.h
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *cityLatString;
@property (nonatomic) NSString *cityLongString;
@property (nonatomic) NSString *stateShortName;
@property (nonatomic) NSNumber *cityLatDouble;
@property (nonatomic) NSNumber *cityLongDouble;

+ (City *)cityWithDictionary:(NSDictionary *)cityDict;




@end
