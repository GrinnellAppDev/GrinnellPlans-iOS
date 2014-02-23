//
//  AutoReadCell.m
//  GrinnellPlans-iOS
//
//  Created by Lea Marolt on 2/17/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import "AutoReadCell.h"

@implementation AutoReadCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id) autoReadCellWithUsername:(NSString *)user andPlanLink:(NSURL *)link andLevel:(NSInteger)userLevel {
    AutoReadCell *cell = [[AutoReadCell alloc] init];
    
    [cell setUsername:user];
    [cell setLevel:userLevel];
    [cell setPlanLink:link];
    
    return cell;
}

- (id) autoReadCellWithUsername:(NSString *)user andLevel:(NSInteger)userLevel {
    AutoReadCell *cell = [[AutoReadCell alloc] init];
    
    [cell setUsername:user];
    [cell setLevel:userLevel];
    
    return cell;
}

@end
