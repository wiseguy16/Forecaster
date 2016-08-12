//
//  CityTableViewCell.h
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentConditionsLabel;

@property (weak, nonatomic) IBOutlet UILabel *latTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *longTempLabel;

@end
