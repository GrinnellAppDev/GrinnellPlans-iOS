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
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSDate *lastLogin;
@property (strong, nonatomic) NSDate *lastUpdated;
@property BOOL partial;
@property (nonatomic, strong) NSString *planText;
@property (strong, nonatomic) NSString *pseudo;
@property (strong, nonatomic) NSDictionary* autoreadList;

/**
 * Log in to plans and retrieve all the information associated with it.
 *
 * @param username A NSString* with user's username
 * @param password A NSString* with user's password
 * @param completionHandler What do with plan/error?
 * @return A new Plan object with all server info about username.
 */
+ (void) planWithUsername:(NSString*)username Password:(NSString*)password completionHandler:(void (^)(Plan *plan, NSError *error))completionHandler;
// Use planWithUsername:Credentials: to view a plan after logging in. Use the plan generated in planWithUsername:Password as creds.

/**
 * Retrieve specific user data from the Plans server.
 *
 * @param username A NSString* with requested user's username
 * @param creds A Plan* object with requesting user's login information
 * @param completionHandler What do with plan/error?
 * @return A new Plan object with public info about username.
 */

+ (void) planFromUsername:(NSString*)username Credentials:(Plan*)creds completionHandler:(void (^)(Plan *plan, NSError *error))completionHandler;

@end
