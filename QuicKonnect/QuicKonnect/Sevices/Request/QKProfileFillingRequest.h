//
//  QKProfileFillingRequest.h
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 20/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "Request.h"
#import "GenProfile.h"

@class QKAccessTokenCriteria;
@interface QKProfileFillingRequest : Request

- (void) callProfileFillingService:(GenProfile*)genProfileObj withCallback:(responseCallback)callback;

@end
