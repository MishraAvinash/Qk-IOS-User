//
//  QKShareProfileVC.h
//  QuicKonnect
//
//  Created by Amit Naskar on 01/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QKShareProfileVC : UIViewController
{
    NSString *sample;
}
- (IBAction)segmentbtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *popupview;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *qtag;
@property (weak, nonatomic) IBOutlet UILabel *profileName;

- (IBAction)workprobtn:(id)sender;

- (IBAction)myprofbtn:(id)sender;

- (IBAction)familyprofibtn:(id)sender;
- (IBAction)friendsprofbtn:(id)sender;
- (IBAction)closebtn:(id)sender;
- (IBAction)EditMyProfile:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentController;


@property (strong, nonatomic) IBOutlet UIView *mainview;

@end
