//
//  QKRegistrationVC.h
//  QuicKonnect
//
//  Created by Amit Naskar on 28/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QKRegistrationVC : UIViewController<UITextFieldDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    CGPoint svos;
    NSString *countryCode;
    NSString *phoneNumber;
    
    
}
@property (weak, nonatomic) IBOutlet UITextField *firstnametxt;

@property (weak, nonatomic) IBOutlet UIButton *btnGooglePlus;
@property (weak, nonatomic) IBOutlet UIButton *btnFb;



@property (weak, nonatomic) IBOutlet UITextField *lastnametxt;

@property (weak, nonatomic) IBOutlet UITextField *emailidtxr;

@property (weak, nonatomic) IBOutlet UITextField *pwdtxt;

- (IBAction)SignupBtn:(id)sender;
- (IBAction)fbbtn:(id)sender;



- (IBAction)switchbtn:(id)sender;
- (IBAction)termsBtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *signupoutlet;


@property (strong, nonatomic) NSString  *firstname;
@property (strong, nonatomic) NSString  *lastname;

@property (strong, nonatomic) NSString  *email;


@end
