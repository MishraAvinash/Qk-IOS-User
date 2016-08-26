//
//  QKSIgnUpResponse.h
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 16/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKResponse.h"

@interface QKAccessTokenResponse : QKResponse

@property (nonatomic, strong) NSString* token_type;
@property (nonatomic, strong) NSString* scope;
@property (nonatomic, strong) NSString* refresh_token;
@property (nonatomic, strong) NSString* access_token;
@property (nonatomic, strong) NSNumber* expires_in;

@end
