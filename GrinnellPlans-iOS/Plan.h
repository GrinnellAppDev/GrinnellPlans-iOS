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
@property (nonatomic, strong) NSURL *planLink;
@property (nonatomic, strong) NSString *planText;
@property (nonatomic, strong) NSMutableArray *autoRead1;
@property (nonatomic, strong) NSMutableArray *autoRead2;
@property (nonatomic, strong) NSMutableArray *autoRead3;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;

-(id)planWithUsername:(NSString *)user andPlan:(NSString *)text andAutoRead1:(NSMutableArray *)auto1 andAutoRead2:(NSMutableArray *)auto2 andAutoRead3:(NSMutableArray *)auto3;

@end
