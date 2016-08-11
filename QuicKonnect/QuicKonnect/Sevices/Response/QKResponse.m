//
//  QKResponse.m
//  QuicKonnect
//
//  Created by Amit Naskar on 03/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKResponse.h"

@implementation QKResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"Response": @"Response",
             @"statusMessage": @"status_message",
             };
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"%@ <%p> Response : %ld, statusMessage : %@, dataArray : %@",[self class],self,(long)_Response.integerValue,_statusMessage,_dataArray];
}

@end
