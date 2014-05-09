//
//  MainMenuTableViewController.m
//  GrinnellPlans-iOS
//
//  Created by Alex Mitchell on 5/8/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import "MainMenuTableViewController.h"

@interface MainMenuTableViewController ()

@end

@implementation MainMenuTableViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [self.revealViewController pushFrontViewController:segue.destinationViewController animated:YES];
    
}

@end
