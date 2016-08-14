//
//  DetailCityViewController.h
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"
#import "Weather.h"
#import <MapKit/MapKit.h>

@import CoreLocation;

@interface DetailCityViewController : UIViewController

@property (strong, nonatomic) City *detailCity;
@property (strong, nonatomic) Weather *detailWeather;

@property (weak, nonatomic) IBOutlet UIImageView *conditionsImageView;
@property (weak, nonatomic) IBOutlet UILabel *conditionsLabel;

@property (weak, nonatomic) IBOutlet UILabel *rainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *feelsLikeLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
//@property (weak, nonatomic) IBOutlet MKMapView *cityMapView;

@property (weak, nonatomic) IBOutlet MKMapView *cityMapView;

@property (strong, nonatomic) NSMutableArray *annotations;
@property(strong, nonatomic) CLLocationManager *locationManager;

@end
