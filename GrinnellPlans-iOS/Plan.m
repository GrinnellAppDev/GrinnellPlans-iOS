//
//  Plan.m
//  GrinnellPlans-iOS
//
//  Created by Lea Marolt on 3/1/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import "Plan.h"

@implementation Plan

-(id) planWithUsername:(NSString *)user andPlan:(NSString *)text andAutoRead1:(NSMutableArray *)auto1 andAutoRead2:(NSMutableArray *)auto2 andAutoRead3:(NSMutableArray *)auto3 {
    
    Plan *plan = [[Plan alloc] init];
    
    [plan setUsername:user];
    [plan setPlanText:text];
    NSURL *planLink = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.grinnellplans.com/read.php?searchname=%@", plan.username]];
    
    [plan setPlanLink:planLink];
    [plan setAutoRead1:auto1];
    [plan setAutoRead2:auto2];
    [plan setAutoRead3:auto3];
    
    return plan;
}

@end
