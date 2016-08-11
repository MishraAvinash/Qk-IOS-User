//
//  QKUpdateProfileVC.h
//  QuicKonnect
//
//  Created by Amit Naskar on 28/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateProfileCell.h"

#import "QKSignUpCriteria.h"
#import "QKSignUpRequest.h"
#import "QkSignUpResponse.h"

@interface QKUpdateProfileVC : UIViewController<UpdateProfileDelegate,UIScrollViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIActionSheetDelegate,UIPickerViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    NSString * activitiesTextField;
    NSString * tvShowsTextField;
    NSString * sportsTextField;
    NSString * booksTextField;
    NSString * moviesTextField;
    NSString * musicTextField;
    NSString *genderTxt,*birthdayTxt;
}
@property (strong, nonatomic) NSString *profile_name;

@property (strong, nonatomic) IBOutlet UITextField *gDisplayName;

@property (strong, nonatomic) QKSignUpCriteria *signupCriteria;





@end
