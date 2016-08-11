//
//  Profile+CoreDataProperties.h
//  QuicKonnect
//
//  Created by Vijayalakshmi Shankar on 8/9/16.
//  Copyright © 2016 Amit. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Profile.h"

NS_ASSUME_NONNULL_BEGIN

@interface Profile (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *displayname;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSNumber *phonenumber;
@property (nullable, nonatomic, retain) NSNumber *birthday;

@end

NS_ASSUME_NONNULL_END
