//
//  QKDetailProfileVC.h
//  QuicKonnect
//
//  Created by Amit Naskar on 30/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QKDetailProfileVC : UIViewController<UITextFieldDelegate,UIActionSheetDelegate,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>{
    NSString *profilename;
    NSString *username;
    NSMutableArray *tableData;
    IBOutlet UISearchBar *mySearchBar;
    BOOL isFilled;
    NSMutableArray *filteredPostArray, *filteredUsersArray;
}
@property (strong, nonatomic) IBOutlet UIView *Postview;
- (IBAction)segmentbtn:(id)sender;


@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (strong, nonatomic) IBOutlet UIView *popupview;
@property (strong, nonatomic) IBOutlet UIView *mainview;

@property (strong, nonatomic) IBOutlet UIView *contactsview;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (strong, nonatomic) IBOutlet UITableView *contactsTableView;
@property (strong, nonatomic) IBOutlet UIButton *profilebtn;
- (IBAction)cancelBtn:(id)sender;
- (IBAction)postBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *postsText;

@property (strong, nonatomic) NSString *profile_name;

@end
