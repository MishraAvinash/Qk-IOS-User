//
//  QKSignUpCriteria.m
//  QuicKonnect
//
//  Created by Amit Naskar on 06/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKSignUpCriteria.h"

@implementation QKSignUpCriteria
- (instancetype)init
{
    self = [super init];
    if (self) {
        _fName = @"";
        _lName = @"";
        _email = @"";
        _password = @"";
        _cDateStr = @"";
        _phNumber = @"";
        _imgUrl = @"";
    }
    return self;
}

@end
