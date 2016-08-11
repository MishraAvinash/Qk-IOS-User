//
//  DetailProfileTableViewCell.h
//  Qkonnect
//
//  Created by EunoiaTechnologies on 02/05/16.
//  Copyright © 2016 Raju Eunoia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailProfileTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *profileTypeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UILabel *postMsgLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *phoneImage;
@property (strong, nonatomic) IBOutlet UIImageView *msgImage;
@property (strong, nonatomic) IBOutlet UIImageView *emailImage;
@property (strong, nonatomic) IBOutlet UILabel *displayNameLabel;


@end
