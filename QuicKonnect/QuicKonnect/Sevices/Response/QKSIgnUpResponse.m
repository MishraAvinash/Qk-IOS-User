//
//  QKSignUpResponse.m
//  QuicKonnect
//
//  Created by Amit Naskar on 06/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKSignUpResponse.h"

@implementation QKSignUpResponse
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSMutableDictionary *paths = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    
    NSDictionary* dic =  @{
                           @"userid": @"Data.user_id",
                           @"username": @"Data.username",
                           @"client_secret": @"Data.client_secret",
                           @"firstName": @"Data.first_name",
                           @"lastName": @"Data.last_name",
                           @"client_id": @"Data.client_id",
                           @"grant_type": @"Data.grant_type",
                           @"email": @"email"
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
    [string appendFormat:@" grant_type : %@",_grant_type];
    return string;
}
@end
