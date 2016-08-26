//
//  QKAccessTokenRequest.h
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 16/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "Request.h"

@class QKAccessTokenCriteria;
@interface QKAccessTokenRequest : Request

- (void) callAccessTokenServiceWithCriteria:(QKAccessTokenCriteria *)accessTokenCriteria withCallback:(responseCallback)callback;

@end
