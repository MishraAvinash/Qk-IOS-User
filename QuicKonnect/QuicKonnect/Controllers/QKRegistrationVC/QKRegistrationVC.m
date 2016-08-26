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
#import "QKCoreDataInterface.h"
#import "QKRequestInterface.h"


@interface QKRegistrationVC ()
{
    BOOL terms;
    CALayer *bottomBorder, *bottomBorder1, *bottomBorder2, *bottomBorder3, *bottomBorder4, *bottomBorder5;
    NSString *termsAndConditions;
    
    QKSignUpCriteria* signupCrit;
    QKAccessTokenCriteria* accessTokenCrit;
    
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
            
            [self callSignUpService];
        });
        
        
    }
  /*
    if([self checkLoginInfoNotNULL])
    {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [[MTProgressIndicator sharedIndicator] showProgressView];
                
            });
            
            [self callEmailCheckService];
        });
        
        
    }
*/
    
    
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
//VIJAYA - INTERFACE APPROACH - NOT WORKING
/*
- (void) callSignUpService
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:self.firstnametxt.text forKey:@"first_name"];
    [dic setObject:self.lastnametxt.text forKey:@"last_name"];
    [dic setObject:self.emailidtxr.text forKey:@"email"];
    [dic setObject:self.pwdtxt.text forKey:@"password"];
    
    QKRequestInterface* interface = [[QKRequestInterface alloc] init];
    [interface callSignUpService:dic withCallback:^(NSError *error, NSString *response){
        dispatch_async(dispatch_get_main_queue(), ^{
            [[MTProgressIndicator sharedIndicator] dismissProgressView];
            
        });
        
        if (error) {
            NSLog(@"%@",error);
            [self DisplayErrorAlert:response];
            return ;
        }
        
        NSLog(@"SIGNUP RESPONSE : %@", response);
        if([response isEqualToString:@"Success"])
            [self navigateToNext];
        else
            [self DisplayErrorAlert:response];
        
    }];
}
*/


//VIJAYA NEW CODE

/*
- (void) callSignUpService
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
    
    QKSignUpRequest* request = [[QKSignUpRequest alloc] init];
    
    [request callRegistrationServiceWithCriteria:signupCrit withCallback:^(NSError* error, QKResponse* response){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [[MTProgressIndicator sharedIndicator] dismissProgressView];
            
        });
        
        if (error) {
            NSLog(@"%@",error);
            return ;
        }
        
        QKSignUpResponse* signUpResponse = (QKSignUpResponse*)response;
        NSString* email = [NSString stringWithFormat:@"%@",signUpResponse.email];
        NSNumber* number = [signUpResponse Response];
        NSLog(@"%@", signUpResponse );
        if([number isEqualToNumber:[NSNumber numberWithInt:1]]) //Registration Success
        {
            //Get Access Token
            QKRequestInterface* interface = [[QKRequestInterface alloc] init];
            [interface callAccessTokenService:signUpResponse :nil :nil withCallback:^(NSError *error, NSString *response){
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [[MTProgressIndicator sharedIndicator] dismissProgressView];
                    
                });
                
                if (error) {
                    NSLog(@"%@",error);
                    return ;
                }
                
                NSLog(@"REQUEST INTERFACE ACCESS TOKEN CALL RESPONSE : %@", response);
                [self navigateToNext];
            }];
        }
        else if([email isEqualToString:@"Email Already existed. Please Enter New Email address!"])
        {
            [self DisplayErrorAlert:@"Email Already Exists."];
        }
        else
        {
            [self DisplayErrorAlert:@"Registration Error."];
        }
        
    }];
}

*/

- (void) callSignUpService
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
    
    QKSignUpRequest* request = [[QKSignUpRequest alloc] init];

    [request callRegistrationServiceWithCriteria:signupCrit withCallback:^(NSError* error, QKResponse* response){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [[MTProgressIndicator sharedIndicator] dismissProgressView];
            
        });
        
        if (error) {
            NSLog(@"%@",error);
            return ;
        }
        
        QKSignUpResponse* signUpResponse = (QKSignUpResponse*)response;
        NSString* client_id = [signUpResponse client_id];
        NSString* grant_type = [signUpResponse grant_type];
        
        NSString* email = [NSString stringWithFormat:@"%@",signUpResponse.email];
        NSNumber* number = [signUpResponse Response];
        
        
        NSLog(@"%@, %@",client_id, grant_type);
        NSLog(@"%@", signUpResponse );
        NSLog(@"%@", [signUpResponse email] );
        
        if([number isEqualToNumber:[NSNumber numberWithInt:1]]) //Registration Success
        {
            //Get Access Token
            [self callAccessTokenService:signUpResponse];
        }
        else if([email isEqualToString:@"Email Already existed. Please Enter New Email address!"])
        {
            [self DisplayErrorAlert:@"Email Already Exists"];
        }
        else
        {
            [self DisplayErrorAlert:@"Error while registering"];
        }
        
    }];
}
 

-(void) DisplayErrorAlert : (NSString*)errorMessage
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QuicKonnect" message:errorMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

- (void) callAccessTokenService : (QKSignUpResponse*)signUpResponse
{
    accessTokenCrit = [[QKAccessTokenCriteria alloc] init];
    NSString* login_email;
    
    if(signUpResponse != nil)
    {
        accessTokenCrit.username= signUpResponse.username;
        accessTokenCrit.client_id = signUpResponse.client_id;
        accessTokenCrit.client_secret = signUpResponse.client_secret;
        accessTokenCrit.grant_type = signUpResponse.grant_type;
    }
    else
    {
        //        NSEntityDescription* authorize = [QKCoreDataInterface fetchEntityFor:"Authorize" :"emailid" :login_email];
        
    }
    
    accessTokenCrit.password = self.pwdtxt.text;
    
    QKAccessTokenRequest* request = [[QKAccessTokenRequest alloc] init];
    
    [request callAccessTokenServiceWithCriteria:accessTokenCrit withCallback:^(NSError* error, QKResponse* response){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [[MTProgressIndicator sharedIndicator] dismissProgressView];
            
        });
        
        if (error) {
            
            NSLog(@"%@",error);
            
            return ;
        }
        
        QKAccessTokenResponse* accessTokenResponse = (QKAccessTokenResponse*)response;
        
        NSString* access_token = [ accessTokenResponse access_token];
        NSNumber* number = [signUpResponse Response];
        
        
        NSLog(@"%@",access_token);
        NSLog(@"%@", signUpResponse );
        
        if([number isEqualToNumber:[NSNumber numberWithInt:1]]) //Access Token Success
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            
            [dic setObject:self.pwdtxt.text forKey:@"password"];
            [dic setObject:self.emailidtxr.text forKey:@"emailid"];
            
            [QKCoreDataInterface saveAuthorization:accessTokenResponse :signUpResponse :@"" :dic];
            [self navigateToNext];
        }
        else
            [self DisplayErrorAlert:@"Error Retrieving Access Token"];
    }];
}

-(void)navigateToNext
{
    
    [QKCoreDataInterface saveLogin:signupCrit.email :signupCrit.password :false];
        
    QKUpdateProfileVC *updateProfileVC = (QKUpdateProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKUpdateProfileVC"];
    updateProfileVC.profile_name = @"GeneralProfile";
    updateProfileVC.signupCriteria = signupCrit;
    [self.navigationController pushViewController:updateProfileVC animated:YES];
}

@end
