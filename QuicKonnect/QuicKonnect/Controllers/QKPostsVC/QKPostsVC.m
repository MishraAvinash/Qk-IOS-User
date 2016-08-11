//
//  QKPostsVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 30/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKPostsVC.h"
#import "Reachability.h"

@interface QKPostsVC ()
{
    NSMutableArray *postsArray;
    Reachability *reachability;
}
@end

@implementation QKPostsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.title=@"Posts";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    // [aButton setTitle:@"Cancel" forState:UIControlStateNormal];
    UIImage *aButton1 = [UIImage imageNamed:@"left-arrow2.png"];
    [aButton setBackgroundImage:aButton1 forState:UIControlStateNormal];
    aButton.frame = CGRectMake(-20,-10, 18, 22);
    [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    [aButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
    
    UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *logoImg = [UIImage imageNamed:@"ic_qk_logo"];
    [logoButton setBackgroundImage:logoImg forState:UIControlStateNormal];
    logoButton.frame = CGRectMake(-80, -10, 25, 25);
    [logoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *logoBarButn = [[UIBarButtonItem alloc] initWithCustomView:logoButton];
    [logoButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    if (status != NotReachable) {
        UIBarButtonItem *addBtn =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(Add)] ;
        [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:logoBarButn,addBtn, nil]];
    }
    else{
        [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:logoBarButn, nil]];
    }
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    addpost=[[NSMutableArray alloc] init];
    addpost1=[[NSMutableArray alloc] init];
    
    self.profiletxtfield.delegate=self;
    self.profiletxtfield.layer.cornerRadius=8.0f;
    self.profiletxtfield.layer.masksToBounds=YES;
    self.profiletxtfield.layer.borderColor=[[UIColor grayColor]CGColor];
    self.profiletxtfield.layer.borderWidth= 2.0f;
    
    
    
   /* NSMutableDictionary *inputTokenData;
    NSString *methodnameForgetPosts;
    inputTokenData = [[NSMutableDictionary alloc] init];
    methodnameForgetPosts= [NSString stringWithFormat:@"retrevePosts/"];
    if (status != NotReachable) {
        NSDictionary *postsResponse = [jsoncontact parseJsonResponse:inputTokenData :methodnameForgetPosts:@"getAuthorization"];
        //NSLog(@"Posts Response data %@",postsResponse);
        
        if ([[postsResponse allKeys] containsObject:@"Response"]) {
            NSString *status = [postsResponse objectForKey:@"Response"];
            int a = [status intValue];
            if (a==1) {
                NSDictionary *responseDataArray = [postsResponse objectForKey:@"data"];
                postsArray = [responseDataArray objectForKey:@"RetrevedPosts"];
                // addpost = [responseDataArray objectForKey:@"RetrevedPosts"];
                // NSLog(@"posts array count:====== %lu",(unsigned long)[postsArray count]);
            }
            
        }
        
    }*/
    
    if ([postsArray count]>0) {
        self.postsView.hidden = NO;
        self.noPosts.hidden = YES;
        self.popupview.hidden = YES;
    }
    else if(status == NotReachable){
        self.postsView.hidden = YES;
        self.nopostsLabel.text = @"No Internet connection please try again later";
        self.noPosts.hidden = NO;
        self.popupview.hidden = YES;
        
    }
    else{
        
        self.postsView.hidden = YES;
        self.nopostsLabel.text = @"No Posts added";
        self.noPosts.hidden = NO;
        self.popupview.hidden = YES;
    }
    // [self.tableview reloadData];
}

-(void)logoClick{
    
    /*UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     SWRevealViewController *viewProfile = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
     [self presentViewController:viewProfile animated:YES completion:nil];*/
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)backToPriorView{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)Add
{
    NSLog(@"Popup view hiding here");
    
    self.postsView.hidden=YES;
    self.popupview.hidden=NO;
    self.noPosts.hidden=YES;
    //  [self.postsView setBackgroundColor:[self colorWithHexString:@"706B6B"]];
    
    // self.postsView.backgroundColor = [UIColor blackColor];
    //[self.postsView setUserInteractionEnabled:NO];
    //
    //    if ([postsArray count]>0) {
    //        //self.noPosts.hidden = YES;
    //        [self.tableview setBackgroundColor:[self colorWithHexString:@"706B6B"]];
    //        [self.tableview setUserInteractionEnabled:NO];
    //        //self.tableview.hidden = NO;
    //    }
    //    else{
    //        //self.tableview.hidden = YES;
    //        [self.noPosts setBackgroundColor:[self colorWithHexString:@"706B6B"]];
    //        [self.noPosts setUserInteractionEnabled:NO];
    //        //self.noPosts.hidden = NO;
    //    }
    //    self.popupview.hidden=NO;
    
    
    //    PopUpViewController *loginController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PopUpViewController"];
    //    //
    //    [self presentModalViewController:loginController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Testfield delegates

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.profiletxtfield resignFirstResponder];
    
    
    textField.layer.cornerRadius=8.0f;
    textField.layer.masksToBounds=YES;
    textField.layer.borderColor=[[UIColor grayColor]CGColor];
    textField.layer.borderWidth= 2.0f;
    
    return YES;
}

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




