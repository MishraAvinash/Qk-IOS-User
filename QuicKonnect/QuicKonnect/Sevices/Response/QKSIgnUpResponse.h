//
//  QKSIgnUpResponse.h
//  QuicKonnect
//
//  Created by Amit Naskar on 06/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKResponse.h"

@interface QKSIgnUpResponse : QKResponse

@property (nonatomic, strong) NSNumber* userid;
@property (nonatomic, strong) NSString* firstName;
@property (nonatomic, strong) NSString* lastName;
@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSString* client_secret;
@property (nonatomic, strong) NSString* client_id;
@property (nonatomic, strong) NSString* grantType;


@end
