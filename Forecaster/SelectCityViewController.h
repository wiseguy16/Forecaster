//
//  SelectCityViewController.h
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecasterTableViewController.h"
#import <MapKit/MapKit.h>
#import "City.h"
#import "Weather.h"

@import CoreLocation;

@interface SelectCityViewController : UIViewController

//@property (strong, nonatomic) City *gpsCity;
//@property (strong, nonatomic) Weather *gpsWeather;
//
//@property (strong, nonatomic) NSMutableArray *annotations;
//@property(strong, nonatomic) CLLocationManager *locationManager;

@property (nonatomic) id<SearchTextFieldDelegate> delegate;

@end
