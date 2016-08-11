//
//  QKQrCodeVC.h
//  QuicKonnect
//
//  Created by Amit Naskar on 01/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QKQrCodeVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *userName;

@property (strong, nonatomic) IBOutlet UILabel *profileName;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImageView *profilePic;

@property (strong, nonatomic) NSString *profile_name;
@property (strong, nonatomic) NSString *user_name;

@end
