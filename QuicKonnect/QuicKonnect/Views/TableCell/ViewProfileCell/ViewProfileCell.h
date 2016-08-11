//
//  ViewProfileCell.h
//  QuicKonnect
//
//  Created by Amit Naskar on 01/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewProfileCell : UITableViewCell

@property (strong, nonatomic) NSString *test;
@property (strong, nonatomic) NSString *profile_name;
@property (strong, nonatomic) NSString *user_server_id;
@property (strong, nonatomic) NSString *user_email;

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;

@property (strong, nonatomic) IBOutlet UIImageView *profile_pic;
@property (weak, nonatomic) IBOutlet UILabel *display_name;
@property (weak, nonatomic) IBOutlet UILabel *user_name;
@property (weak, nonatomic) IBOutlet UILabel *dob;
@property (weak, nonatomic) IBOutlet UILabel *phone;

@property (weak, nonatomic) IBOutlet UITextView *about_me;

@property (weak, nonatomic) IBOutlet UITextView *general_data;
@property (weak, nonatomic) IBOutlet UILabel *gender;
@property (strong, nonatomic) IBOutlet UILabel *country;

@property (weak, nonatomic) IBOutlet UILabel *current_location;
@property (weak, nonatomic) IBOutlet UILabel *home_town;

@property (weak, nonatomic) IBOutlet UILabel *home_phone;
@property (weak, nonatomic) IBOutlet UILabel *phone_other;
@property (weak, nonatomic) IBOutlet UILabel *work_email;
@property (weak, nonatomic) IBOutlet UILabel *work_phone;
@property (weak, nonatomic) IBOutlet UILabel *website;

@property (weak, nonatomic) IBOutlet UILabel *facebook;
@property (weak, nonatomic) IBOutlet UILabel *twitter;
@property (weak, nonatomic) IBOutlet UILabel *instagram;
@property (weak, nonatomic) IBOutlet UILabel *snapchat;
@property (weak, nonatomic) IBOutlet UILabel *linkedin;
@property (weak, nonatomic) IBOutlet UILabel *google_plus;

@property (weak, nonatomic) IBOutlet UILabel *school_date;
@property (weak, nonatomic) IBOutlet UILabel *college_date;
@property (weak, nonatomic) IBOutlet UILabel *engagement_date;
@property (weak, nonatomic) IBOutlet UILabel *marriage_date;
@property (weak, nonatomic) IBOutlet UITextView *activities_text;
@property (weak, nonatomic) IBOutlet UITextView *sports_text;
@property (weak, nonatomic) IBOutlet UITextView *movies_text;
@property (weak, nonatomic) IBOutlet UITextView *tv_shows_text;
@property (weak, nonatomic) IBOutlet UITextView *music_text;
@property (weak, nonatomic) IBOutlet UITextView *books_text;

@property (weak, nonatomic) IBOutlet UILabel *school;
@property (weak, nonatomic) IBOutlet UILabel *college;
@property (weak, nonatomic) IBOutlet UILabel *company;
@property (weak, nonatomic) IBOutlet UILabel *job_title;
@property (weak, nonatomic) IBOutlet UITextView *dates_to_remember;
@property (weak, nonatomic) IBOutlet UITextView *contact_information;

@property (weak, nonatomic) IBOutlet UITextView *social_media;

@property (weak, nonatomic) IBOutlet UITextView *education;

@property (weak, nonatomic) IBOutlet UITextView *work_experience;


@end
