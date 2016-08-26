//
//  QKSignUpRequest.h
//  QuicKonnect
//
//  Created by Amit Naskar on 06/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "Request.h"

@class QKSignUpCriteria;
@interface QKSignUpRequest : Request

- (void) callRegistrationServiceWithCriteria:(QKSignUpCriteria *)signUpCriteria withCallback:(responseCallback)callback;


@end
