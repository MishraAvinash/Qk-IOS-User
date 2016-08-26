//
//  QKProfileFillingResponse.m
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 16/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKProfileFillingResponse.h"

@implementation QKProfileFillingResponse
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSMutableDictionary *paths = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    
    NSDictionary* dic =  @{
                           @"city_names_server_id": @"Data.City_Names_Server_Id",
                           @"zipcode_server_id": @"Data.ZipCode_Server_Id",
                           @"quser_address_server_id": @"Data.qUser_Address_ServerId",
                           @"result": @"Data.result",
                           @"server_profile_id": @"Data.server_profile_id"
                        };
    [paths addEntriesFromDictionary:dic];

    return paths;
}

- (NSString*) description
{
    NSString* superDesc = [super description];
    NSMutableString* string = [[NSMutableString alloc] initWithString:superDesc];
    [string appendFormat:@" city_names_server_id: %@",[NSString stringWithFormat:@"%@",_city_names_server_id]];
    [string appendFormat:@" zipcode_server_id: %@",[NSString stringWithFormat:@"%@",_zipcode_server_id]];
    [string appendFormat:@" quser_address_server_id : %@",[NSString stringWithFormat:@"%@",_quser_address_server_id]];
    [string appendFormat:@" result : %@",_result];
    [string appendFormat:@" server_profile_id : %@",[NSString stringWithFormat:@"%@",_server_profile_id]];

    return string;
}
@end
