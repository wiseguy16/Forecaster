//
//  ForecasterTableViewController.h
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>

//#define kNameKey @"kCitiesKey";

@protocol SearchTextFieldDelegate

-(void)searchWasTyped:(NSString *)zipcodeToLookUp;

@end


@protocol APIControllerProtocol

-(void)didReceiveAPIResults:(NSDictionary *)googleResponse;
-(void)didReceiveAPIResults2:(NSDictionary *)darkSkyResponse;

@end

@interface ForecasterTableViewController : UITableViewController

- (void)saveCityData;

@end
