//
//  ViewController.h
//  GrinnellPlans-iOS
//
//  Created by Lea Marolt on 2/3/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;


- (IBAction)connect:(id)sender;

@end
