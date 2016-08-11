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
    
}

- (IBAction)useCurrentLocationTapped:(UIButton *)sender
{
    // USE MKAnnotatePoint to get gps coordinates
    
    
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
