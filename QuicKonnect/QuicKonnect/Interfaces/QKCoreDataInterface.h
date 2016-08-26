//
//  QKCoreDataInterface.h
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 17/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#ifndef QKCoreDataInterface_h
#define QKCoreDataInterface_h

#import <Foundation/Foundation.h>
#import "appDelegate.h"

@class QKAccessTokenResponse;
@class QKSignUpResponse;

@interface QKCoreDataInterface : NSObject

//@property(nonatomic, retain)NSManagedObjectContext *qkManagedObjectContext;

+ (NSManagedObjectContext*) getContext;
+ (NSEntityDescription*)fetchEntityFor:(NSString*)entityName :(NSString*)key :(NSString*)value;
+ (bool)saveLogin:(NSString*)email :(NSString*)password :(bool)flag;
+ (void)deleteAllEntities:(NSString *)nameEntity;
+ (bool)saveAuthorization:(QKAccessTokenResponse*)accessTokenResponse :(QKSignUpResponse*)signUpResponse :(NSString*)email :(NSDictionary*)dic;
+ (NSString*)getAuthorizationString:(NSString*)email :(NSManagedObjectContext*)lmoc;
+ (void) clearCoreData;

@end

static NSManagedObjectContext* qkManagedObjectContext = nil;



#endif /* QKCoreDataInterface_h */


