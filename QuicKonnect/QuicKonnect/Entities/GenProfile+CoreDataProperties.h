//
//  GenProfile+CoreDataProperties.h
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 20/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "GenProfile.h"

NS_ASSUME_NONNULL_BEGIN

@interface GenProfile (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *about_me;
@property (nullable, nonatomic, retain) NSString *birthday;
@property (nullable, nonatomic, retain) NSString *college;
@property (nullable, nonatomic, retain) NSString *company_name;
@property (nullable, nonatomic, retain) NSString *country;
@property (nullable, nonatomic, retain) NSString *current_location;
@property (nullable, nonatomic, retain) NSString *display_name;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *engagement_date;
@property (nullable, nonatomic, retain) NSString *facebook;
@property (nullable, nonatomic, retain) NSString *first_name;
@property (nullable, nonatomic, retain) NSString *gender;
@property (nullable, nonatomic, retain) NSString *googleplus;
@property (nullable, nonatomic, retain) NSString *high_school;
@property (nullable, nonatomic, retain) NSString *home_phone;
@property (nullable, nonatomic, retain) NSString *home_town;
@property (nullable, nonatomic, retain) NSString *instagram;
@property (nullable, nonatomic, retain) NSString *job_title;
@property (nullable, nonatomic, retain) NSString *last_name;
@property (nullable, nonatomic, retain) NSString *linkedin;
@property (nullable, nonatomic, retain) NSString *marriage_date;
@property (nullable, nonatomic, retain) NSString *other_phone;
@property (nullable, nonatomic, retain) NSString *personal_email;
@property (nullable, nonatomic, retain) NSString *phone_number;
@property (nullable, nonatomic, retain) NSString *school_date;
@property (nullable, nonatomic, retain) NSString *snapchat;
@property (nullable, nonatomic, retain) NSString *sync_date;
@property (nullable, nonatomic, retain) NSNumber *sync_flag;
@property (nullable, nonatomic, retain) NSString *twitter;
@property (nullable, nonatomic, retain) NSString *website;
@property (nullable, nonatomic, retain) NSString *work_email;
@property (nullable, nonatomic, retain) NSString *work_phone;
@property (nullable, nonatomic, retain) NSString *qtag;
@property (nullable, nonatomic, retain) NSNumber *is_main_profile;
@property (nullable, nonatomic, retain) NSString *profile_type;
@property (nullable, nonatomic, retain) NSString *qk_profile;
@property (nullable, nonatomic, retain) NSString *created_date;
@property (nullable, nonatomic, retain) NSString *mobile_phone;

@end

NS_ASSUME_NONNULL_END
