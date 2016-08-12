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
                                              NSLog(@"Could not communicate to Google: %@", [error localizedDescription]);
                                          }
                                          else
                                          {
                                              NSError *parseError = nil;
                                              NSDictionary *googleResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                                              [self.delegate didReceiveAPIResults:googleResponse];
                                              NSLog(@"%@", googleResponse);
                                          }
                                          
                                      }];
    
    [dataTask resume];
}

//01  - (int)addX:(int)x toY:(int)y {
//    02      int sum = x + y;
//    03      return sum;
//    04  }

-(void)searchDarkSkyForLat:(NSString *)latitude andLong:(NSString *)longitude
{
    
//    NSString *darkSkySearchTerm = [searchTerm stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    NSString *escapedSearchTerm = [darkSkySearchTerm stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]];
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.forecast.io/forecast/435e383f722feaadf30ab2b1aef09c5d/%@,%@", latitude, longitude]];
    
    NSURLSession *session =[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          if (error)
                                          {
                                              NSLog(@"Could not communicate to Google: %@", [error localizedDescription]);
                                          }
                                          else
                                          {
                                              NSError *parseError = nil;
                                              NSDictionary *darkSkyResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                                              [self.delegate didReceiveAPIResults2:darkSkyResponse];
                                              NSLog(@"%@", darkSkyResponse);
                                          }
                                          
                                      }];
    
    [dataTask resume];
}




@end


//  https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:32810&sensor=false