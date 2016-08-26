//
//  QKForgotPasswordVC.h
//  QuicKonnect
//
//  Created by Vijayalakshmi Shankar on 8/17/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface QKForgotPasswordVC : UIViewController< UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *Emailtxt;

-(IBAction)sendbtn:(id)sender;


@end
