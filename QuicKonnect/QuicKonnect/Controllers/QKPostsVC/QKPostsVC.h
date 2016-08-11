//
//  QKPostsVC.h
//  QuicKonnect
//
//  Created by Amit Naskar on 30/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QKPostsVC : UIViewController<UITextFieldDelegate>
{
    NSMutableArray *addpost;
    NSMutableArray *addpost1;
    
}
@property (strong, nonatomic) IBOutlet UIView *popupview;
@property (strong, nonatomic) IBOutlet UIView *noPosts;
@property (strong, nonatomic) IBOutlet UIView *postsView;

- (IBAction)profilebtn:(id)sender;


@property (strong, nonatomic) IBOutlet UITextField *profiletxtfield;

- (IBAction)canclebtn:(id)sender;

- (IBAction)postbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *profileoutlet;

@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) IBOutlet UILabel *nopostsLabel;

@end
