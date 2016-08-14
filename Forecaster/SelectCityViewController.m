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
    
    // ******* STUFF FOR BUTTONS *********************
    self.pickACityButton.layer.borderWidth = 1.0f;
    self.useGPSButton.layer.borderWidth = 1.0f;
    
    self.pickACityButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.useGPSButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.pickACityButton.layer.cornerRadius = 4.0f;
    self.useGPSButton.layer.cornerRadius = 4.0f;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findACityTapped:(UIButton *)sender
{
    
    
    [self.delegate searchWasTyped:self.zipcodeTextField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@", self.zipcodeTextField.text);
}

- (IBAction)DismissXTapped:(UIButton *)sender
{
    // ********* A WAY TO BACK OUT ***********************
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - Managing the detail view

- (void)setCity:(City *)newCity andSetWeather:(Weather *)newWeather
{
    if (_gpsCity != newCity && _gpsWeather != newWeather)
    {
        _gpsCity = newCity;
        _gpsWeather = newWeather;
        
    }
}

//-(void)configureAnnotations
//{
//   // [self.cityMapView addAnnotations:self.annotations];
//    
//}



- (IBAction)useCurrentLocationTapped:(UIButton *)sender
{
    // ********************************** CAN'T MAKE THIS BUTTON GIVE DATA TO TABLEVIEW OR API?????? ****************
    
    // USE MKAnnotatePoint to get gps coordinates
    [self configureLocationManager];
    
    NSLog(@"%@ this is line 84ish", self.gpsCity.cityLatDouble); // THIS SAYS NULL!!!!!!!!!*************************
    //[NSNumber numberWithDouble:23.234223]];
//    NSNumber *gpsLat =[NSNumber numberWithDouble:self.locationManager.location.coordinate.latitude];
//    self.gpsCity.cityLatDouble = gpsLat;
//    NSNumber *gpsLtg =[NSNumber numberWithDouble:self.locationManager.location.coordinate.longitude];
//    self.gpsCity.cityLongDouble = gpsLtg;
    
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
//
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
       CLLocation *locationNow = [locations lastObject];
    NSLog(@"%@ locationNow this is Line 150ish", locationNow); //************ I HAVE THE COORDINATES!! HOW DO I PASS THE DATA BACK???? ****************
    [self enableLocationManager:NO];
   //     MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    NSNumber *gpsLat = [NSNumber numberWithDouble: locationNow.coordinate.latitude];
    NSNumber *gpsLtg = [NSNumber numberWithDouble: locationNow.coordinate.longitude];
     self.gpsCity.cityLatDouble = gpsLat;
     self.gpsCity.cityLatDouble = gpsLtg;
  //  annotation.coordinate = locationNow.coordinate;
    
    
    NSLog(@"%@ This is line 160ish", gpsLtg); // ********* CONFIRMING I HAVE JUST A DOUBLE HERE!!! NEED TO SEND OUT SOMEHOW?? ********************
}



@end
