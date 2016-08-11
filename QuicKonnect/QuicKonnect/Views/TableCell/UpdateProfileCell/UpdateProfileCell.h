//
//  UpdateProfileCell.h
//  QuicKonnect
//
//  Created by Amit Naskar on 28/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UpdateProfileDelegate;

@protocol UpdateProfileDelegate <NSObject>
- (void)uploadPic:(id)sender;
- (void)gConuntryCodeBtnClick:(id)sender;
- (void)gActivitiesBtn:(id)sender;
- (void)gTVShowsBtn:(id)sender;
- (void)gSportsBtn:(id)sender;
- (void)gBooksBtn:(id)sender;
- (void)gMusicBtn:(id)sender;
- (void)gMoviesBtn:(id)sender;
- (void)gSaveBtn:(id)sender;
@end

@interface UpdateProfileCell : UITableViewCell

@property (weak,nonatomic) id <UpdateProfileDelegate> delegate;

//@property (strong, nonatomic) NSString *profile_name;
@property (strong, nonatomic) IBOutlet UIView *generalView;
@property (strong, nonatomic) IBOutlet UIView *FFView;
@property (strong, nonatomic) IBOutlet UIView *workView;

@property (strong, nonatomic) IBOutlet UIScrollView *workScrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *generalScrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *ffScrollView;


@property (strong, nonatomic) IBOutlet UIImageView *workProfilePic;
@property (strong, nonatomic) IBOutlet UIImageView *generalProfilePic;
@property (strong, nonatomic) IBOutlet UIImageView *ffProfilePic;


- (IBAction)uploadPic:(id)sender;



@property (strong, nonatomic) IBOutlet UITextField *gDisplayName;
@property (strong, nonatomic) IBOutlet UITextField *gPhoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *gEmail;

@property (strong, nonatomic) IBOutlet UITextField *gBirthday;
@property (strong, nonatomic) IBOutlet UIButton *gCountryCode;
- (IBAction)gConuntryCodeBtnClick:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *gHomeTown;

@property (strong, nonatomic) IBOutlet UITextField *gLastName;
@property (strong, nonatomic) IBOutlet UITextField *gCountry;
@property (strong, nonatomic) IBOutlet UITextField *gFirstName;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gGender;
@property (strong, nonatomic) IBOutlet UITextField *gCurrentLocation;
@property (strong, nonatomic) IBOutlet UITextView *gAboutMeTxt;
@property (strong, nonatomic) IBOutlet UITextField *gHomePhone;
@property (strong, nonatomic) IBOutlet UITextField *gWorkPhone;
@property (strong, nonatomic) IBOutlet UITextField *gPhoneOther;
@property (strong, nonatomic) IBOutlet UITextField *gEmailPersonal;

@property (strong, nonatomic) IBOutlet UITextField *gWorkEmail;
@property (strong, nonatomic) IBOutlet UITextField *gWebsite;
@property (strong, nonatomic) IBOutlet UITextField *gFacebook;
@property (strong, nonatomic) IBOutlet UITextField *gTwitter;
@property (strong, nonatomic) IBOutlet UITextField *gSnapChat;
@property (strong, nonatomic) IBOutlet UITextField *gLinkedin;
@property (strong, nonatomic) IBOutlet UITextField *gGooglePlus;
@property (strong, nonatomic) IBOutlet UITextField *gInstagram;
@property (strong, nonatomic) IBOutlet UITextField *gSchoolDate;
@property (strong, nonatomic) IBOutlet UITextField *gCollegeDate;
@property (strong, nonatomic) IBOutlet UITextField *gMarriageDate;
@property (strong, nonatomic) IBOutlet UITextField *gEngagementDate;
@property (strong, nonatomic) IBOutlet UITextField *gHighSchool;
@property (strong, nonatomic) IBOutlet UITextField *gCollege;
@property (strong, nonatomic) IBOutlet UITextField *gJobTitle;
@property (strong, nonatomic) IBOutlet UITextField *gCompanyName;
//- (IBAction)genderBtnClick:(id)sender;


- (IBAction)gActivitiesBtn:(id)sender;
- (IBAction)gTVShowsBtn:(id)sender;
- (IBAction)gSportsBtn:(id)sender;
- (IBAction)gBooksBtn:(id)sender;
- (IBAction)gMusicBtn:(id)sender;
- (IBAction)gMoviesBtn:(id)sender;
- (IBAction)gSaveBtn:(id)sender;

