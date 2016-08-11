//
//  QKRegistrationVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 28/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKRegistrationVC.h"
#import "QKUpdateProfileVC.h"
#import "MTProgressIndicator.h"

#import "QKSignUpCriteria.h"
#import "QKCheckEmailRequest.h"
//#import "QkSignUpResponse.h"
#import "QKCheckEmailResponse.h"

@interface QKRegistrationVC ()
{
    BOOL terms;
    CALayer *bottomBorder, *bottomBorder1, *bottomBorder2, *bottomBorder3, *bottomBorder4, *bottomBorder5;
    NSString *termsAndConditions;
    
    QKSignUpCriteria* signupCrit;
}

@end

@implementation QKRegistrationVC

-(void) hideKeyBoard:(UIGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}
-(void)backToPriorView{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIImage *image = [UIImage imageNamed: @"ic_qk_logo"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(135, 5, 35, 29);
    imageView.center = CGPointMake(self.view.frame.size.width/2, imageView.center.y);
    [self.navigationController.navigationBar addSubview:imageView];
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    // [aButton setTitle:@"Cancel" forState:UIControlStateNormal];
    
    
    UIImage *aButton1 = [UIImage imageNamed:@"left-arrow2.png"];
    [aButton setBackgroundImage:aButton1 forState:UIControlStateNormal];
    aButton.frame = CGRectMake(-20,-10, 18, 22);
    [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    [aButton addTarget:self action:@selector(backToPriorView) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = backButton;
    
    self.firstnametxt.delegate = self;
    self.lastnametxt.delegate = self;
    self.emailidtxr.delegate = self;
    self.pwdtxt.delegate = self;
    
    terms=YES;
    
    
    self.emailidtxr.text=self.email;
    
    self.firstnametxt.text=self.firstname;
    self.lastnametxt.text=self.lastname;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Textfield delegates

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.firstnametxt resignFirstResponder];
    [self.lastnametxt resignFirstResponder];
    [self.emailidtxr resignFirstResponder];
    [self.pwdtxt resignFirstResponder];
    
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    bottomBorder.frame = CGRectMake(0.0f, textField.frame.size.height - 1, textField.frame.size.width, 2.0f);
    bottomBorder.backgroundColor = [UIColor orangeColor].CGColor;
    [textField.layer addSublayer:bottomBorder];
    
    
    if(textField.tag==3 || textField.tag == 4 || textField.tag == 5 )
    {
        [self animateTextField:textField up:YES];
    }
    if(textField.tag==4)
    {
        if([self.emailidtxr.text isEqual:@""]){
            [self.emailidtxr becomeFirstResponder];
        }
    }
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if(textField.tag==3 || textField.tag == 4 || textField.tag == 5 )
    {
        [self animateTextField:textField up:NO];
    }
    
    if(textField.tag==3)
    {
        
        NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailReg];
        
        if ([emailTest evaluateWithObject:self.emailidtxr.text] == NO)
        {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Enter the valid Mail id" message:@"please try with another email" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                self.emailidtxr.text=@"";
                [self.emailidtxr becomeFirstResponder];
            }]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });
            
        }
        
    }
    
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




- (IBAction)fbbtn:(id)sender
{
    
}

- (IBAction)switchbtn:(id)sender {
    
    UISwitch *switchObject = (UISwitch *)sender;
    if(switchObject.isOn){
        
        self.pwdtxt.secureTextEntry = NO;
        //self.lblShow.text=@"Switch State is Disabled";
    }else{
        
        self.pwdtxt.secureTextEntry = YES;
        //self.lblShow.text=@"Switch State is Enabled";
    }
}

- (IBAction)termsBtn:(id)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Terms of service" message:termsAndConditions preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
    }]];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
    
    
    // [self presentViewController:alertController animated:YES completion:nil];
}





/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)SignupBtn:(id)sender
{
    
    if([self checkLoginInfoNotNULL])
    {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
            
                [[MTProgressIndicator sharedIndicator] showProgressView];
                
            });
            
            [self callEmailCheckService];
        });
        
        
    }
    
    
    /* QKUpdateProfileVC *updateProfileVC = (QKUpdateProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKUpdateProfileVC"];
     updateProfileVC.profile_name = @"GeneralProfile";
     [self.navigationController pushViewController:updateProfileVC animated:YES];*/
}

- (BOOL) checkLoginInfoNotNULL
{
    
    if ([self.firstnametxt.text isEqualToString:@""]) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please Enter First Name" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
        }]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
        
        
        
        [self.firstnametxt becomeFirstResponder];
        return FALSE;
    }
    else if ([self.lastnametxt.text isEqualToString:@""]) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please Enter Last Name" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
        }]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
        
        
        [self.lastnametxt becomeFirstResponder];
        return FALSE;
    }
    else if ([self.emailidtxr.text isEqualToString:@""]) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please Enter Email" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
        }]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
        
        
        [self.emailidtxr becomeFirstResponder];
        return FALSE;
    }
    
    
    else if ([self.pwdtxt.text isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please Enter Password" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
        }]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
        
        
        [self.pwdtxt becomeFirstResponder];
        return FALSE;
    }
    else {
        return TRUE;
    }
}



- (void) callEmailCheckService
{
    //  [self showHUDProgress];
    
    
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    
     signupCrit = [[QKSignUpCriteria alloc] init];
    
    signupCrit.fName = self.firstnametxt.text;
    signupCrit.lName = self.lastnametxt.text;
    signupCrit.email = self.emailidtxr.text;
    signupCrit.password = self.pwdtxt.text;
    signupCrit.cDateStr = dateString;
    
    QKCheckEmailRequest* request = [[QKCheckEmailRequest alloc] init];
    [request callEmailCheckServiceWithCriteria:signupCrit withCallback:^(NSError* error, QKResponse* response){
        
        dispatch_async(dispatch_get_main_queue(), ^{
             
            [[MTProgressIndicator sharedIndicator] dismissProgressView];
            
        });
        
        if (error) {
            
            // NSLog(@"%@",error);
            
            return ;
        }
        
        QKCheckEmailResponse* emailResponse = (QKCheckEmailResponse*)response;
        NSString* checkEmail = emailResponse.emailCheck;
        //NSString* userId = [NSString stringWithFormat:@"%@",loginResponse.userid];
        
        NSLog(@"%@",checkEmail);
        if(![checkEmail isEqualToString:@"Email ID already exists"])
        {
            [self navigateToNext];
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QuicKonnect" message:@"Email already exists" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
}

-(void)navigateToNext
{
    QKUpdateProfileVC *updateProfileVC = (QKUpdateProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKUpdateProfileVC"];
    updateProfileVC.profile_name = @"GeneralProfile";
    updateProfileVC.signupCriteria = signupCrit;
    [self.navigationController pushViewController:updateProfileVC animated:YES];
}

@end
