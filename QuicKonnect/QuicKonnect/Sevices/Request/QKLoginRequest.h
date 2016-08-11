//
//  QKLoginRequest.h
//  QuicKonnect
//
//  Created by Amit Naskar on 03/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "Request.h"

@class QKLoginCriteria;
@interface QKLoginRequest : Request

- (void) callLoginServiceWithLoginCriteria:(QKLoginCriteria*)loginCriteria withCallback:(responseCallback)callback;

@end
