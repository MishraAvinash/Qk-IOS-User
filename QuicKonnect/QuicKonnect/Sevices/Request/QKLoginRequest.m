//
//  QKLoginRequest.m
//  QuicKonnect
//
//  Created by Amit Naskar on 03/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKLoginRequest.h"
#import "MTLJSONAdapter.h"
#import "QKLoginResponse.h"
#import "QKLoginCriteria.h"

@implementation QKLoginRequest
{
    responseCallback _responseCallback;
}

- (void) callLoginServiceWithLoginCriteria:(QKLoginCriteria*)loginCriteria withCallback:(responseCallback)callback
{
    _responseCallback = callback;
    
    self.requestId = RequestId_LoginService;
    
    NSString *authStr = [NSString stringWithFormat:@"%@:%@",loginCriteria.Username, loginCriteria.password];
    
    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:0]];
    
    NSDictionary *inputDicObj =  @{@"Username": loginCriteria.Username,
                                   @"password": loginCriteria.password,
                                   };
    
    NSDictionary* dicObj = @{@"Param": inputDicObj,
                             @"aValue": authValue,
                             @"methodName": @"login/"};
    
    
    [self makeGetRequestWithParameter:dicObj];
}

#pragma mark - delegate method
- (void) requestFailed:(NSError *)error
{
    _responseCallback(error,nil);
}


- (void) requestSuccessed:(id)responseData
{
    [self parseLoginData:responseData];
}


- (void) parseLoginData:(id)responseData
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
        QKResponse* responseObj = [MTLJSONAdapter modelOfClass:[QKLoginResponse class] fromJSONDictionary:responseDic error:nil];
        _responseCallback(nil, responseObj);
    }
}




@end
