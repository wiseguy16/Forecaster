//
//  SelectCityViewController.m
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "SelectCityViewController.h"

@interface SelectCityViewController ()  <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *zipcodeTextField;


@end

@implementation SelectCityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findACityTapped:(UIButton *)sender
{
    [self.delegate searchWasTyped:self.zipcodeTextField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@", self.zipcodeTextField.text);
}



//
//#pragma mark - Managing the detail view
//
//- (void)setCity:(City *)newCity andSetWeather:(Weather *)newWeather
//{
//    if (_gpsCity != newCity && _gpsWeather != newWeather)
//    {
//        _gpsCity = newCity;
//        _gpsWeather = newWeather;
//        
//        // Update the view.
//       // [self configureView];
//    }
//}

//-(void)configureAnnotations
//{
//  /*
//    // City Picked!!
//    CLLocationDegrees cityPickedLat = [self.detailCity.cityLatDouble doubleValue];
//    CLLocationDegrees cityPickedLtg = [self.detailCity.cityLongDouble doubleValue];
//    CLLocationCoordinate2D cityPicked = CLLocationCoordinate2DMake(cityPickedLat, cityPickedLtg);
//    //CLLocationCoordinate2D tiySample = CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
//    // 0 lat is equator north is pos, south is neg
//    // 0 long greeninch england west is neg, east is pos of England
//    MKPointAnnotation *cityPickedAnnotation = [[MKPointAnnotation alloc] init];
//    cityPickedAnnotation.coordinate = cityPicked;
//    cityPickedAnnotation.title = self.detailCity.name;
//    // cityPickedAnnotation.subtitle = @"Tampa";
//    [self.annotations addObject:cityPickedAnnotation];
//    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(cityPicked, 100000, 100000);
//    [self.cityMapView setRegion:viewRegion animated:YES];
// */
//    /*
//     // LAKELAND
//     CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//     [geocoder geocodeAddressString:@"Lakeland, FL" completionHandler:^(NSArray *placemarks, NSError *error) {
//     if (!error)
//     {
//     MKPlacemark *placemark = placemarks[0];
//     MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
//     annotation.coordinate = placemark.location.coordinate; // Using this later as a center point
//     annotation.title = @"Lakeland, FL";
//     [self.cityMapView addAnnotation:annotation]; // runs in background with network call
//     
//     MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 5000, 5000);
//     [self.cityMapView setRegion:viewRegion animated:YES];
//     
//     }
//     }];
//     
//     */
//    
//    // ORLANDO configured in bottom method
//    
//    
//    
//    
//   // [self.cityMapView addAnnotations:self.annotations];
//    
//}



- (IBAction)useCurrentLocationTapped:(UIButton *)sender
{
//    // USE MKAnnotatePoint to get gps coordinates
//    [self configureLocationManager];
//    //[NSNumber numberWithDouble:23.234223]];
//    NSNumber *gpsLat =[NSNumber numberWithDouble:self.locationManager.location.coordinate.latitude];
//    self.gpsCity.cityLatDouble = gpsLat;
//    NSNumber *gpsLtg =[NSNumber numberWithDouble:self.locationManager.location.coordinate.longitude];
//    self.gpsCity.cityLongDouble = gpsLtg;
    
    
}

//-(void)configureLocationManager
//{
//    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted)
//    {
//        if (!self.locationManager)
//        {
//            self.locationManager = [[CLLocationManager alloc] init]; // need one to exist to even ask permission!!
//            self.locationManager.delegate = self;
//            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
//            if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
//            {
//                // Don't forget to add the reason to the info.plist
//                [self.locationManager requestWhenInUseAuthorization];
//            }
//        }
//        
//        
//    }
//}
//
//-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
//{
//    if(status == kCLAuthorizationStatusAuthorizedWhenInUse)
//    {
//        [self enableLocationManager:YES];
//    }
//    else
//    {
//        [self enableLocationManager:NO];
//    }
//}
//
//-(void)enableLocationManager:(BOOL)enable
//{
//    if (self.locationManager)
//    {
//        // good practice to stop locationManager first then start
//        [self.locationManager stopUpdatingLocation];
//        
//        if (enable)
//        {
//            [self.locationManager startUpdatingLocation];
//        }
//    }
//}
//
//-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
//{
//    if (error != kCLErrorLocationUnknown)
//    {
//        [self enableLocationManager:NO];
//    }
//}
//
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
//{
//       CLLocation *location = [locations lastObject];
//    [self enableLocationManager:NO];
//        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
///*
//    self.aCarItem.carLocationLat = location.coordinate.latitude;
//    self.aCarItem.carLocationLong = location.coordinate.longitude;
//    annotation.coordinate = location.coordinate;
//    annotation.title = @"Here is your car!!";
//    self.aCarItem.carLocationDescription = annotation.title;
//    [self.carItems addObject:self.aCarItem];
//    
//    [self.annotations addObject:annotation];
//*/
//        annotation.coordinate = location.coordinate;
//    //    annotation.title = @"The Iron Yard";
//        [self.annotations addObject:annotation];
//   // [self configureAnnotations];
//}
//
//
//
//



@end
