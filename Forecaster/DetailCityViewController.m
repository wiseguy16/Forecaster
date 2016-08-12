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
        self.conditionsImageView.image = [UIImage imageNamed:self.detailWeather.icon];
        self.conditionsLabel.text = self.detailWeather.summary;
        self.humidityLabel.text = [NSString stringWithFormat:@"%g",([self.detailWeather.humidity doubleValue]*100)];
        self.rainLabel.text = [NSString stringWithFormat:@"%g",([self.detailWeather.precipProbability doubleValue]*100)];
        self.feelsLikeLabel.text = [NSString stringWithFormat:@"Feels Like: %d°F", [self.detailWeather.apparentTemperature intValue]];
        self.windLabel.text = [NSString stringWithFormat:@"%dMPH", [self.detailWeather.windSpeed intValue]];

        
        // [NSString stringWithFormat:@"%d°F",[aWeather.temperature intValue]];
//        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:self.hero.imageName]];
//        self.heroImageView.image = [UIImage imageWithData: imageData]; // This should probably be done async????
//        
    }
}


// cell.cardImageView.image = [UIImage imageNamed:self.allCards[characterName]];

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
