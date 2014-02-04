//
//  ViewController.m
//  GrinnellPlans-iOS
//
//  Created by Lea Marolt on 2/3/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        if ([challenge.protectionSpace.host isEqualToString:@"http://www.grinnellplans.com/"])
        {
            [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
        }
        
        [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
    }
    else if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodHTTPBasic])
    {
        if ([challenge previousFailureCount] == 0)
        {
            NSURLCredential *newCredential;
            
            newCredential = [NSURLCredential credentialWithUser:self.usernameField.text password:self.passwordField.text persistence:NSURLCredentialPersistenceForSession];
            
            [[challenge sender] useCredential:newCredential forAuthenticationChallenge:challenge];
        }
        else
        {
            [[challenge sender] cancelAuthenticationChallenge:challenge];
            
            // inform the user that the user name and password
            // in the preferences are incorrect
            
            NSLog (@"failed authentication");
            
            // ...error will be handled by connection didFailWithError
        }
    }
}

- (IBAction)connect:(id)sender {
    [self connection:<#(NSURLConnection *)#> didReceiveAuthenticationChallenge:<#(NSURLAuthenticationChallenge *)#>]
}

@end
