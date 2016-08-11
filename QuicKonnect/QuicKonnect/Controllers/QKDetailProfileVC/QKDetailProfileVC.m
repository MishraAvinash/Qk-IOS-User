//
//  QKDetailProfileVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 30/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKDetailProfileVC.h"
#import "DetailProfileTableViewCell.h"
#import "Reachability.h"

#import "QKViewProfileVC.h"

@interface QKDetailProfileVC (){
    NSMutableArray *postsArray,*usersArray;
    NSString *selectedSegmentName, *usersQuery;
    NSString * profile_type;
    Reachability *reachability;
}


@end

@implementation QKDetailProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=self.profile_name;
    reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    //NetworkStatus status = [reachability currentReachabilityStatus];
    UIFont *font = [UIFont fontWithName:@"PTSans-Regular" size:13.0];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    [self.segmentController setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    /*
     ***
     **
     * Setting Navigation Bar left Buttons
     **
     ***
     */
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *aButton1 = [UIImage imageNamed:@"left-arrow2.png"];
    [aButton setBackgroundImage:aButton1 forState:UIControlStateNormal];
    aButton.frame = CGRectMake(-20,-10, 18, 22);
    [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    [aButton addTarget:self action:@selector(gotoProfile) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = backButton;
    
    
    //    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    // [aButton setTitle:@"Cancel" forState:UIControlStateNormal];
    //
    
    //
    //    UIImage *aButton1 = [UIImage imageNamed:@"back.gif"];
    //    [aButton setBackgroundImage:aButton1 forState:UIControlStateNormal];
    //    aButton.frame = CGRectMake(-30,-10, 20, 22);
    //    [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //
    //    //UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    //    [aButton addTarget:self action:@selector(backToPriorView) forControlEvents:UIControlEventTouchUpInside];
    //    //self.navigationItem.leftBarButtonItem = backButton;
    
    
    
    //  [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:backButton,logoBarButn, nil]];
    
    // NSString *UUID = [[NSUUID UUID] UUIDString];
    // NSLog(@"Unique ID is:::: %@",UUID);
    
    
    
    /*
     ***
     **
     * Setting Navigation Bar Right Buttons
     **
     ***
     */
    
    UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *logoImg = [UIImage imageNamed:@"ic_qk_logo"];
    [logoButton setBackgroundImage:logoImg forState:UIControlStateNormal];
    logoButton.frame = CGRectMake(-80, -10, 25, 25);
    [logoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *logoBarButn = [[UIBarButtonItem alloc] initWithCustomView:logoButton];
    [logoButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImage *qrCodeImg = [UIImage imageNamed:@"ic_share"];
    UIButton *qrCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    
    [qrCodeBtn setBackgroundImage:qrCodeImg forState:UIControlStateNormal];
    qrCodeBtn.frame=CGRectMake(-30, -10, 20, 22);
    
    
    UIBarButtonItem *qrCodeBarBtn = [[UIBarButtonItem alloc] initWithCustomView:qrCodeBtn];
    [qrCodeBtn addTarget:self action:@selector(qrcodeClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *btnAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(profiledatabtn)];
    //    UIBarButtonItem *searchBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(qrcodeClick)];
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:btnAdd,logoBarButn,qrCodeBarBtn, nil]];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    //self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(profiledatabtn)] ;
    
    
    // self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:font}];
    //self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:self.navigationItem.backBarButtonItem.style target:nil action:nil];
    
    //self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    
    
    /*  NSString *methodnameForgetPosts;
     username=[defaults objectForKey:@"username"];
     profilename=[defaults objectForKey:@"profilename"];
     
     if ([self.profile_name isEqualToString:@"MyProfile"] || [self.profile_name isEqualToString:@"GeneralProfile"]) {
     
     //  [self.segmentController insertSegmentWithTitle:@"INVITE" atIndex:3 animated:YES];
     methodnameForgetPosts= [NSString stringWithFormat:@"retrevePosts/generalprofile/"];
     profile_type = @"GeneralProfile";
     }
     else if ([self.profile_name isEqualToString:@"FamilyProfile"]){
     
     methodnameForgetPosts= [NSString stringWithFormat:@"retrevePosts/familyprofile/"];
     profile_type = self.profile_name;
     }
     else if([self.profile_name isEqualToString:@"FriendsProfile"]){
     
     methodnameForgetPosts= [NSString stringWithFormat:@"retrevePosts/friendsprofile/"];
     profile_type = self.profile_name;
     }
     else if ([self.profile_name isEqualToString:@"WorkProfile"]){
     
     methodnameForgetPosts= [NSString stringWithFormat:@"retrevePosts/workprofile/"];
     profile_type = self.profile_name;
     }
     
     
     usersQuery = [NSString stringWithFormat:@"SELECT DISTINCT u.email,u.server_user_id,u.quser_profile_type,p.display_name,p.mobile_phone,p.photo from QUSER u,QUSER_PROFILES p where u.quser_profile_type = p.profile_type and u.server_user_id = p.server_user_id and u.quser_profile_type = \"%@\" ",profile_type];
     
     self.Postview.hidden=YES;
     if(self.segmentController.selectedSegmentIndex == 0){
     
     self.popupview.hidden=YES;
     
     self.contactsTableView.tag = 0;
     selectedSegmentName = @"contacts";
     tableData = [NSMutableArray arrayWithObjects:@"Srinu M", @"Shiva Chigurupati", @"Haardhik y", @"Samiulla Jamadar", @"Dinesh MVVN", @"Ramu P", @"Srinuvas Rankireddy", @"Kiran Nimani", @"Rajasekar P", @"Vasu D", @"Mahesh K", @"Laxman T", @"Jamal ", @"Giribabu", @"Harish P", @"Kesav Bandi", nil];
     
     usersArray = [self getUsersData:[self getDbFilePath] query:usersQuery];
     
     if ([usersArray count]>0) {
     [self.contactsview setHidden:NO];
     [self.Postview setHidden:YES];
     self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(profiledatabtn)] ;
     self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
     
     }
     else{
     [self.contactsview setHidden:YES];
     [self.Postview setHidden:NO];
     
     self.msgLabel.text = @"NO USERS ADDED";
     self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(profiledatabtn)] ;
     self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
     
     }
     
     //  NSLog(@"users query %@",usersQuery);
     
     }
     
     }*/
    
     [self.popupview setHidden:YES];
    
    [self.contactsview setHidden:YES];
    [self.Postview setHidden:NO];
    
    self.msgLabel.text = @"NO USERS ADDED";
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(profiledatabtn)] ;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    [self.contactsTableView resignFirstResponder];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length == 0) {
        isFilled=NO;
    }
    else{
        isFilled=YES;
        filteredPostArray = [[NSMutableArray alloc] init];
        filteredUsersArray =[[NSMutableArray alloc] init];
        if (self.segmentController.selectedSegmentIndex == 0) {
            
            for(id tempObj in usersArray){
                NSString *dispalyName = [tempObj objectForKey:@"display_name"];
                NSRange stringRange = [dispalyName rangeOfString:searchText options:NSCaseInsensitiveSearch];
                if (stringRange.location != NSNotFound) {
                    [filteredUsersArray addObject:tempObj];
                }
            }
        }
        else if(self.segmentController.selectedSegmentIndex == 1){
            for (id tempObj in postsArray) {
                NSString *dispalyName = [tempObj objectForKey:@"posted_by"];
                NSRange stringRange = [dispalyName rangeOfString:searchText options:NSCaseInsensitiveSearch];
                if (stringRange.location != NSNotFound) {
                    [filteredPostArray addObject:tempObj];
                }
                
            }
        }
        
    }
}


- (IBAction)segmentbtn:(id)sender {
    
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;

    
    if (selectedSegment == 0)
    {
        //NSLog(@"segment index :: %ld",self.segmentController.selectedSegmentIndex);
        //toggle the correct view to be visible
        self.popupview.hidden=YES;
        self.mainview.backgroundColor = [UIColor whiteColor];
        self.segmentController.hidden=NO;
        self.contactsTableView.tag = 0;
        selectedSegmentName = @"contacts";
        
        /*  usersArray = [self getUsersData:[self getDbFilePath] query:usersQuery];
         if ([usersArray count]>0) {
         [self.contactsview setHidden:NO];
         [self.Postview setHidden:YES];
         self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(profiledatabtn)] ;
         self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
         }
         else{
         [self.contactsview setHidden:YES];
         [self.Postview setHidden:NO];
         
         self.msgLabel.text = @"NO USERS ADDED";
         self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(profiledatabtn)] ;
         self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
         
         }*/
        
        [self.contactsview setHidden:YES];
        [self.Postview setHidden:NO];
        
        self.msgLabel.text = @"NO USERS ADDED";
        self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(profiledatabtn)] ;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        
        
        // NSLog(@"users query %@",usersQuery);
        //self.navigationItem.rightBarButtonItem = nil;
    }
    else if(selectedSegment == 1)
    {
        self.popupview.hidden=YES;
        self.mainview.backgroundColor = [UIColor whiteColor];
        self.segmentController.hidden=NO;
        self.contactsTableView.tag = 1;
        selectedSegmentName = @"posts";
        //NSLog(@"segment index :: %ld",self.segmentController.selectedSegmentIndex);
        if ([postsArray count] >0) {
            
            //NSLog(@"count of posts %lu",(unsigned long)[postsArray count]);
            //toggle the correct view to be visible
            [self.contactsview setHidden:NO];
            [self.Postview setHidden:YES];
            
            //            self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(profiledatabtn)] ;
            //            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
            
            self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(Add)] ;
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
            
        }
        else{
            
            
            //  usersArray = [self getUsersData:[self getDbFilePath] query:usersQuery];
            
            //toggle the correct view to be visible
            [self.contactsview setHidden:YES];
            [self.Postview setHidden:NO];
            
            self.msgLabel.text = @"NO POSTS ADDED";
            self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(Add)] ;
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        }
        
        
        
    }
    
    [self.contactsTableView reloadData];
}
-(void)Add{
    // PopUpViewController *loginController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PopUpViewController"];
    //
    // [self presentViewController:loginController animated:YES completion:nil];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    if (status != NotReachable) {
        self.mainview.backgroundColor = [UIColor blackColor];
        self.segmentController.hidden=YES;
        self.popupview.hidden=NO;
        self.Postview.hidden=YES;
        self.contactsview.hidden=YES;
        self.profilebtn.titleLabel.text = self.profile_name;
        
    }
    else{
        UIAlertController *alertview = [UIAlertController alertControllerWithTitle:@"No Internet" message:@"Check Your Internet" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
        [alertview addAction:ok];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertview animated:YES completion:nil];
        });
    }
    
}
-(void)profiledatabtn{
    
    //                                        NSLog(@"Button View Profile was selected.");
    //
    //                                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //                                        ViewProfileViewController *viewProfile = (ViewProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewProfileViewController"];
    //                                        viewProfile.profile_name=self.profile_name;
    //
    //                                        [self.navigationController pushViewController:viewProfile animated:YES];
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:nil
                                          message:nil
                                          preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction
                                actionWithTitle:@"View Profile/Edit Profile"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction *action){
                                    
                                    
                                    /*
                                     if ([self.profile_name isEqualToString:@"MyProfile"] || [self.profile_name isEqualToString:@"GeneralProfile"]) {
                                     
                                     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                     ViewProfileViewController *viewProfile = (ViewProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewProfileViewController"];
                                     viewProfile.profile_name=self.profile_name;
                                     
                                     [self.navigationController pushViewController:viewProfile animated:YES];
                                     
                                     }
                                     else if ([self.profile_name isEqualToString:@"WorkProfile"]){
                                     
                                     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                     ViewWorkProfileViewController *viewProfile = (ViewWorkProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewWorkProfileViewController"];
                                     viewProfile.profile_name=self.profile_name;
                                     [self.navigationController pushViewController:viewProfile animated:YES];
                                     
                                     }
                                     else {
                                     
                                     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                     ViewFFProfileViewController *viewProfile = (ViewFFProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewFFProfileViewController"];
                                     viewProfile.profile_name=self.profile_name;
                                     
                                     [self.navigationController pushViewController:viewProfile animated:YES];
                                     
                                     }*/
                                    
                                    QKViewProfileVC *viewProfileVC = (QKViewProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKViewProfileVC"];
                                   // updateProfileVC.profile_name = @"GeneralProfile";
                                    [self.navigationController pushViewController:viewProfileVC animated:YES];
                                    
                                    
                                    
                                }]];
    [UIAlertAction
     actionWithTitle:@"Edit Profile"
     style:UIAlertActionStyleDefault
     handler:^(UIAlertAction *action){
         
         // NSLog(@"Button Edit Profile was selected.");
         /*   UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
          bundle:nil];
          EditProfileViewController *viewProfile = (EditProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"EditProfileViewController"];
          viewProfile.profile_name=self.profile_name;
          [self.navigationController pushViewController:viewProfile animated:YES];*/
         
     }];
    [alertController addAction:[UIAlertAction
                                actionWithTitle:@"Cancel"
                                style:UIAlertActionStyleCancel
                                handler:^(UIAlertAction *action){
                                    //[self dismissViewControllerAnimated:YES completion:nil];
                                    
                                }]];
    //[alertController addAction:editAction];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
    
    
}
-(void)logoClick{
    
    /*UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     SWRevealViewController *viewProfile = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
     [self presentViewController:viewProfile animated:YES completion:nil];*/
    
     [self.navigationController popToRootViewControllerAnimated:YES];
    
}
-(void)gotoProfile{
    
    /* UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     ProfileMeenuViewController *viewProfile = (ProfileMeenuViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ProfileMeenuViewController"];
     //[self presentViewController:viewProfile animated:YES completion:nil];
     [self.navigationController pushViewController:viewProfile animated:YES];*/
    
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)refresh{
    NSLog(@"Refresh button clicked");
}
-(void)qrcodeClick{
    NSLog(@"QR Code button clicked");
    /*  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     IndividualShareViewController *viewController = (IndividualShareViewController *)[storyboard instantiateViewControllerWithIdentifier:@"IndividualShareViewController"];
     viewController.profile_name = profile_type;
     [self.navigationController pushViewController:viewController animated:YES];*/
}
-(void)qtagClick{
    NSLog(@"QTag Code button clicked");
}



- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
    if(textField.tag==100)
    {
        
    }
    
    if(textField.tag==101)
    {
        
        //        pt.y = 165;
        //        [self.scrollview setContentOffset:pt animated:YES];
        NSLog(@"gfwqggd");
    }
    
    
}




- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    
    
    
    if(textField.tag==100)
    {
        
        
        
    }
    
}

//- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
//
//    switch (popup.tag) {
//        case 1: {
//            switch (buttonIndex) {
//                case 0:
//                    NSLog(@"a");
//                    break;
//                case 1:
//                    NSLog(@"b");
//
//                    break;
//                case 2:
//                    NSLog(@"c");
//
//                    break;
//                default:
//                    break;
//            }
//            break;
//        }
//        default:
//            break;
//    }
//}


-(void)backToPriorView{
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //            ProfileMeenuViewController *loginController = (ProfileMeenuViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ProfileMeenuViewController"];
    //           [self.navigationController pushViewController:loginController animated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 77;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isFilled) {
        if (self.segmentController.selectedSegmentIndex == 0) {
            return [filteredUsersArray count];
        }
        return [filteredPostArray count];
    }
    else if (tableView.tag ==0) {
        //return [tableData count];
        return [usersArray count];
        
    }
    else if (tableView.tag ==1){
        return [postsArray count];
    }
    else{
        NSLog(@"emptydata returning");
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"QuickCell";
    
    DetailProfileTableViewCell *cell = (DetailProfileTableViewCell *)[self.contactsTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[DetailProfileTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    UILabel *title = (UILabel *)[cell viewWithTag:100];
    
    if (tableView.tag ==0) {
        // NSLog(@"Contacts segment selected");
        [cell.displayNameLabel setHidden:NO];
        [cell.profileTypeLabel setHidden:NO];
        [cell.postMsgLabel setHidden:YES];
        [cell.dateLabel setHidden:YES];
        [cell.timeLabel setHidden:YES];
        [title setHidden:YES];
    }
    else if (tableView.tag == 1){
        //        UILabel *title = (UILabel *)[cell viewWithTag:100];
        [title setHidden:YES];
        [cell.displayNameLabel setHidden:NO];
        [cell.profileTypeLabel setHidden:NO];
        [cell.postMsgLabel setHidden:NO];
        [cell.dateLabel setHidden:NO];
        [cell.timeLabel setHidden:NO];
        [cell.phoneImage setHidden:YES];
        [cell.emailImage setHidden:YES];
        [cell.msgImage setHidden:YES];
    }
    if (!isFilled) {
        if (tableView.tag == 0) {
            NSMutableDictionary *user = [usersArray objectAtIndex:indexPath.row];
            cell.displayNameLabel.text =[user objectForKey:@"display_name"];
            cell.profileTypeLabel.text = [user objectForKey:@"email"];
            NSString *profilePicString =[user objectForKey:@"photo"];
            
            if (profilePicString.length >10) {
                
                NSData *data = [[NSData alloc]initWithBase64EncodedString:profilePicString options:NSDataBase64DecodingIgnoreUnknownCharacters];
                UIImage *ret = [UIImage imageWithData:data];
                
                cell.userImage.image = ret;
                cell.userImage.layer.cornerRadius = cell.userImage.frame.size.height /2;
                cell.userImage.layer.masksToBounds = YES;
                cell.userImage.layer.borderWidth = 0;
                
            }
            
        }
        else{
            [cell.postMsgLabel setHidden:NO];
            [cell.dateLabel setHidden:NO];
            [cell.timeLabel setHidden:NO];
            NSMutableDictionary *post =[postsArray objectAtIndex:indexPath.row];
            NSString *qtag, *quser_profile_id;
            qtag = [post objectForKey:@"qtag"];
            quser_profile_id = [post objectForKey:@"quser_profile"];
            
            /*   NSString *query = [NSString stringWithFormat:@"select  distinct photo from QUSER_PROFILES where  server_profile_id = \"%@\" ",quser_profile_id];
             NSString *profilePicString = [self getPostedUserPic:[self getDbFilePath] query:query];
             if (profilePicString.length >10) {
             
             NSData *data = [[NSData alloc]initWithBase64EncodedString:profilePicString options:NSDataBase64DecodingIgnoreUnknownCharacters];
             UIImage *ret = [UIImage imageWithData:data];
             
             cell.userImage.image = ret;
             cell.userImage.layer.cornerRadius = cell.userImage.frame.size.height /2;
             cell.userImage.layer.masksToBounds = YES;
             cell.userImage.layer.borderWidth = 0;
             
             }*/
            
            
            cell.displayNameLabel.text =[post objectForKey:@"posted_by"];
            
            cell.profileTypeLabel.text = [post objectForKey:@"posted_profile_type"];
            
            cell.postMsgLabel.text = [post objectForKey:@"posted_message"];
            
            
            NSArray *dateArray = [[post objectForKey:@"posted_time"] componentsSeparatedByString:@" "];
            cell.dateLabel.text = [dateArray objectAtIndex:0];
            cell.timeLabel.text = [dateArray objectAtIndex:1];
            
        }
    }
    else{
        if (self.segmentController.selectedSegmentIndex == 0) {
            NSLog(@"it is in filtered selected segment 0");
            NSMutableDictionary *user = [filteredUsersArray objectAtIndex:indexPath.row];
            cell.displayNameLabel.text =[user objectForKey:@"display_name"];
            cell.profileTypeLabel.text = [user objectForKey:@"email"];
            NSString *profilePicString =[user objectForKey:@"photo"];
            
            if (profilePicString.length >10) {
                
                NSData *data = [[NSData alloc]initWithBase64EncodedString:profilePicString options:NSDataBase64DecodingIgnoreUnknownCharacters];
                UIImage *ret = [UIImage imageWithData:data];
                
                cell.userImage.image = ret;
                cell.userImage.layer.cornerRadius = cell.userImage.frame.size.height /2;
                cell.userImage.layer.masksToBounds = YES;
                cell.userImage.layer.borderWidth = 0;
                //  profilepic.layer.cornerRadius = 15;
            }
            
            
        }
        else{
            [cell.postMsgLabel setHidden:NO];
            [cell.dateLabel setHidden:NO];
            [cell.timeLabel setHidden:NO];
            
            NSMutableDictionary *post =[filteredPostArray objectAtIndex:indexPath.row];
            NSString *qtag, *quser_profile_id;
            qtag = [post objectForKey:@"qtag"];
            quser_profile_id = [post objectForKey:@"quser_profile"];
            
            /*  NSString *query = [NSString stringWithFormat:@"select  distinct photo from QUSER_PROFILES where  server_profile_id = \"%@\" ",quser_profile_id];
             NSString *profilePicString = [self getPostedUserPic:[self getDbFilePath] query:query];
             if (profilePicString.length >10) {
             
             NSData *data = [[NSData alloc]initWithBase64EncodedString:profilePicString options:NSDataBase64DecodingIgnoreUnknownCharacters];
             UIImage *ret = [UIImage imageWithData:data];
             
             cell.userImage.image = ret;
             cell.userImage.layer.cornerRadius = cell.userImage.frame.size.height /2;
             cell.userImage.layer.masksToBounds = YES;
             cell.userImage.layer.borderWidth = 0;
             
             }*/
            
            cell.displayNameLabel.text =[post objectForKey:@"posted_by"];
            
            cell.profileTypeLabel.text = [post objectForKey:@"posted_profile_type"];
            
            cell.postMsgLabel.text = [post objectForKey:@"posted_message"];
            
            NSArray *dateArray = [[post objectForKey:@"posted_time"] componentsSeparatedByString:@" "];
            cell.dateLabel.text = [dateArray objectAtIndex:0];
            cell.timeLabel.text = [dateArray objectAtIndex:1];
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"table view index path is ==== %ld", (long)indexPath.row);
    /* if (!isFilled) {
     
     if (tableView.tag == 0) {
     NSMutableDictionary *user = [usersArray objectAtIndex:indexPath.row];
     
     if ([self.profile_name isEqualToString:@"MyProfile"] || [self.profile_name isEqualToString:@"GeneralProfile"]) {
     
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     ViewProfileViewController *viewProfile = (ViewProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewProfileViewController"];
     viewProfile.profile_name=self.profile_name;
     viewProfile.user_server_id = [user objectForKey:@"server_user_id"];
     viewProfile.user_email = [user objectForKey:@"email"];
     [self.navigationController pushViewController:viewProfile animated:YES];
     
     }
     else if ([self.profile_name isEqualToString:@"FamilyProfile"]){
     
     
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     ViewFFProfileViewController *viewProfile = (ViewFFProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewFFProfileViewController"];
     viewProfile.profile_name=self.profile_name;
     viewProfile.user_server_id = [user objectForKey:@"server_user_id"];
     viewProfile.user_email = [user objectForKey:@"email"];
     [self.navigationController pushViewController:viewProfile animated:YES];
     }
     else if([self.profile_name isEqualToString:@"FriendsProfile"]){
     
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     ViewFFProfileViewController *viewProfile = (ViewFFProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewFFProfileViewController"];
     viewProfile.profile_name=self.profile_name;
     viewProfile.user_server_id = [user objectForKey:@"server_user_id"];
     viewProfile.user_email = [user objectForKey:@"email"];
     [self.navigationController pushViewController:viewProfile animated:YES];
     
     }
     else if ([self.profile_name isEqualToString:@"WorkProfile"]){
     
     
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     ViewWorkProfileViewController *viewProfile = (ViewWorkProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewWorkProfileViewController"];
     viewProfile.profile_name=self.profile_name;
     viewProfile.user_server_id = [user objectForKey:@"server_user_id"];
     viewProfile.user_email = [user objectForKey:@"email"];
     [self.navigationController pushViewController:viewProfile animated:YES];
     
     
     }
     
     
     }
     else if (self.segmentController.selectedSegmentIndex == 1){
     NSMutableDictionary *posts = [postsArray objectAtIndex:indexPath.row];
     NSLog(@"total posts data is === %@",posts);
     }
     
     }
     else{
     
     if (self.segmentController.selectedSegmentIndex == 1) {
     NSLog(@"it is in posts");
     }
     else if(self.segmentController.selectedSegmentIndex == 0){
     NSLog(@"it is in Contacts");
     NSMutableDictionary *user = [filteredUsersArray objectAtIndex:indexPath.row];
     
     if ([self.profile_name isEqualToString:@"MyProfile"] || [self.profile_name isEqualToString:@"GeneralProfile"]) {
     
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     ViewProfileViewController *viewProfile = (ViewProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewProfileViewController"];
     viewProfile.profile_name=self.profile_name;
     viewProfile.user_server_id = [user objectForKey:@"server_user_id"];
     viewProfile.user_email = [user objectForKey:@"email"];
     [self.navigationController pushViewController:viewProfile animated:YES];
     
     }
     else if ([self.profile_name isEqualToString:@"FamilyProfile"]){
     
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     ViewFFProfileViewController *viewProfile = (ViewFFProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewFFProfileViewController"];
     viewProfile.profile_name=self.profile_name;
     viewProfile.user_server_id = [user objectForKey:@"server_user_id"];
     viewProfile.user_email = [user objectForKey:@"email"];
     [self.navigationController pushViewController:viewProfile animated:YES];
     
     
     }
     else if([self.profile_name isEqualToString:@"FriendsProfile"]){
     
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     ViewFFProfileViewController *viewProfile = (ViewFFProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewFFProfileViewController"];
     viewProfile.profile_name=self.profile_name;
     viewProfile.user_server_id = [user objectForKey:@"server_user_id"];
     viewProfile.user_email = [user objectForKey:@"email"];
     [self.navigationController pushViewController:viewProfile animated:YES];
     
     }
     else if ([self.profile_name isEqualToString:@"WorkProfile"]){
     
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     ViewWorkProfileViewController *viewProfile = (ViewWorkProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewWorkProfileViewController"];
     viewProfile.profile_name=self.profile_name;
     viewProfile.user_server_id = [user objectForKey:@"server_user_id"];
     viewProfile.user_email = [user objectForKey:@"email"];
     [self.navigationController pushViewController:viewProfile animated:YES];
     
     
     }
     
     }
     
     
     
     }*/
    
    
    
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


- (IBAction)cancelBtn:(id)sender {
    //[self viewDidLoad];
    self.popupview.hidden=YES;
    self.mainview.backgroundColor = [UIColor whiteColor];
    self.segmentController.hidden=NO;
    if ([postsArray count] >0) {
        self.contactsview.hidden=NO;
    }
    else{
        self.Postview.hidden=NO;
    }
}

- (IBAction)postBtn:(id)sender {
    
    /*  NSDictionary *requsetData, *responseData;
     NSString *methodnameForInsertPosts;
     NSDate *currDate = [NSDate date];
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
     [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
     NSString *dateString = [dateFormatter stringFromDate:currDate];
     
     
     requsetData = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
     profile_type,@"profile_type",
     self.postsText.text,@"posted_message",
     dateString,@"posted_time",
     nil];
     
     NetworkStatus status = [reachability currentReachabilityStatus];
     if (status != NotReachable) {
     // NSLog(@"request data is: %@",requsetData);
     methodnameForInsertPosts= [NSString stringWithFormat:@"UserPosts/"];
     responseData = [jsoncontact parseJsonResponse:requsetData :methodnameForInsertPosts :methodnameForInsertPosts];
     // NSLog(@"response  data is::: %@",responseData);
     }
     else{
     UIAlertController *alertview = [UIAlertController alertControllerWithTitle:@"No Internet" message:@"Check Your Internet" preferredStyle:UIAlertControllerStyleAlert];
     UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
     [alertview addAction:ok];
     dispatch_async(dispatch_get_main_queue(), ^{
     [self presentViewController:alertview animated:YES completion:nil];
     });
     
     }*/
    
    
    
    self.popupview.hidden=YES;
    self.mainview.backgroundColor = [UIColor whiteColor];
    self.segmentController.hidden=NO;
    selectedSegmentName = @"posts";
    [self viewDidLoad];
    [self.contactsTableView reloadData];
    if ([postsArray count] >0) {
        self.contactsview.hidden=NO;
        // NSLog(@"count of posts %lu",(unsigned long)[postsArray count]);
        //toggle the correct view to be visible
        [self.contactsview setHidden:NO];
        [self.Postview setHidden:YES];
        self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(Add)] ;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
    }
    else{
        self.Postview.hidden=NO;
        // usersArray = [self getUsersData:[self getDbFilePath] query:usersQuery];
        
        //toggle the correct view to be visible
        [self.contactsview setHidden:YES];
        [self.Postview setHidden:NO];
        
        self.msgLabel.text = @"NO POSTS ADDED";
        self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(Add)] ;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
    }
    
}


@end
