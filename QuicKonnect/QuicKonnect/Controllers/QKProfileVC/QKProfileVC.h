//
//  QKProfileVC.h
//  QuicKonnect
//
//  Created by Amit Naskar on 30/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QKProfileVC : UIViewController<UITextFieldDelegate>

- (IBAction)my_profile_btn:(id)sender;
- (IBAction)friends_profile_btn:(id)sender;
- (IBAction)family_profile_btn:(id)sender;

- (IBAction)work_profile_btn:(id)sender;


@end
