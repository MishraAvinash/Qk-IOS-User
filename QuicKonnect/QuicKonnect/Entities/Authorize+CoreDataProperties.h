//
//  Authorize+CoreDataProperties.h
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 18/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Authorize.h"

NS_ASSUME_NONNULL_BEGIN

@interface Authorize (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *access_token;
@property (nullable, nonatomic, retain) NSString *client_id;
@property (nullable, nonatomic, retain) NSString *client_secret;
@property (nullable, nonatomic, retain) NSString *emailid;
@property (nullable, nonatomic, retain) NSString *grant_type;
@property (nullable, nonatomic, retain) NSString *password;
@property (nullable, nonatomic, retain) NSString *refresh_token;
@property (nullable, nonatomic, retain) NSString *scope;
@property (nullable, nonatomic, retain) NSString *token_type;
@property (nullable, nonatomic, retain) NSString *userid;
@property (nullable, nonatomic, retain) NSString *username;
@property (nullable, nonatomic, retain) NSString *sync_flag;

@end

NS_ASSUME_NONNULL_END
