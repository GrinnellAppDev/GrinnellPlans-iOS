//
//  MainViewController.h
//  GrinnellPlans-iOS
//
//  Created by Alex Mitchell on 5/5/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "Plan.h"

@interface MainViewController : UIViewController <UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *autoreadIndicator;

@property Plan* currentPlan;

@end
