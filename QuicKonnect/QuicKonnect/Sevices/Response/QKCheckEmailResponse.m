//
//  QKCheckEmailResponse.m
//  QuicKonnect
//
//  Created by Amit Naskar on 06/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKCheckEmailResponse.h"

@implementation QKCheckEmailResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSMutableDictionary *paths = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    
    NSDictionary* dic =  @{
                           @"emailCheck": @"Data",
                           };
    
    [paths addEntriesFromDictionary:dic];
    
    return paths;
}
- (NSString*) description
{
    NSString* superDesc = [super description];
    NSMutableString* string = [[NSMutableString alloc] initWithString:superDesc];
    [string appendFormat:@" emailCheck : %@",_emailCheck];
    return string;
}

@end
