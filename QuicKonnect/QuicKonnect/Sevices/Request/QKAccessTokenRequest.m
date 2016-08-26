 //
//  QKAccessTokenRequest.m
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 16/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKAccessTokenRequest.h"
#import "MTLJSONAdapter.h"
#import "QKAccessTokenResponse.h"
#import "QKAccessTokenCriteria.h"


@implementation QKAccessTokenRequest
{
    responseCallback _responseCallback;
}



- (void) callAccessTokenServiceWithCriteria:(QKAccessTokenCriteria*)accessTokenCriteria withCallback:(responseCallback)callback
{
    _responseCallback = callback;
    
    self.requestId = RequestId_AccessTokenService;
    
      NSDictionary* inputDicObj = @{@"username": accessTokenCriteria.username,
     @"password": accessTokenCriteria.password,
     @"grant_type": accessTokenCriteria.grant_type,
     @"client_id": accessTokenCriteria.client_id,
     @"client_secret": accessTokenCriteria.client_secret
     };
    
    //username, password, grant_type, client_id, client_secret
    
    // @"image_url": signupCriteria.imgUrl
     
     NSDictionary* dicObj = @{@"Param": inputDicObj,
     @"methodName": @"o/token/"};
    
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
    
    
    [self parseAccessTokenData:responseData];
}


- (void) parseAccessTokenData:(id)responseData
{
    
     NSLog(@"%@",responseData);
    
    if (![responseData isKindOfClass:[NSDictionary class]]) {
        NSError* error = [[NSError alloc]initWithDomain:@"Data not found" code:12345 userInfo:@{@"userinfo": @"Data not found"}];
        _responseCallback(error, nil);
        return;
    }
    
    NSDictionary* responseDic = (NSDictionary*)responseData;
    
    NSLog(@"VIJAYA ACCESS_TOKEN : %@", [responseDic valueForKey:@"access_token"]);
    NSLog(@"VIJAYA TOKEN_TYPE : %@", [responseDic valueForKey:@"token_type"]);
    
    if ([responseDic objectForKey:@"data"] ==  [NSNull null]) {
        NSError* error = [[NSError alloc]initWithDomain:responseDic[@"status_message"] code:12345 userInfo:@{@"userinfo": responseDic[@"status_message"]}];
        _responseCallback(error, nil);
    }else{
        QKResponse* responseObj = [MTLJSONAdapter modelOfClass:[QKAccessTokenResponse class] fromJSONDictionary:responseDic error:nil];
        
        _responseCallback(nil, responseObj);
    }
}

@end
