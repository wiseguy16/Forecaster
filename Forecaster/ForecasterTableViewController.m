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

@interface ForecasterTableViewController () <APIControllerProtocol, SearchTextFieldDelegate>

@property(strong, nonatomic) NSMutableArray *cities;

@end

@implementation ForecasterTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Forecaster";
    
    self.cities = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
   // cell.temperatureLabel.text = aCity.temperature;
    cell.cityNameLabel.text = aCity.name;
   // cell.currentConditionsLabel.text = aCity.currentConditions;
    cell.currentConditionsLabel.text = aCity.stateShortName;
    
    
    
    
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

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Date Set delegate

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
    }
}



-(void)didReceiveAPIResults:(NSDictionary *)googleResponse
{
    City *aCity = [City cityWithDictionary:googleResponse];
    [self.cities addObject:aCity];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}




@end