#pragma mark - Table view datasources

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return [addpost count];
    return [postsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"QuickCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    //
    //    NSMutableArray * reverseArray = [NSMutableArray arrayWithCapacity:[addpost count]];
    //
    //    for (id element in [addpost reverseObjectEnumerator]) {
    //        [reverseArray addObject:element];
    //    }
    //    NSMutableArray * reverseArray1 = [NSMutableArray arrayWithCapacity:[addpost1 count]];
    //
    //    for (id element in [addpost1 reverseObjectEnumerator]) {
    //        [reverseArray1 addObject:element];
    //    }
    //
    //
    //    UILabel *title = (UILabel *)[cell viewWithTag:100];
    //    title.text =[reverseArray objectAtIndex:indexPath.row];
    //
    //    UILabel *title1 = (UILabel *)[cell viewWithTag:101];
    //    title1.text =[reverseArray1 objectAtIndex:indexPath.row];
    //    NSLog(@"re1%@",title.text );
    //    NSLog(@"re1%@",title1.text );
    //    //    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    //    //    cell.imageView.image = [UIImage imageNamed:@"creme_brelee.jpg"];
    
    
    NSMutableDictionary *post =[postsArray objectAtIndex:indexPath.row];
    
    NSLog(@"each Post %@",post);
    UILabel *name = (UILabel *)[cell viewWithTag:100];
    UILabel *profileType = (UILabel *)[cell viewWithTag:101];
    UILabel *postMsg = (UILabel *)[cell viewWithTag:102];
    UILabel *date = (UILabel *)[cell viewWithTag:103];
    UILabel *time = (UILabel *)[cell viewWithTag:104];
    
    name.text = [post objectForKey:@"posted_by"];
    
    profileType.text = [post objectForKey:@"posted_profile_type"];
    
    postMsg.text = [post objectForKey:@"posted_message"];
    
    NSArray *dateArray = [[post objectForKey:@"posted_time"] componentsSeparatedByString:@" "];
    date.text = [dateArray objectAtIndex:0];
    time.text = [dateArray objectAtIndex:1];
    
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - IBActions

- (IBAction)profilebtn:(id)sender {
    
    //    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"SELECT PROFILE" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
    //                            @"Friends Profile",
    //                            @"Work Profile",
    //                            @"Family Profile",
    //                            nil];
    //    popup.tag = 1;
    //[popup showInView:self.view];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"SELECT PROFILE" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action){
                                       NSLog(@"Cancel button clicked");
                                   }];
    UIAlertAction *friendsAction = [UIAlertAction
                                    actionWithTitle:@"Friends Profile"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action){
                                        [self.profileoutlet setTitle:@"FriendsProfile" forState:UIControlStateNormal];
                                    }];
    UIAlertAction *workAction = [UIAlertAction
                                 actionWithTitle:@"Work Profile"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction *action){
                                     [self.profileoutlet setTitle:@"WorkProfile" forState:UIControlStateNormal];
                                 }];
    UIAlertAction *familyAction = [UIAlertAction
                                   actionWithTitle:@"Family Profile"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){
                                       [self.profileoutlet setTitle:@"FamilyProfile" forState:UIControlStateNormal];
                                   }];
    UIAlertAction *generalAction = [UIAlertAction
                                    actionWithTitle:@"General Profile"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action){
                                        [self.profileoutlet setTitle:@"GeneralProfile" forState:UIControlStateNormal];
                                    }];
    
    [alertController addAction:generalAction];
    [alertController addAction:familyAction];
    [alertController addAction:workAction];
    [alertController addAction:friendsAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}




//- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
//
//    switch (popup.tag) {
//        case 1: {
//            switch (buttonIndex) {
//                case 0:
//
//                    [self.profileoutlet setTitle:@"Friends Profile" forState:UIControlStateNormal];
//                    break;
//                case 1:
//                    [self.profileoutlet setTitle:@"Work Profile" forState:UIControlStateNormal];
//
//                    break;
//                case 2:
//                    [self.profileoutlet setTitle:@"Family Profile" forState:UIControlStateNormal];
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


- (IBAction)canclebtn:(id)sender {
    
    self.popupview.hidden=YES;
    
    if ([postsArray count]>0) {
        self.noPosts.hidden = YES;
        //[self.tableview setBackgroundColor:[UIColor whiteColor]];
        //[self.tableview setUserInteractionEnabled:YES];
        self.postsView.hidden = NO;
    }
    else{
        self.postsView.hidden = YES;
        //[self.noPosts setBackgroundColor:[UIColor whiteColor]];
        //[self.noPosts setUserInteractionEnabled:YES];
        self.noPosts.hidden = NO;
    }
    
    
}

- (IBAction)postbtn:(id)sender {
    
    NSLog(@"user entered data is %@ and %@ ",self.profiletxtfield.text,self.profileoutlet.titleLabel.text);
   /* NSDictionary *requsetData, *responseData;
    NSString *methodnameForInsertPosts;
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    
    requsetData = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                   self.profileoutlet.titleLabel.text,@"profile_type",
                   self.profiletxtfield.text,@"posted_message",
                   dateString,@"posted_time",
                   nil];
    methodnameForInsertPosts= [NSString stringWithFormat:@"UserPosts/"];
    responseData = [jsoncontact parseJsonResponse:requsetData :methodnameForInsertPosts :methodnameForInsertPosts];
    NSLog(@"response  data is::: %@",responseData);
    
    self.popupview.hidden=YES;
    [self viewDidLoad];
    if ([postsArray count]>0) {
        self.noPosts.hidden = YES;
        //[self.tableview setBackgroundColor:[UIColor whiteColor]];
        // [self.tableview setUserInteractionEnabled:YES];
        self.postsView.hidden = NO;
    }
    else{
        self.postsView.hidden = YES;
        //[self.noPosts setBackgroundColor:[UIColor whiteColor]];
        // [self.noPosts setUserInteractionEnabled:YES];
        self.noPosts.hidden = NO;
    }
    
    
    [addpost addObject:self.profiletxtfield.text];
    [addpost1 addObject:self.profileoutlet.titleLabel.text];
    
    //  NSLog(@"array %@",addpost);
    // NSLog(@"array 1%@",addpost1);
    [self.tableview reloadData];*/
}



@end
