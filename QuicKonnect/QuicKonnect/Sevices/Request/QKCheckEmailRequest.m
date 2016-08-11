//
//  QKCheckEmailRequest.m
//  QuicKonnect
//
//  Created by Amit Naskar on 06/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKCheckEmailRequest.h"
#import "MTLJSONAdapter.h"
#import "QKSignUpCriteria.h"

#import "QKCheckEmailResponse.h"

@implementation QKCheckEmailRequest
{
    responseCallback _responseCallback;
}

- (void) callEmailCheckServiceWithCriteria:(QKSignUpCriteria*)signupCriteria withCallback:(responseCallback)callback
{
    _responseCallback = callback;
    
    self.requestId = RequestId_CheckEmailService;
    
    NSString *methodName = [NSString stringWithFormat:@"emailCheck/%@",signupCriteria.email];
    
    [self makeGetRequestTOCheckEmailWithMethodName:methodName];
}

#pragma mark - delegate method
- (void) requestFailed:(NSError *)error
{
    _responseCallback(error,nil);
}


- (void) requestSuccessed:(id)responseData
{
    
    //  NSLog(@"%@",[responseData valueForKey:@"Data"]);
    
     [self parseEmailCheckData:responseData];
    
}


- (void) parseEmailCheckData:(id)responseData
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
        QKResponse* responseObj = [MTLJSONAdapter modelOfClass:[QKCheckEmailResponse class] fromJSONDictionary:responseDic error:nil];
        
        _responseCallback(nil, responseObj);
    }
}




@end
