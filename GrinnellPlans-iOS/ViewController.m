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

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertStatus:(NSString *)msg withTitle:(NSString *)title {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    [alertView show];
}

- (IBAction)connect:(id)sender {
    
        @try {
            if ([self.usernameField.text isEqualToString:@""] || [self.passwordField.text isEqualToString:@""]) {
                [self alertStatus:@"Please enter both Username and Password" withTitle:@"Login Failed!"];
            } else {
                NSString *post = [[NSString alloc] initWithFormat:@"username=%@&password=%@&submit=Login&js_test_value=on", self.usernameField.text, self.passwordField.text];
                //NSLog(@"PostData: %@",post);
                
                NSURL *url = [NSURL URLWithString:@"http://grinnellplans.com/index.php"];
                
                NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
                
                NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
                
                NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                [request setURL:url];
                [request setHTTPMethod:@"POST"];
                [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
                [request setValue:@"application/html" forHTTPHeaderField:@"Accept"];
                [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
                [request setHTTPBody:postData];
                
                NSError *error = [[NSError alloc] init];
                NSHTTPURLResponse *response = nil;
                NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
                
                //NSLog(@"Response code: %d", [response statusCode]);
                if ([response statusCode] >= 200 && [response statusCode] < 300) {
                    NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                     //NSLog(@"Response ==> %@", responseData);
                    
                    NSRange loginIndicator = [responseData rangeOfString:@"Plans 3"];
                    BOOL success = (NSNotFound == loginIndicator.location) ? FALSE : TRUE;
                    
                    if (success) {
                        NSLog(@"Login SUCCESS");
                        // [self alertStatus:@"Logged in Successfully." withTitle:@"Login Success!"];
                        // TODO - Handle successful login
                    } else {
                        //NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                        [self alertStatus:nil withTitle:@"Login Failed!"];
                    }
                } else {
                    if(error) {
                        NSLog(@"Error: %@", error);
                    }
                    [self alertStatus:@"Connection Failed" withTitle:@"Login Failed!"];
                }
            }
        }
        @catch(NSException * e) {
            NSLog(@"Exception: %@", e);
            [self alertStatus:@"Login Failed." withTitle:@"Login Failed!"];
        }
}

@end
