//
//  AutoreadViewController.h
//  GrinnellPlans-iOS
//
//  Created by Lea Marolt on 2/16/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoreadViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
- (IBAction)markAsRead:(id)sender;

@end
