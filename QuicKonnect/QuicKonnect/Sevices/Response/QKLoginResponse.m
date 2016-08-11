//
//  GALoginResponse.m
//  GolfApp
//
//  Created by Developer on 15/07/14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import "QKLoginResponse.h"

@implementation QKLoginResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSMutableDictionary *paths = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    
    NSDictionary* dic =  @{
             @"userid": @"Data.userid",
             @"username": @"Data.username",
             @"client_secret": @"Data.client_secret",
             @"firstName": @"Data.First Name",
              @"lastName": @"Data.Last Name",
             @"client_id": @"Data.client_id",
             };
    
    [paths addEntriesFromDictionary:dic];
    
    return paths;
}

- (NSString*) description
{
    NSString* superDesc = [super description];
    NSMutableString* string = [[NSMutableString alloc] initWithString:superDesc];
    [string appendFormat:@"userid: %@",[NSString stringWithFormat:@"%@",_userid]];
    [string appendFormat:@"username: %@",_username];
    [string appendFormat:@" client_secret : %@",_client_secret];
    [string appendFormat:@" firstName : %@",_firstName];
    [string appendFormat:@" lastName : %@",_lastName];
    [string appendFormat:@" client_id : %@",_client_id];
    return string;
}
@end
