//
//  Plan.h
//  GrinnellPlans-iOS
//
//  Created by Lea Marolt on 3/1/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Plan : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSDate *lastLogin;
@property (strong, nonatomic) NSDate *lastUpdated;
@property BOOL partial;
@property (nonatomic, strong) NSString *planText;
@property (strong, nonatomic) NSString *pseudo;


- (void)loginAsynchronouslyWithUsername: (NSString*)username Password:(NSString*)password completionHandler:(void (^)(NSString *response, NSError *error))completionHandler;
-(NSString*) loginSynchronouslyWithUsername: (NSString*)username Password:(NSString*)password;
-(void)planWithUsername: (NSString*)username;

@end
