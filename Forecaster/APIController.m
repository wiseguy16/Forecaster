//
//  APIController.m
//  Forecaster
//
//  Created by Gregory Weiss on 8/11/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "APIController.h"

@implementation APIController


-(void)searchGoogleFor:(NSString *)searchTerm
{
    
    NSString *googleSearchTerm = [searchTerm stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *escapedSearchTerm = [googleSearchTerm stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]];
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:%@&sensor=false", escapedSearchTerm]];
    
    NSURLSession *session =[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          if (error)
                                          {
                                              NSLog(@"Could not communicate to iTunes: %@", [error localizedDescription]);
                                          }
                                          else
                                          {
                                              NSError *parseError = nil;
                                              NSDictionary *googleResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                                              [self.delegate didReceiveAPIResults:googleResponse];
                                          }
                                          
                                      }];
    
    [dataTask resume];
}



@end


//  https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:32810&sensor=false