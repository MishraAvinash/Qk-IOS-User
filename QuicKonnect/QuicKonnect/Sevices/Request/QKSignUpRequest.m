//
//  QKSignUpRequest.m
//  QuicKonnect
//
//  Created by Amit Naskar on 06/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKSignUpRequest.h"
#import "MTLJSONAdapter.h"
#import "QKSignUpResponse.h"
#import "QKSignUpCriteria.h"

#import "QKCheckEmailResponse.h"

@implementation QKSignUpRequest
{
    responseCallback _responseCallback;
}



- (void) callRegistrationServiceWithCriteria:(QKSignUpCriteria*)signupCriteria withCallback:(responseCallback)callback
{
    _responseCallback = callback;
    
    self.requestId = RequestId_SignupService;
    
      NSDictionary* inputDicObj = @{@"first_name": signupCriteria.fName,
     @"last_name": signupCriteria.lName,
    @"phone_number": signupCriteria.phNumber,
     @"email": signupCriteria.email,
     @"password": signupCriteria.password,
     @"last_updated_time": signupCriteria.cDateStr,
     };
    
    // @"image_url": signupCriteria.imgUrl
     
     NSDictionary* dicObj = @{@"Param": inputDicObj,
     @"methodName": @"api/v1/user/registration/details/"};
    
    [self makePostRequestWithParameter:dicObj];
}


#pragma mark - delegate method
- (void) requestFailed:(NSError *)error
{
    _responseCallback(error,nil);
}


- (void) requestSuccessed:(id)responseData
{
    
  //  NSLog(@"%@",[responseData valueForKey:@"Data"]);
    
    
    [self parseSignUpData:responseData];
}


- (void) parseSignUpData:(id)responseData
{
    
    // NSLog(@"%@",responseData);
    
    if (![responseData isKindOfClass:[NSDictionary class]]) {
        NSError* error = [[NSError alloc]initWithDomain:@"Data not found" code:12345 userInfo:@{@"userinfo": @"Data not found"}];
        _responseCallback(error, nil);
        return;
    }
    
    NSDictionary* responseDic = (NSDictionary*)responseData;
    
    if ([responseDic objectForKey:@"data"] ==  [NSNull null]) {
        NSError* error = [[NSError alloc]initWithDomain:responseDic[@"status_message"] code:12345 userInfo:@{@"userinfo": responseDic[@"status_message"]}];
        _responseCallback(error, nil);
    }else{
        QKResponse* responseObj = [MTLJSONAdapter modelOfClass:[QKSIgnUpResponse class] fromJSONDictionary:responseDic error:nil];
        
        _responseCallback(nil, responseObj);
    }
}




@end
