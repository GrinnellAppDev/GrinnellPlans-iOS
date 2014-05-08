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


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.currentPlan = [Plan new];
    self.currentPlan.username = @"mitchell17";
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    
    //[[Plan new] loginSynchronouslyWithUsername:@"mitchell17" Password:@"8YigOaCdAhpz"];
    //self.currentPlan = [Plan new];
    //[self.currentPlan planWithUsername:@"mitchell17"];
    //NSLog(@"%@: %@",self.currentPlan.username, self.currentPlan.planText);
    self.navBar.title = [NSString stringWithFormat:@"[%@]", self.currentPlan.username ];
    //self.textView.text = self.currentPlan.planText;
    
    
    // Do any additional setup after loading the view.
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
