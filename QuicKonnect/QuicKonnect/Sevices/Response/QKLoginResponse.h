//
//  GALoginResponse.h
//  GolfApp
//
//  Created by Developer on 15/07/14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import "QKResponse.h"

@interface QKLoginResponse : QKResponse
@property (nonatomic, strong) NSNumber* userid;
@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSString* client_secret;
@property (nonatomic, strong) NSString* firstName;
@property (nonatomic, strong) NSString* lastName;
@property (nonatomic, strong) NSString* client_id;

@end
