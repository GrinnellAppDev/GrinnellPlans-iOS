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
#import "Plan.h"


@interface PlanViewController () {
    P2MSTextView *textView;
    UIButton *kb, *alpha, *done;
}

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
    
    // setup swipe and button gestures for the sliding view controller
    self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
    self.slidingViewController.customAnchoredGestures = @[];
    [[self.navigationController.viewControllers.firstObject view] addGestureRecognizer:self.slidingViewController.panGesture];
    
    // get in logged in user
    // currently let's just pretend we have a user
    
    NSMutableArray *AR1 = [NSMutableArray arrayWithArray: @[@"maroltso", @"torresda", @"dixonpet"]];
    NSMutableArray *AR2 = [NSMutableArray arrayWithArray: @[@"daskalov", @"scaffaal", @"rebelsky"]];
    NSMutableArray *AR3 = [NSMutableArray arrayWithArray: @[@"moujaled", @"tremblay", @"cohnhann"]];
    
    // Let's make sure that when we ask for the API we ask for it to have newline characters - \n instead of <br> tags, because those won'r work! It would also be nice not to have <hr> tags... just saying
    NSString *attributedPlan = @"I'd <b>love</b> to meet up for coffee/dinner/dessert or all of the above :D! Let me know when you're free [woolerys]! I <strike>think</strike> we'll go ahead and make a responsive style sheet with bootstrap first, so people can get a hang of using it on their mobile devices, and then dive into the native app development.";
    
    NSString *test = @"<b>Saturday March 1, 2014. 3:12 PM</b><a href='http://www.grinnellplans.com/'>LEA</a>";
    
    Plan *myPlan = [[Plan alloc] planWithUsername:@"maroltso" andPlan:attributedPlan andAutoRead1:AR1 andAutoRead2:AR2 andAutoRead3:AR3];
    
//    self.usernameLabel.text = [NSString stringWithFormat:@"[%@]", myPlan.username];
//    self.planTextView.text = myPlan.planText;
    
    CGSize curSize = [UIScreen mainScreen].bounds.size;
    CGFloat curHeight = UIInterfaceOrientationIsPortrait([UIDevice currentDevice].orientation)?curSize.height:curSize.width;
    
    textView = [[P2MSTextView alloc]initWithFrame:CGRectMake(0, 65, 320, 250)];
    textView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.9];
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    textView.textViewDelegate = self;
    textView.inputAccessoryView = [self inputAccessoryView];
    [textView importHTMLString:attributedPlan];
    [self.view addSubview:textView];
    [textView becomeFirstResponder];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoDark];
    button.frame = CGRectMake(10, 250, 30, 30);
    [button addTarget:self action:@selector(exportString:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
	// Do any additional setup after loading the view.
    
    //self.tabBarController
    
    // set delegate for tabbar here
    self.tabBar.delegate = self;
//    textView.editable = NO;
    [textView setUserInteractionEnabled:NO];
    
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if([item.title isEqualToString:@"Edit"]) {
        // do something for this specific button
        textView.editable = YES;
        [textView setUserInteractionEnabled:YES];
        [textView becomeFirstResponder];
        [textView showKeyboard:KEYBOARD_TYPE_DEFAULT];
    }
    
    if ([item.title isEqualToString:@"NextPlan"]) {
        // TO DO: Make it go to some next plan
    }
}

- (IBAction)exportString:(id)sender{
    NSLog(@"HTML String :%@", [textView exportHTMLString]);
    NSLog(@"Plain Text :%@", textView.plainText);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)inputAccessoryView{
    CGSize curSize = [UIScreen mainScreen].bounds.size;
    CGFloat curWidth = UIInterfaceOrientationIsPortrait([UIDevice currentDevice].orientation)?curSize.width:curSize.height;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, curWidth, 30)];
    view.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.4];
    // change -100 (to -140 or more) to make room for more buttons on tab
    UIView *placeholder = [[UIView alloc]initWithFrame:CGRectMake(curWidth-140, 0, 120, 30)];
    placeholder.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [view addSubview:placeholder];
    
    alpha = [UIButton buttonWithType:UIButtonTypeCustom];
    [alpha setBackgroundImage:[UIImage imageNamed:@"alphabetKB-dim"] forState:UIControlStateNormal];
    alpha.frame = CGRectMake(0, 0, 40, 30);
    [alpha addTarget:self action:@selector(showFormatKB:) forControlEvents:UIControlEventTouchUpInside];
    [placeholder addSubview:alpha];
    
    kb = [UIButton buttonWithType:UIButtonTypeCustom];
    [kb setBackgroundImage:[UIImage imageNamed:@"keyboard_icon-hover"] forState:UIControlStateNormal];
    kb.frame = CGRectMake(40, 0, 40, 30);
    [kb addTarget:self action:@selector(showDefaultKB:) forControlEvents:UIControlEventTouchUpInside];
    [placeholder addSubview:kb];
    
    // add done button, make button save and upload new plan text through the API
    done = [UIButton buttonWithType:UIButtonTypeCustom];
    [done setBackgroundImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
    done.frame = CGRectMake(80, 0, 40, 30);
    [done addTarget:self action:@selector(saveEdits:) forControlEvents:UIControlEventTouchUpInside];
    [placeholder addSubview:done];
    
    // TO DO: add [ and ] buttons on top keyboard and make it create a link
    return view;
}

- (IBAction)showDefaultKB:(id)sender{
    [textView showKeyboard:KEYBOARD_TYPE_DEFAULT];
    if ([textView isFirstResponder]) {
        [sender setImage:[UIImage imageNamed:@"keyboard_icon-hover"] forState:UIControlStateNormal];
        [alpha setImage:[UIImage imageNamed:@"alphabetKB-dim"] forState:UIControlStateNormal];
        
    }
}

- (IBAction)saveEdits:(id)sender{
    // action for done button to resign the keyboard and
    // TODO: save what's been changed in the plan and upload it to the website
    
    NSMutableDictionary *attribs = [[NSMutableDictionary alloc] init];
    attribs = [textView getStyleAttributes];
    NSMutableArray *hyperLinks = [[NSMutableArray alloc] init];
    hyperLinks = [attribs objectForKey:@"links"];
    
    NSLog(@"Hyper Links: %@", hyperLinks.lastObject);
    
    for (P2MSLink *curLink in hyperLinks) {
    
        NSLog(@"The actual link: %@", curLink.linkURL);
    }
    
    textView.editable = NO;
    [textView setUserInteractionEnabled:NO];
    

    [textView resignFirstResponder];
}

- (IBAction)showFormatKB:(id)sender{
    [textView showKeyboard:KEYBOARD_TYPE_FORMAT];
    if ([textView isFirstResponder]) {
        [kb setImage:[UIImage imageNamed:@"keyboard_icon"] forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"alphabetKB"] forState:UIControlStateNormal];
    }
}

- (void)p2msTextViewDidChange:(P2MSTextView *)mytextView{
}

@end

