//
//  MenuViewController.m
//  GrinnellPlans-iOS
//
//  Created by Lea Marolt on 2/16/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import "MenuViewController.h"
#import "UIViewController+ECSlidingViewController.h"


@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize menuContent, cellIdentifier;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.menuContent = [NSArray arrayWithObjects:@"QuickLove", @"Preferences", @"Log Out", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToMenuViewController: (UIStoryboardSegue *) segue {
    
}

#pragma Table View Methods


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuContent.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.cellIdentifier = @"menuCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [menuContent objectAtIndex:indexPath.row];
    
    return cell;
}

@end
