//
//  QKLandingVC.h
//  QuicKonnect
//
//  Created by Amit Naskar on 25/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPFloatingPlaceholderTextField.h"

@interface QKLandingVC : UIViewController<UITextFieldDelegate,UIScrollViewDelegate>
{
    NSString *wifistatus;
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIButton *Registerbtnout;
@property (strong, nonatomic) IBOutlet UIButton *siginbtnout;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end
