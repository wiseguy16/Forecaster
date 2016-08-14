//
//  DetailCityViewController.m
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "DetailCityViewController.h"
#import "ForecasterTableViewController.h"

@interface DetailCityViewController () <CLLocationManagerDelegate>

@end

@implementation DetailCityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.annotations = [[NSMutableArray alloc] init];
//     [self configureLocationManager];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Managing the detail view

- (void)setCity:(City *)newCity andSetWeather:(Weather *)newWeather
{
    if (_detailCity != newCity && _detailWeather != newWeather)
    {
        _detailCity = newCity;
        _detailWeather = newWeather;
        
        // Update the view.
        [self configureView];
    }
}

// -(void)searchDarkSkyForLat:(NSString *)latitude andLong:(NSString *)longitude

#pragma mark - Configure the view

- (void)configureView
{
    
    if (self.detailCity)
    {
        
        self.title = [NSString stringWithFormat: @"%@", self.detailCity.name];
        
        self.temperatureLabel.text = [NSString stringWithFormat:@"%d°F", [self.detailWeather.temperature intValue]];
        self.conditionsImageView.image = [UIImage imageNamed:self.detailWeather.icon];
        self.conditionsLabel.text = self.detailWeather.summary;
        self.humidityLabel.text = [NSString stringWithFormat:@"%g",([self.detailWeather.humidity doubleValue]*100)];
        self.rainLabel.text = [NSString stringWithFormat:@"%g",([self.detailWeather.precipProbability doubleValue]*100)];
        self.feelsLikeLabel.text = [NSString stringWithFormat:@"Feels Like: %d°F", [self.detailWeather.apparentTemperature intValue]];
        self.windLabel.text = [NSString stringWithFormat:@"%dMPH", [self.detailWeather.windSpeed intValue]];

        [self configureLocationManager];
    }
}

-(void)configureAnnotations
{
    
    // City Picked!!
    CLLocationDegrees cityPickedLat = [self.detailCity.cityLatDouble doubleValue];
    CLLocationDegrees cityPickedLtg = [self.detailCity.cityLongDouble doubleValue];
    CLLocationCoordinate2D cityPicked = CLLocationCoordinate2DMake(cityPickedLat, cityPickedLtg);
    // 0 lat is equator north is pos, south is neg
    // 0 long greeninch england west is neg, east is pos of England
    MKPointAnnotation *cityPickedAnnotation = [[MKPointAnnotation alloc] init];
    cityPickedAnnotation.coordinate = cityPicked;
    cityPickedAnnotation.title = self.detailCity.name;
    [self.annotations addObject:cityPickedAnnotation];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(cityPicked, 100000, 100000);
    [self.cityMapView setRegion:viewRegion animated:YES];
    
    
    [self.cityMapView addAnnotations:self.annotations];
    
}

-(void)configureLocationManager
{
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted)
    {
        if (!self.locationManager)
        {
            self.locationManager = [[CLLocationManager alloc] init]; // need one to exist to even ask permission!!
            self.locationManager.delegate = self;
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
            if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
            {
                // Don't forget to add the reason to the info.plist
                [self.locationManager requestWhenInUseAuthorization];
            }
        }
        
        
    }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self enableLocationManager:YES];
    }
    else
    {
        [self enableLocationManager:NO];
    }
}

-(void)enableLocationManager:(BOOL)enable
{
    if (self.locationManager)
    {
        // good practice to stop locationManager first then start
        [self.locationManager stopUpdatingLocation];
        
        if (enable)
        {
            [self.locationManager startUpdatingLocation];
        }
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (error != kCLErrorLocationUnknown)
    {
        [self enableLocationManager:NO];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
 //   CLLocation *location = [locations lastObject];
    [self enableLocationManager:NO];
//    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = location.coordinate;
//    [self.annotations addObject:annotation];
    [self configureAnnotations];
}



@end
