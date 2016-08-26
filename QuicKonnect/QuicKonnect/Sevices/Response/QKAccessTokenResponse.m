//
//  QKSIgnUpResponse.m
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 16/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKAccessTokenResponse.h"

@implementation QKAccessTokenResponse
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSMutableDictionary *paths = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    
    NSDictionary* dic =  @{
                           @"token_type": @"token_type",
                           @"scope": @"scope",
                           @"refresh_token": @"refresh_token",
                           @"access_token": @"access_token",
                           @"expires_in": @"expires_in"
                        };
    [paths addEntriesFromDictionary:dic];
    
    return paths;
}

- (NSString*) description
{
    NSString* superDesc = [super description];
    NSMutableString* string = [[NSMutableString alloc] initWithString:superDesc];
    [string appendFormat:@"token_type: %@",_token_type];
    [string appendFormat:@"scope: %@",_scope];
    [string appendFormat:@" refresh_token : %@",_refresh_token];
    [string appendFormat:@" access_token : %@",_access_token];
    [string appendFormat:@" expires_in : %@",[NSString stringWithFormat:@"%@",_expires_in]];

    return string;
}
@end
