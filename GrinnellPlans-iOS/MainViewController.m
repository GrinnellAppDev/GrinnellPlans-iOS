//
//  MainViewController.m
//  GrinnellPlans-iOS
//
//  Created by Alex Mitchell on 5/5/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController
- (IBAction)mainMenuButtonClicked:(id)sender {
    [self.revealViewController revealToggle:sender];
    
}

- (IBAction)autoreadListButtonClicked:(id)sender {
    [self.revealViewController rightRevealToggle:sender];
}


- (void)viewDidLoad
{
    self.currentPlan.username = @"MITCHELL17";
    self.title = [NSString stringWithFormat:@"[%@]", [self.currentPlan.username lowercaseString]];
    
    
    [super viewDidLoad];
    self.currentPlan = [Plan new];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            NSLog(@"Remove from Autoread list");
            break;
        case 1:
            NSLog(@"Autoread 1");
            break;
        case 2:
            NSLog(@"Autoread 2");
            break;
        case 3:
            NSLog(@"Autoread 3");
            break;
            
        default:
            break;
    }
}

- (IBAction)autoreadSettingButtonClicked:(id)sender {
    UIActionSheet* actionsheet = [[UIActionSheet alloc] initWithTitle:[NSString stringWithFormat:@"Add [%@] to Autoread list", self.currentPlan.username] delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"None" otherButtonTitles:@"Level 1", @"Level 2", @"Level 3", nil];

    [actionsheet showFromBarButtonItem:sender animated:YES];
    
    
    }




@end
