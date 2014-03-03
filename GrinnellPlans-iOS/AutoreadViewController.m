//
//  AutoreadViewController.m
//  GrinnellPlans-iOS
//
//  Created by Lea Marolt on 2/16/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import "AutoreadViewController.h"
#import "AutoReadCell.h"
#import "UIViewController+ECSlidingViewController.h"

@interface AutoreadViewController ()

@end

@implementation AutoreadViewController {
    NSArray *autoRead1;
    NSArray *autoRead2;
    NSArray *autoRead3;
    NSMutableArray *autoReadCells;
}

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
    
    autoRead1 = [[NSArray alloc] initWithObjects:@"maroltso", @"torresda", nil];
    autoRead2 = [[NSArray alloc] initWithObjects:@"maroltso", @"torresda", nil];
    autoRead3 = [[NSArray alloc] initWithObjects:@"maroltso", @"torresda", nil];
    
    autoReadCells = [[NSMutableArray alloc] init];
    
    
    NSLog(@"Autoread 1: %@", autoRead1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToAutoreadViewController: (UIStoryboardSegue *) segue {
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [autoRead1 count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
   
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"Level 1";
            break;
        case 1:
            sectionName = @"Level 2";
            break;
        default:
            sectionName = @"Level 3";
            break;
    }
    return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"Cell";
    
    AutoReadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        AutoReadCell *cell = [[AutoReadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = autoRead1[indexPath.row];
    return cell;
}

- (IBAction)markAsRead:(id)sender {
}
@end
