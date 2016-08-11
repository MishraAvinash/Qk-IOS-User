//
//  Request.h
//  TrackMyHealth
//
//  Created by Developer on 13/03/14.
//  Copyright (c) 2014 XYZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QKResponse.h"

typedef enum {
    RequestType_GET,
    RequestType_POST,
}RequestType;


typedef enum {
    RequestId_LoginService,
    RequestId_SignupService,
    RequestId_CheckEmailService
   
}RequestId;


//extern NSString *const kLoginServiceURL;

//extern NSString *const kMethodName;


typedef void (^responseCallback)(NSError* error, QKResponse* response);

@interface Request : NSObject

//@property (nonatomic,strong) NSString* methodName;
@property (nonatomic,assign) RequestType requestType;
@property (nonatomic,assign) RequestId requestId;


- (void) makeGetRequestTOCheckEmailWithMethodName:(NSString *)methodName;
- (void) makeRequestWithParameter:(NSDictionary*)requestParameter;
- (void) makeGetRequestWithParameter:(NSDictionary*)requestParameter;
- (void) makePostRequestWithParameter:(NSDictionary*)requestParameter;


- (void) requestSuccessed:(id)responseData;
- (void) requestFailed:(NSError*)error;

@end
