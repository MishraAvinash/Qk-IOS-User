//
//  QKRequestInterface.h
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 17/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#ifndef QKRequestInterface_h
#define QKRequestInterface_h

#import <Foundation/Foundation.h>
#import "appDelegate.h"

@class QKSignUpResponse;

typedef void (^interfaceCallback)(NSError* error, NSString* response);

@interface QKRequestInterface : NSObject

- (void) callAccessTokenService : (QKSignUpResponse*)signUpResponse :(NSString*)email :(NSString*)password withCallback:(interfaceCallback)callback;
- (void) callLoginService :(NSString*)email :(NSString*)password withCallback:(interfaceCallback)callback;
- (void) callSignUpService :(NSDictionary*)dic withCallback:(interfaceCallback)callback;

@end




#endif /* QKRequestInterface_h */


