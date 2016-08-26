//
//  GenProfile.m
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 18/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "GenProfile.h"

@implementation GenProfile


- (NSDictionary*)getDictionary
{
    /*
     
     Mandatory Fields=>
     qtag, profile_type, profile_name, is_main_profile, qk_profile, created_date, display_name, mobile_phone, email_personal.
     
     Other than Mandatory fields=>
     
     first_name , last_name , suffix , sex , hometown , country , current_location , about_me , photo , home_phone , work_phone , phone_other , email_work, website, facebook, twitter,linkedin, snapchat, instagram, google_plus, grauation_date_school, grauation_date_college, engagement_date, marriage_date, activities, sports, tv_shows, movies, music, books, high_school, college, company_name, job_title, custom_fields
     
     
     */
    
    bool flag = true;
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
    NSString* dateString = [dateFormatter stringFromDate:[NSDate date]];

    
    NSDictionary* inputDicObj = @{//@"qtag": self.qtag,
                                  @"profile_type": @"GeneralProfile",
                                  @"profile_name": @"general",
                                  @"dob" : self.birthday,
                                  @"is_main_profile": @"yes",
                                  @"created_date": self.created_date,
                                  @"display_name": self.display_name,
                                  @"mobile_phone": self.phone_number,
                                  @"email_personal": self.email, //Mandatory Fields until here.
                                  @"first_name": self.first_name,
                                  @"last_name": self.last_name,
                                  @"qk_profile": @"4",
                                  @"qtag": self.qtag,
                                  @"job_title": self.job_title
                                  };
    return inputDicObj;
}
// Insert code here to add functionality to your managed object subclass

@end
