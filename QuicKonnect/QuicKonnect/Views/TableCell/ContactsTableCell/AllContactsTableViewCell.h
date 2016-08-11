//
//  AllContactsTableViewCell.h
//  Qkonnect
//
//  Created by EunoiaTechnologies on 02/05/16.
//  Copyright © 2016 Raju Eunoia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllContactsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *displayNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UIImageView *contactPhoneImage;
@property (strong, nonatomic) IBOutlet UIImageView *contactMsgImage;
@property (strong, nonatomic) IBOutlet UIImageView *contactMailImage;

@end
