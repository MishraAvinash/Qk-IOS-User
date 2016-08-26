//
//  QKProfileFillingResponse.h
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 16/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKResponse.h"

@interface QKProfileFillingResponse : QKResponse

@property (nonatomic, strong) NSNumber* city_names_server_id;
@property (nonatomic, strong) NSNumber* zipcode_server_id;
@property (nonatomic, strong) NSNumber* quser_address_server_id;
@property (nonatomic, strong) NSString* result;
@property (nonatomic, strong) NSNumber* server_profile_id;

@end
