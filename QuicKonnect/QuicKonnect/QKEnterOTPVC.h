//
//  QKEnterOTPVC.h
//  QuicKonnect
//
//  Created by Vijayalakshmi Shankar on 8/24/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QKEnterOTPVC : UIViewController<UITextFieldDelegate>
{
    
}

@property (strong, nonatomic) IBOutlet UITextField *OTPLabel;

-(IBAction)cancelBtn:(id)sender;
-(IBAction)verifyBtn:(id)sender;
@end
