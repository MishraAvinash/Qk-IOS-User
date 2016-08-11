
//
//  Request.m
//  TrackMyHealth
//
//  Created by Developer on 13/03/14.
//  Copyright (c) 2014 XYZ. All rights reserved.
//

#import "Request.h"
#import <AFNetworking/AFNetworking.h>
#import "AFHTTPSessionManager.h"
#import "UIActivityIndicatorView+AFNetworking.h"


#define BASE_URL @"http://54.254.188.60/"


//NSString *const kLoginServiceURL=@"User_Login";

//NSString *const kMethodName = @"api.php";


@implementation Request

- (instancetype)init
{
    self = [super init];
    if (self) {
        //self.methodName = kMethodName;
    }
    return self;
}

- (void) makeRequestWithParameter:(NSDictionary*)requestParameter
{
    if (_requestType == RequestType_GET) {
        [self makeGetRequestWithParameter:requestParameter];
    }else{
        [self makePostRequestWithParameter:requestParameter];
    }
}

- (void) makeGetRequestTOCheckEmailWithMethodName:(NSString *)methodName
{
    /* if (_methodName == nil) {
     if ([self respondsToSelector:@selector(requestFailed:)]) {
     NSError* error = [[NSError alloc]initWithDomain:@"Method Name nil" code:123 userInfo:@{@"userinfo": @"Method name cannot be nil"}];
     [self requestFailed:error];
     }
     return;
     }*/
    
    
    NSURL *baseURL = [NSURL URLWithString:BASE_URL];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:configuration];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    [manager GET:methodName parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        // NSLog(@"Success: %@", responseObject);
        
        [self requestSuccessed:responseObject];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
     //   NSLog(@"Error: %@", error);
        
        [self requestFailed:error];
    }];
}


- (void) makeGetRequestWithParameter:(NSDictionary*)requestParameter
{
   /* if (_methodName == nil) {
        if ([self respondsToSelector:@selector(requestFailed:)]) {
            NSError* error = [[NSError alloc]initWithDomain:@"Method Name nil" code:123 userInfo:@{@"userinfo": @"Method name cannot be nil"}];
            [self requestFailed:error];
        }
        return;
    }*/

    
    NSURL *baseURL = [NSURL URLWithString:BASE_URL];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:configuration];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    [manager.requestSerializer setValue:[requestParameter valueForKey:@"aValue"] forHTTPHeaderField:@"Authorization"];
    
    //NSLog(@"%@",[requestParameter valueForKey:@"aValue"]);
    
    [manager GET:[requestParameter valueForKey:@"methodName"] parameters:[requestParameter valueForKey:@"Param"] progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
       // NSLog(@"Success: %@", responseObject);
        
        [self requestSuccessed:responseObject];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //NSLog(@"Error: %@", error);
        
        [self requestFailed:error];
    }];

    
   /* NSError *error;
  NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_URL,[requestParameter valueForKey:@"methodName"]];

    
    NSURL *url                = [NSURL URLWithString:urlString];
    
    NSData *jsonInputData     = [NSJSONSerialization dataWithJSONObject:[requestParameter valueForKey:@"Param"] options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonInputString = [[NSString alloc] initWithData:jsonInputData encoding:NSUTF8StringEncoding];
    NSLog(@"converted JOSN Data %@",jsonInputString);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:[requestParameter valueForKey:@"aValue"] forHTTPHeaderField:@"Authorization"];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse: nil error:&error];
    NSDictionary *JSON =
    [NSJSONSerialization JSONObjectWithData: data
                                    options: NSJSONReadingMutableContainers
                                      error: &error];
    NSLog(@"json data %@",JSON);*/
    
}

- (void) makePostRequestWithParameter:(NSDictionary*)requestParameter
{
   /* if (_methodName == nil || _methodName.length==0) {
        if ([self respondsToSelector:@selector(requestFailed:)]) {
            NSError* error = [[NSError alloc]initWithDomain:@"Method Name nil" code:123 userInfo:@{@"userinfo": @"Method name cannot be nil"}];
            [self requestFailed:error];
        }
        return;
    }*/
    NSURL *baseURL = [NSURL URLWithString:BASE_URL];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:configuration];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
 
    [manager POST:[requestParameter valueForKey:@"methodName"] parameters:[requestParameter valueForKey:@"Param"] progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
      //  NSLog(@"Success: %@", responseObject);
        
        [self requestSuccessed:responseObject];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
       // NSLog(@"Error: %@", error);
        
         [self requestFailed:error];
    }];
}


- (void) requestSuccessed:(id)responseData
{
    
}

- (void) requestFailed:(NSError*)error
{
    
}


@end
