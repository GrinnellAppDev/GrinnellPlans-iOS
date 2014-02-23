//
//  AutoReadCell.h
//  GrinnellPlans-iOS
//
//  Created by Lea Marolt on 2/17/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoReadCell : UITableViewCell

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSURL *planLink;
@property (nonatomic) NSInteger level;

- (id) autoReadCellWithUsername:(NSString *)user andPlanLink:(NSURL *) link andLevel:(NSInteger) userLevel;

- (id) autoReadCellWithUsername:(NSString *)user andLevel:(NSInteger)userLevel;


@end
