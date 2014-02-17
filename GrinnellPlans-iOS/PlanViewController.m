//
//  PlanViewController.m
//  GrinnellPlans-iOS
//
//  Created by Lea Marolt on 2/16/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import "PlanViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "MEZoomAnimationController.h"

@interface PlanViewController ()

@property (nonatomic, strong) MEZoomAnimationController *zoomTransition;

@end

@implementation PlanViewController

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
    
    self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
    self.slidingViewController.customAnchoredGestures = @[];
    [[self.navigationController.viewControllers.firstObject view] addGestureRecognizer:self.slidingViewController.panGesture];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
