//
//  QKProfileFillingRequest.m
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 20/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKProfileFillingRequest.h"
#import "MTLJSONAdapter.h"
#import "QKProfileFillingResponse.h"
#import "GenProfile.h"
#import "QKCoreDataInterface.h"  //VIJAYA


@implementation QKProfileFillingRequest
{
    responseCallback _responseCallback;
}




- (void) callProfileFillingService:(GenProfile*)genProfileObj withCallback:(responseCallback)callback
{
    _responseCallback = callback;
    
    self.requestId = RequestId_ProfileFillingService;
  //  self.accessToken = [QKCoreDataInterface getAccessToken:genProfileObj.email];
    
    NSLog(@"ACCESS TOKEN : %@", self.authorizationString);
    
    /*
     
     Mandatory Fields=>
     qtag, profile_type, profile_name, is_main_profile, qk_profile, created_date, display_name, mobile_phone, email_personal.
     
     Other than Mandatory fields=>
     
     first_name , last_name , suffix , sex , hometown , country , current_location , about_me , photo , home_phone , work_phone , phone_other , email_work, website, facebook, twitter,linkedin, snapchat, instagram, google_plus, grauation_date_school, grauation_date_college, engagement_date, marriage_date, activities, sports, tv_shows, movies, music, books, high_school, college, company_name, job_title, custom_fields

     
     */
    
    NSDictionary* inputDicObj = [genProfileObj getDictionary];
    
    NSDictionary* dicObj = @{@"Param": inputDicObj,
                             @"methodName": @"quserProfile/"
                            };
    
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
    
    
    [self parseUpdateProfileData:responseData];
}


- (void) parseUpdateProfileData:(id)responseData
{
    
    NSLog(@"%@",responseData);
    
    if (![responseData isKindOfClass:[NSDictionary class]]) {
        NSError* error = [[NSError alloc]initWithDomain:@"Data not found" code:12345 userInfo:@{@"userinfo": @"Data not found"}];
        _responseCallback(error, nil);
        return;
    }
    
    /*
     
     "data":
     {
     "result": "Your general profile was saved successfully",
     "ZipCode_Server_Id": XXX,
     "server_profile_id": XXX,
     "qUser_Address_ServerId": XXX,
     "City_Names_Server_Id": XXX
     },
     "Response": 1

     
     */
    
    NSDictionary* responseDic = (NSDictionary*)responseData;
    
    NSLog(@"VIJAYA UPDATE PROFILE RESULT : %@", [responseDic valueForKey:@"data.result"]);
    NSLog(@"VIJAYA UPDATE PROFILE RESPONSE : %@", [responseDic valueForKey:@"response"]);
    if ([responseDic objectForKey:@"data"] ==  [NSNull null]) {
        NSError* error = [[NSError alloc]initWithDomain:responseDic[@"status_message"] code:12345 userInfo:@{@"userinfo": responseDic[@"status_message"]}];
        _responseCallback(error, nil);
    }else{
        QKResponse* responseObj = [MTLJSONAdapter modelOfClass:[QKProfileFillingResponse class] fromJSONDictionary:responseDic error:nil];

        _responseCallback(nil, responseObj);
    }
}

@end

