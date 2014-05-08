//
//  Plan.m
//  GrinnellPlans-iOS
//
//  Created by Lea Marolt on 3/1/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import "Plan.h"

@implementation Plan

+(Plan*) planWithUsername:(NSString *)user andPlan:(NSString *)text andAutoRead1:(NSMutableArray *)auto1 andAutoRead2:(NSMutableArray *)auto2 andAutoRead3:(NSMutableArray *)auto3 {
    
    Plan *plan = [[Plan alloc] init];
    
    [plan setUsername:user];
    [plan setPlanText:text];
    
    return plan;
}

-(NSString*) loginSynchronouslyWithUsername: (NSString*)username Password:(NSString*)password {
    // Send a synchronous request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.grinnellplans.com/api/1/index.php?task=login"]];
    
    // Specify that it will be a POST request
    request.HTTPMethod = @"POST";
    // Convert your data and set request's HTTPBody property
    NSString *stringData = [NSString stringWithFormat: @"username=%@&password=%@",username,password];
    NSData *requestBodyData = [stringData dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = requestBodyData;
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:request
                                          returningResponse:&response
                                                      error:&error];
    
    NSString *gotstring = [NSString stringWithUTF8String:[data bytes]];
    
    if (error == nil)
    {
        return gotstring;
    }
    
    else return error.userInfo.description;
}
-(NSString*) retrieveAutoFingerListSynchronously{
    // Send a synchronous request
    NSURLRequest *urlrequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.grinnellplans.com/api/1/index.php?task=autofingerlist"]];
    NSURLResponse *response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlrequest
                                          returningResponse:&response
                                                      error:&error];
    
    NSString *gotstring = [NSString stringWithUTF8String:[data bytes]];
    
    if (error == nil)
    {
        return gotstring;
    }
    
    else return error.userInfo.description;
}

- (void)loginAsynchronouslyWithUsername: (NSString*)username Password:(NSString*)password completionHandler:(void (^)(NSString *response, NSError *error))completionHandler{
    
    [self sendPlansHTTPRequestWithTask:@"login" bodyData:[NSString stringWithFormat: @"username=%@&password=%@",username,password] completionHandler:completionHandler];
    
}
- (void)retrieveAutoFingerListAsynchronouslyWithCompletionHandler:(void (^)(NSString *response, NSError *error))completionHandler{
    
    [self sendPlansHTTPRequestWithTask:@"AutoFingerList" bodyData:nil completionHandler:completionHandler];
    
    
}

-(void)planWithUsername: (NSString*)username {
    
    [self sendPlansHTTPRequestWithTask:@"read" bodyData:[NSString stringWithFormat:@"username=%@",username] completionHandler:^(NSString *response, NSError *error) {
        
        NSMutableDictionary* responseDict;
        responseDict = [NSJSONSerialization JSONObjectWithData:[response dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
        
        if ([(NSString*)responseDict[@"success"] boolValue]){
        self.username = responseDict[@"plandata"][@"username"];
        //self.lastLogin = responseDict[@"plandata"][@"last_login"];
        //self.lastUpdated = responseDict[@"plandata"][@"last_updated"];
        self.partial = [(NSString*)responseDict[@"plandata"][@"partial"] boolValue];
        self.planText = responseDict[@"plandata"][@"plan"];
        self.pseudo = responseDict[@"plandata"][@"pseudo"];
        }
        else NSLog(@"There was a problem:, %@", responseDict[@"message"]);
    }];
    
}


-(void) sendPlansHTTPRequestWithTask: (NSString*)task bodyData: (NSString*)body completionHandler: (void (^)(NSString *response, NSError *error))completionHandler{
    // Set query URL
    NSURL *queryURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.grinnellplans.com/api/1/index.php?task=%@",task]];
    
    // Setup request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:queryURL];
    
    NSData *requestBodyData = [body dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod=@"POST";
    request.HTTPBody = requestBodyData;
    NSURLSession *URLSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *SessionDatatask =[URLSession dataTaskWithRequest:request completionHandler:^(NSData *responsedata, NSURLResponse *response, NSError *error){
        if (error){
            NSLog(@"%@",error.userInfo);
            
        }
        else {
            NSString *responseString = [NSString stringWithUTF8String:[responsedata bytes]];
            
            completionHandler(responseString, error);
        }
    }];
    [SessionDatatask resume];
}

@end
