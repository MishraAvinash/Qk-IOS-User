//
//  QKRequestInterface.m
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 17/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKRequestInterface.h"

#import "QKSignUPResponse.h"

#import "QKLoginResponse.h"
#import "QKAccessTokenResponse.h"
#import "QKSignUpResponse.h"

#import "QKLoginCriteria.h"
#import "QKAccessTokenCriteria.h"
#import "QKSignUpCriteria.h"

#import "QKLoginRequest.h"
#import "QKAccessTokenRequest.h"
#import "QKSignUpRequest.h"

#import "MTProgressIndicator.h"

#import "QKCoreDataInterface.h"


@implementation QKRequestInterface
{
    interfaceCallback _interfaceCallback;
}

- (void) callAccessTokenService : (QKSignUpResponse*)signUpResponse :(NSString*)email :(NSString*)password withCallback:(interfaceCallback)callback
{
    _interfaceCallback = callback;
    
    QKAccessTokenCriteria* accessTokenCrit = [[QKAccessTokenCriteria alloc] init];
    
    if(signUpResponse != nil)
    {
        accessTokenCrit.username= signUpResponse.username;
        accessTokenCrit.client_id = signUpResponse.client_id;
        accessTokenCrit.client_secret = signUpResponse.client_secret;
        accessTokenCrit.grant_type = signUpResponse.grant_type;
    }
    else
    {
        NSEntityDescription* authorize = [QKCoreDataInterface fetchEntityFor:@"Authorize" : @"emailid" :email];
        accessTokenCrit.username = [authorize valueForKey:@"username"];
        accessTokenCrit.client_id = [authorize valueForKey:@"client_id"];
        accessTokenCrit.client_secret = [authorize valueForKey:@"client_secret"];
        accessTokenCrit.grant_type = [authorize valueForKey:@"grant_type"];
    }
    
    accessTokenCrit.password = password;
    
    QKAccessTokenRequest* request = [[QKAccessTokenRequest alloc] init];
    
    [request callAccessTokenServiceWithCriteria:accessTokenCrit withCallback:^(NSError* error, QKResponse* response){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [[MTProgressIndicator sharedIndicator] dismissProgressView];
            
        });
        
        if (error) {
            
            NSLog(@"%@",error);
            
           _interfaceCallback(error, @"Error Retrieving Access Token");
        }
        
        QKAccessTokenResponse* accessTokenResponse = (QKAccessTokenResponse*)response;
        
        NSString* access_token = [ accessTokenResponse access_token];
        NSLog(@"%@",access_token);
        NSLog(@"Access Token Response : %@", accessTokenResponse );
        
        NSNumber* number = [accessTokenResponse Response];
        if(![access_token isEqualToString:@""]) //Access Token Success
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            
            [dic setObject:password forKey:@"password"];
            [dic setObject:email forKey:@"emailid"];

            [QKCoreDataInterface saveAuthorization:accessTokenResponse :signUpResponse :email :dic];
            
             _interfaceCallback(nil, @"Success");
        }
        else
            _interfaceCallback(nil, @"Error Retrieving Access Token");
    }];
}