/*
 
 //Friends and Family starts here
 
 @property (strong, nonatomic) IBOutlet UITextField *ffDisplayName;
 @property (strong, nonatomic) IBOutlet UITextField *ffPhoneNumber;
 @property (strong, nonatomic) IBOutlet UITextField *ffBirthday;
 @property (strong, nonatomic) IBOutlet UIButton *ffCountryCode;
 @property (strong, nonatomic) IBOutlet UITextField *ffHomeTown;
 
 @property (strong, nonatomic) IBOutlet UITextField *ffLastName;
 @property (strong, nonatomic) IBOutlet UITextField *ffCountry;
 @property (strong, nonatomic) IBOutlet UITextField *ffFirstName;
 @property (strong, nonatomic) IBOutlet UISegmentedControl *ffGender;
 @property (strong, nonatomic) IBOutlet UITextField *ffCurrentLocation;
 @property (strong, nonatomic) IBOutlet UITextView *ffAboutMeTxt;
 @property (strong, nonatomic) IBOutlet UITextField *ffHomePhone;
 @property (strong, nonatomic) IBOutlet UITextField *ffPhoneOther;
 
 @property (strong, nonatomic) IBOutlet UITextField *ffEmailPersonal;
 @property (strong, nonatomic) IBOutlet UITextField *ffWebsite;
 @property (strong, nonatomic) IBOutlet UITextField *ffFacebook;
 @property (strong, nonatomic) IBOutlet UITextField *ffTwitter;
 @property (strong, nonatomic) IBOutlet UITextField *ffSnapChat;
 @property (strong, nonatomic) IBOutlet UITextField *ffLinkedin;
 @property (strong, nonatomic) IBOutlet UITextField *ffGooglePlus;
 @property (strong, nonatomic) IBOutlet UITextField *ffInstagram;
 @property (strong, nonatomic) IBOutlet UITextField *ffSchoolDate;
 @property (strong, nonatomic) IBOutlet UITextField *ffCollegeDate;
 @property (strong, nonatomic) IBOutlet UITextField *ffMarriageDate;
 @property (strong, nonatomic) IBOutlet UITextField *ffEngagementDate;
 @property (strong, nonatomic) IBOutlet UITextField *ffHighSchool;
 @property (strong, nonatomic) IBOutlet UITextField *ffCollege;
 
 
 - (IBAction)ffSaveBtn:(id)sender;
 
 //Work Profile
 
 @property (strong, nonatomic) IBOutlet UITextField *wDisplayName;
 @property (strong, nonatomic) IBOutlet UITextField *wPhone;
 @property (strong, nonatomic) IBOutlet UITextField *wBirthday;
 @property (strong, nonatomic) IBOutlet UIButton *wCountryCode;
 
 @property (strong, nonatomic) IBOutlet UITextField *wLastName;
 @property (strong, nonatomic) IBOutlet UITextField *wCountry;
 @property (strong, nonatomic) IBOutlet UITextField *wFirstName;
 @property (strong, nonatomic) IBOutlet UISegmentedControl *wGender;
 @property (strong, nonatomic) IBOutlet UITextField *wCurrentLocation;
 @property (strong, nonatomic) IBOutlet UITextView *wAboutMeTxt;
 @property (strong, nonatomic) IBOutlet UITextField *wHomePhone;
 
 @property (strong, nonatomic) IBOutlet UITextField *wPhoneOther;
 @property (strong, nonatomic) IBOutlet UITextField *wWorkEmail;
 @property (strong, nonatomic) IBOutlet UITextField *wWebsite;
 @property (strong, nonatomic) IBOutlet UITextField *wFacebook;
 @property (strong, nonatomic) IBOutlet UITextField *wTwitter;
 
 @property (strong, nonatomic) IBOutlet UITextField *wLinkedin;
 @property (strong, nonatomic) IBOutlet UITextField *wGooglePlus;
 @property (strong, nonatomic) IBOutlet UITextField *wHighSchool;
 @property (strong, nonatomic) IBOutlet UITextField *wCollege;
 @property (strong, nonatomic) IBOutlet UITextField *wJobTitle;
 @property (strong, nonatomic) IBOutlet UITextField *wCompanyName;
 
 - (IBAction)wSaveBtn:(id)sender;
 */



@end
