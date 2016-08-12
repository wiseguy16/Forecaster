//
//  DetailCityViewController.m
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "DetailCityViewController.h"
#import "ForecasterTableViewController.h"

@interface DetailCityViewController ()

@end

@implementation DetailCityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
        // [NSString stringWithFormat:@"%d°F",[aWeather.temperature intValue]];
//        
//        self.heroNameLabel.text = self.hero.name;
//        self.heroHomeWorldLabel.text = [NSString stringWithFormat: @"Appears in %@ comics!", self.hero.appearances];
//        self.heroPowersLabel.text = self.hero.theDescription;
//        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:self.hero.imageName]];
//        
//        self.heroImageView.image = [UIImage imageWithData: imageData]; // This should probably be done async????
//        
    }
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
