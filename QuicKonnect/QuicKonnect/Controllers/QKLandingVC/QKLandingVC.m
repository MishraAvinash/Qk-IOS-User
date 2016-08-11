//
//  QKLandingVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 25/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKLandingVC.h"
#import "Reachability.h"
#import "RPFloatingPlaceholderTextField.h"
#import "MTProgressIndicator.h"
#import "JVFloatLabeledTextField.h"

#import "MFSideMenuContainerViewController.h"
#import "QKHomeNavController.h"
#import "QKSliderNavController.h"

#import "QKLoginCriteria.h"
#import "QKLoginRequest.h"
#import "QkLoginResponse.h"

@interface QKLandingVC ()

@end

@implementation QKLandingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Add an observer that will respond to NavigateToSlider
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(navigateToSlider)
                                                 name:@"NavigateToSlider" object:nil];
    
    
    self.loadingView.hidden = YES;
    self.scrollView.hidden = NO;
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if(status == NotReachable)
    {
        //No internet
        // NSLog(@"no internet");
        wifistatus=@"NoWifi";
        
        
        [self.Registerbtnout setEnabled:NO];
        self.Registerbtnout.userInteractionEnabled = NO;
        
        
        [self.siginbtnout setEnabled:NO];
        self.siginbtnout.userInteractionEnabled = NO;
        
    }
    else if (status == ReachableViaWiFi)
    {
        //WiFi
        
        // NSLog(@"wifi is on");
        wifistatus=@"Wifi";
        [self.Registerbtnout setEnabled:YES];
        self.Registerbtnout.userInteractionEnabled = YES;
        
        [self.siginbtnout setEnabled:YES];
        self.siginbtnout.userInteractionEnabled = YES;
        
    }
    else if (status == ReachableViaWWAN)
    {
        //3G
        //  NSLog(@"3g is on");
        
    }
    
    self.email.delegate = self;
    self.password.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


#pragma mark - Textfield delegates

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.email){
        [self.email resignFirstResponder];
    }
    else if(textField == self.password){
        [self.password resignFirstResponder];
    }
    return YES;
}


-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    const int movementDistance = -130; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    [self animateTextField:textField up:YES];
    if(textField.tag==1)
    {
        
        
        if([self.email.text isEqual:@""]){
            [self.email becomeFirstResponder];
        }
    }
    if(textField.tag==2)
    {
        
        if([self.email.text isEqual:@""]){
            [self.email becomeFirstResponder];
        }
    }
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
    if(textField.tag==1)
    {
        
        NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailReg];
        
        if ([emailTest evaluateWithObject:self.email.text] == NO)
        {
            
            //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter the Valid Mail id" message:@"Please Try with another email" delegate:nil cancelButtonTitle:@"okay" otherButtonTitles:nil];
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Enter the Valid Mail id" message:@"Please Enter UserName" preferredStyle:UIAlertControllerStyleAlert];
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                //[self dismissViewControllerAnimated:YES completion:nil];
                
            }]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });
            
            
            
            self.email.text=@"";
            [self.email becomeFirstResponder];
            
            //[alert show];
            
            // [self.emailidtxr becomeFirstResponder];
            
            
            
        }
    }
}

#pragma mark - Register profile delegates
- (void)callRegisterProfileDelegateMethod{
    [self navigateToSlider];
}

#pragma mark - Register and Signin button action

- (IBAction)sigiInButtonAction:(UIButton *)sender {
    
    if ([self checkLoginInfoNotNULL ]) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.scrollView.hidden = YES;
                self.loadingView.hidden = NO;
                [[MTProgressIndicator sharedIndicator] showProgressView];
                
            });
            
            [self callLoginService];
            
        });
    }
}

- (void) callLoginService
{
    //  [self showHUDProgress];
    
    QKLoginCriteria* loginCrit = [[QKLoginCriteria alloc] init];
    loginCrit.Username = self.email.text;
    loginCrit.password = self.password.text;
    
    QKLoginRequest* request = [[QKLoginRequest alloc] init];
    [request callLoginServiceWithLoginCriteria:loginCrit withCallback:^(NSError* error, QKResponse* response){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.email.text=@"";
            self.password.text=@"";
            
            self.loadingView.hidden = YES;
            self.scrollView.hidden = NO;
            [self dismissProgressOneView];
            
        });
        
        if (error) {
            
           // NSLog(@"%@",error);
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QuicKonnect" message:@"Invalid username/password." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
            return ;
        }
        
        QKLoginResponse* loginResponse = (QKLoginResponse*)response;
        NSString* username = loginResponse.username;
       //NSString* userId = [NSString stringWithFormat:@"%@",loginResponse.userid];
        
        NSLog(@"%@",username);
        
         [self navigateToSlider];
    }];
}
- (BOOL) checkLoginInfoNotNULL
{
    
    if ([self.email.text isEqualToString:@""]) {
        //        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Please Enter UserName" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        //
        //        [alertView show];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Please enter Valid Email ID" message:@"Please Enter UserName" preferredStyle:UIAlertControllerStyleAlert];
        
        //        NSMutableAttributedString *hogan = [[NSMutableAttributedString alloc] initWithString:@"Please enter Valid Email ID"];
        //        [hogan addAttribute:NSFontAttributeName
        //                      value:[UIFont fontWithName:@"PTSans-Regular" size:13.0]
        //                      range:NSMakeRange(24, 11)];
        
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            //[self dismissViewControllerAnimated:YES completion:nil];
            
        }]];
        
        // [alertController setValue:hogan forKey:@"attributedTitle"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
        
        
        [self.email becomeFirstResponder];
        
        return FALSE;
    }
    else if ([self.password.text isEqualToString:@""]) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please Enter password" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *actio){
            
        }]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
        
        [self.password becomeFirstResponder];
        return FALSE;
    }
    
    else {
        return TRUE;
    }
}
-(void)dismissProgressOneView{
    [[MTProgressIndicator sharedIndicator] dismissProgressView];
}


- (IBAction)resgisterButtonAction:(UIButton *)sender {
    
}

#pragma mark - Navigate to MFSliderVC

- (void)navigateToSlider {
    
    QKHomeNavController *welcomeNav = [self.storyboard instantiateViewControllerWithIdentifier:@"QKHomeNavController"];
    
    
    MFSideMenuContainerViewController *container = [self.storyboard instantiateViewControllerWithIdentifier:@"MFSideMenuContainerViewController"];
    
    
    [container setCenterViewController:welcomeNav];
    
    
    QKSliderNavController *leftNavVC = [self.storyboard instantiateViewControllerWithIdentifier:@"QKSliderNavController"];
    
    
    [container setLeftMenuViewController:leftNavVC];
    
    //  [self.navigationController pushViewController:container animated:YES];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // [self dismissProgressOneView];
        [self presentViewController:container animated:YES completion:nil];
        
        /* self.scrollView.hidden = NO;
         self.loadingView.hidden = YES;
         
         self.email.text = @"";
         self.password.text = @"";*/
    });
}

@end
