//
//  QKSignUpCriteria.h
//  QuicKonnect
//
//  Created by Amit Naskar on 06/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QKSignUpCriteria : NSObject

@property (nonatomic, strong) NSString* fName;
@property (nonatomic, strong) NSString* lName;
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* password;
@property (nonatomic, strong) NSString* cDateStr;
@property (nonatomic, strong) NSString* phNumber;
@property (nonatomic, strong) NSString* imgUrl;

@end