- (void) callLoginService :(NSString*)email :(NSString*)password withCallback:(interfaceCallback)callback
{
    _interfaceCallback = callback;
    
    QKLoginCriteria* loginCrit = [[QKLoginCriteria alloc] init];
    loginCrit.Username = email;
    loginCrit.password = password;
    
    QKLoginRequest* request = [[QKLoginRequest alloc] init];
    
    NSString *authStr = [NSString stringWithFormat:@"%@:%@",email, password];

    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    
    request.authorizationString = [NSString stringWithFormat:@"Basic %@", [authData base64Encoding]];

    [request callLoginServiceWithLoginCriteria:loginCrit withCallback:^(NSError* error, QKResponse* response){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[MTProgressIndicator sharedIndicator] dismissProgressView];
            NSLog(@"DISPATCH MAIN QUEUE - CALL LOGIN SERVICE - REQUEST INTERFACE");
         /*
            self.email.text=@"";
            self.password.text=@"";
            
            self.loadingView.hidden = YES;
            self.scrollView.hidden = NO;
            [self dismissProgressOneView]; */
            
        });
        
        if (error) {
            
            NSLog(@"%@",error);
            _interfaceCallback(error, @"Login Error.");
            return ;
        }
        QKLoginResponse* loginResponse = (QKLoginResponse*)response;
        
        NSLog(@"Login Response : %@", loginResponse );
        
        NSNumber* number = [loginResponse Response];
        if([number isEqualToNumber:[NSNumber numberWithInt:1]]) //Access Token Success
        {
            NSMutableDictionary *dic1 = (NSMutableDictionary*)[loginResponse dictionaryValue];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:dic1];

            [dic setValue:password forKey:@"password"];
            [dic setValue:email forKey:@"email"];
            
            [QKCoreDataInterface saveAuthorization:nil :nil :email :dic];
            
            //Get Access Token
            QKRequestInterface* interface = [[QKRequestInterface alloc] init];
            [interface callAccessTokenService:nil :email :password withCallback:^(NSError *error, NSString *response){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[MTProgressIndicator sharedIndicator] dismissProgressView];
                    NSLog(@"DISPATCH MAIN QUEUE - ACCESS TOKEN SERVICE - REQUEST INTERFACE");
                    
                    if (error) {
                        NSLog(@"%@",error);
                        //_interfaceCallback(nil, @"Access Token Error");
                        return ;
                    }
                    if([response isEqualToString:@"Success"])
                        _interfaceCallback(nil, @"Success");
                    else
                        _interfaceCallback(nil, @"Access Token Error");
                    return;
                });
                
            }];
            // _interfaceCallback(nil, @"Success");
        }
        else
            _interfaceCallback(nil, @"Invalid username/password.");
    }];
}

- (void) callSignUpService :(NSDictionary*)dic withCallback:(interfaceCallback)callback
{
    _interfaceCallback = callback;
    
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    
    QKSignUpCriteria* signupCrit = [[QKSignUpCriteria alloc] init];
    
    signupCrit.fName = [dic valueForKey:@"first_name"];
    signupCrit.lName = [dic valueForKey:@"last_name"];
    signupCrit.email = [dic valueForKey:@"email"];
    signupCrit.password = [dic valueForKey:@"password"];
    signupCrit.cDateStr = dateString;

    
    QKSignUpRequest* request = [[QKSignUpRequest alloc] init];
    
    [request callRegistrationServiceWithCriteria:signupCrit withCallback:^(NSError* error, QKResponse* response){
        dispatch_async(dispatch_get_main_queue(), ^{
     //       [[MTProgressIndicator sharedIndicator] dismissProgressView];
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
        NSLog(@"Sign Up Response : %@", signUpResponse );
        //NSLog(@"%@", [signUpResponse email] );
        
        if([number isEqualToNumber:[NSNumber numberWithInt:1]]) //Registration Success
        {
            //Get Access Token
            [self callAccessTokenService:signUpResponse :signupCrit.email :signupCrit.password withCallback:^(NSError* error, NSString* response){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[MTProgressIndicator sharedIndicator] dismissProgressView];
                    if (error) {
                        NSLog(@"%@",error);
                        return ;
                    }
                    if([response isEqualToString:@"Success"]) //Access Token Success
                    {
                        _interfaceCallback(nil, @"Success");
                    }

                });
                
            }];

        }
        else if([email isEqualToString:@"Email Already existed. Please Enter New Email address!"])
        {
            //[self DisplayErrorAlert:@"Email Already Exists"]; //VIJAYA TBD
            _interfaceCallback(nil, @"Email Already Exists.");
        }
        else
        {
            _interfaceCallback(nil, @"Error while registering.");
            //[self DisplayErrorAlert:@"Error while registering"]; VIJAYA TBD
        }
        
    }];
}





@end
