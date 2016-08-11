//
//  QKResponse.h
//  QuicKonnect
//
//  Created by Amit Naskar on 03/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//


#import "Mantle.h"
#import "MTLModel.h"

@interface QKResponse : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSNumber* Response;
@property (nonatomic, strong) NSString* statusMessage;


@property (nonatomic, strong) NSArray* dataArray;

@end
