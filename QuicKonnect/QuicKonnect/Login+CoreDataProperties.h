//
//  Login+CoreDataProperties.h
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 18/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Login.h"

NS_ASSUME_NONNULL_BEGIN

@interface Login (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *password;
@property (nullable, nonatomic, retain) NSNumber *sync_flag;

@end

NS_ASSUME_NONNULL_END
