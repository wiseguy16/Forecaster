//
//  ForecasterTableViewController.m
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "ForecasterTableViewController.h"
#import "APIController.h"
#import "SelectCityViewController.h"
#import "City.h"
#import "CityTableViewCell.h"
#import "Weather.h"
#import "DetailCityViewController.h"

@interface ForecasterTableViewController () <APIControllerProtocol, SearchTextFieldDelegate, NSCoding, CLLocationManagerDelegate>

@property(strong, nonatomic) NSMutableArray *cities;
@property(strong, nonatomic) NSMutableArray *weathers;
@property(strong, nonatomic) NSMutableDictionary *userStuff;

@property (strong, nonatomic) NSMutableArray *annotations;
@property(strong, nonatomic) CLLocationManager *locationManager;
//#define kCitiesKey @"kCitiesKey";

@end

@implementation ForecasterTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Forecaster";
    
    self.cities = [[NSMutableArray alloc] init];
    self.weathers = [[NSMutableArray alloc] init];
    self.annotations = [[NSMutableArray alloc] init];
    
  //  [self loadCityData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    City *aCity = self.cities[indexPath.row];
    Weather *aWeather = self.weathers[indexPath.row];
    
//    NSString *lat = [NSString stringWithFormat:@"%@", aCity.cityLatDouble];
//    NSString *ltg = [NSString stringWithFormat:@"%@", aCity.cityLongDouble];
//    
//    APIController *apiController = [[APIController alloc] init];
//    apiController.delegate = self;
//    [apiController searchDarkSkyForLat:lat andLong:ltg];
   // NSLog(@"%@ 2nd time", zipcodeToLookUp);
    
   // cell.temperatureLabel.text = aCity.temperature;
    cell.cityNameLabel.text = aCity.name;
   // cell.currentConditionsLabel.text = aCity.currentConditions;
    cell.currentConditionsLabel.text = aWeather.summary;
    cell.temperatureLabel.text = [NSString stringWithFormat:@"%d°F",[aWeather.temperature intValue]];
    
    NSLog(@"name is %@", aCity.name);
    NSLog(@"State is %@", aCity.stateShortName);
    NSLog(@"Lat is is %@", aCity.cityLatDouble);
 //   NSLog(@"Long is %@", aCity.name);
   // NSLog(@"Something is %@", aCity.name);
    
    
    cell.latTempLabel.text = [NSString stringWithFormat:@"%@", aCity.cityLatDouble];
    cell.longTempLabel.text = [NSString stringWithFormat:@"%@", aCity.cityLongDouble];
    
    
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


#pragma mark - Zipcode Set delegate

-(void)searchWasTyped:(NSString *)zipcodeToLookUp
{
    APIController *apiController = [[APIController alloc] init];
    apiController.delegate = self;
    [apiController searchGoogleFor:zipcodeToLookUp];
    NSLog(@"%@ 2nd time", zipcodeToLookUp);
    [self.tableView reloadData];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SelectCitySegue"])
    {
        SelectCityViewController *setZipcodeVC = [segue destinationViewController];
        setZipcodeVC.delegate = self;
//      //  NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
//        setZipcodeVC.gpsCity = sender;
//        if (sender)
//        {
//        //setZipcodeVC.gpsWeather = self.weathers[indexPath.row];
//        NSString *lat = [NSString stringWithFormat:@"%@", setZipcodeVC.gpsCity.cityLatDouble];
//        NSString *ltg = [NSString stringWithFormat:@"%@", setZipcodeVC.gpsCity.cityLongDouble];
//        
//        APIController *apiController = [[APIController alloc] init];
//        apiController.delegate = self;
//        [apiController searchDarkSkyForLat:lat andLong:ltg];
//        }
    }
    
    if ([segue.identifier isEqualToString:@"DetailCitySegue"])
    {
        DetailCityViewController *setDetailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        setDetailVC.detailCity = sender; // self.cities[indexPath.row];
        setDetailVC.detailWeather = self.weathers[indexPath.row];
        
        
    }
    
}


-(void)didReceiveAPIResults:(NSDictionary *)googleResponse
{
    City *aCity = [City cityWithDictionary:googleResponse];
    [self.cities addObject:aCity];
    dispatch_async(dispatch_get_main_queue(), ^{
       // [self.tableView reloadData];
    });
    
    if (aCity)
    {
        NSString *lat = [NSString stringWithFormat:@"%@", aCity.cityLatDouble];
        NSString *ltg = [NSString stringWithFormat:@"%@", aCity.cityLongDouble];
        
        APIController *apiController = [[APIController alloc] init];
        apiController.delegate = self;
        [apiController searchDarkSkyForLat:lat andLong:ltg];
    }
    
   // [self.tableView reloadData];
    
}

-(void)didReceiveAPIResults2:(NSDictionary *)darkSkyResponse
{
    Weather *aWeather = [Weather weatherWithDictionary:darkSkyResponse];
    [self.weathers addObject:aWeather];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}
//#define kNameKey @"kCitiesKey";
//#define kCitiesKey @"kCitiesKey";

// ******************* NOT WORKING YET!!!!! *********************

- (void)loadCityData
{
    NSData *cityData = [[NSUserDefaults standardUserDefaults] objectForKey:@"kCitiesKey"];
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
    [[NSUserDefaults standardUserDefaults] setObject:cityData forKey:@"kCitiesKey"];
}






@end
