//
//  AutoreadViewController.m
//  GrinnellPlans-iOS
//
//  Created by Lea Marolt on 2/16/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import "AutoreadViewController.h"

@interface AutoreadViewController ()

@end

@implementation AutoreadViewController {
    NSArray *autoRead1;
    NSArray *autoRead2;
    NSArray *autoRead3;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = autoRead1[indexPath.row];
    return cell;
}

@end
