//
//  SelectCityViewController.m
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "SelectCityViewController.h"

@interface SelectCityViewController ()

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



- (IBAction)useCurrentLocationTapped:(UIButton *)sender
{
    // USE MKAnnotatePoint to get gps coordinates
    
    
}




@end
