//
//  QKAccessTokenCriteria.m
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 16/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKAccessTokenCriteria.h"

@implementation QKAccessTokenCriteria
- (instancetype)init
{
    self = [super init];
    if (self) {
        _username = @"";
        _password = @"";
        _grant_type = @"";
        _password = @"";
        _client_secret = @"";
        _client_id = @"";
    }
    return self;
}
@end
