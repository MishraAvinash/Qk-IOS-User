//
//  QKLoginCriteria.m
//  QuicKonnect
//
//  Created by Amit Naskar on 03/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKLoginCriteria.h"

@implementation QKLoginCriteria

- (instancetype)init
{
    self = [super init];
    if (self) {
        _Username = @"";
        _password = @"";
    }
    return self;
}

@end
