//
//  QKAccessTokenCriteria.h
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 16/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QKAccessTokenCriteria : NSObject

@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSString* password;
@property (nonatomic, strong) NSString* grant_type;
@property (nonatomic, strong) NSString* client_id;
@property (nonatomic, strong) NSString* client_secret;

//username, password, grant_type, client_id, client_secret

@end

