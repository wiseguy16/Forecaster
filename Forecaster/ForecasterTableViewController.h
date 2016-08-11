//
//  ForecasterTableViewController.h
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol SearchTextFieldDelegate

-(void)searchWasTyped:(NSString *)zipcodeToLookUp;

@end


@protocol APIControllerProtocol

-(void)didReceiveAPIResults:(NSDictionary *)googleResponse;

@end

@interface ForecasterTableViewController : UITableViewController

@end
