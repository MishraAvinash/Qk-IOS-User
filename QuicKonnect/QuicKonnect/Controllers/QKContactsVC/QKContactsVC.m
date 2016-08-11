//
//  QKContactsVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 30/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKContactsVC.h"
#import "AllContactsTableViewCell.h"

#import "GetLocalContacts.h"

@interface QKContactsVC ()
{
    NSString *usersQuery;
    NSMutableArray *usersArray, *namesArray, *arrContacts;
    NSArray *searchResults;
    UISearchController *searchController;
    
    
}

@end

@implementation QKContactsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.title = @"Contacts";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    
    UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    UIImage *logoImg = [UIImage imageNamed:@"ic_qk_logo"];
    [logoButton setBackgroundImage:logoImg forState:UIControlStateNormal];
    logoButton.frame = CGRectMake(-80, -10, 25, 25);
    [logoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *classifyBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"CLASSIFY" style:UIBarButtonItemStylePlain target:self action:@selector(classifyClick)];
    
    UIBarButtonItem *logoBarButn = [[UIBarButtonItem alloc] initWithCustomView:logoButton];
    [logoButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    
    //[self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:backButton,logoBarButn, nil]];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:logoBarButn,classifyBarBtn, nil]];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *aButton1 = [UIImage imageNamed:@"left-arrow2.png"];
    [aButton setBackgroundImage:aButton1 forState:UIControlStateNormal];
    aButton.frame = CGRectMake(-20,-10, 18, 22);
    [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    [aButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = backButton;
    
    NSLog(@"users array +++++++++ %@",usersArray);
    // NSLog(@"users data for all users is ::::::====> %@",usersArray);
    if ([usersArray count]>0) {
        
        
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
    }
    //        else{
    //            [self.contactsvierw setHidden:YES];
    //            [self.Postview setHidden:NO];
    //
    //            self.msgLabel.text = @"NO USERS ADDED";
    //            self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(profiledatabtn)] ;
    //            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //
    //        }
    
    
    //    for(id tempObj in usersArray) {
    //        NSLog(@"User data is -=-=-=-=-=-=-=-=-> %@",tempObj);
    //    }
    NSLog(@"all display names are =====> %@",namesArray);
    totalArray = [[NSMutableArray alloc] initWithObjects:@"One",@"two",@"three",@"four",@"five",@"six",@"one two",@"six two",@"five three",@"four one six", nil];
    
    
    /*  // Do any additional setup after loading the view.
     usersArray = [[NSMutableArray alloc] init];
     NSMutableArray *qkContacts = [[NSMutableArray alloc] init];
     NSMutableArray *localContacts = [[NSMutableArray alloc] init];
     namesArray = [[NSMutableArray alloc] init];
     
     usersQuery = [NSString stringWithFormat:@"SELECT DISTINCT u.email,u.server_user_id,u.quser_profile_type,p.display_name, p.mobile_phone from QUSER u,QUSER_PROFILES p where u.quser_profile_type = p.profile_type and u.server_user_id = p.server_user_id "];
     
     
     NSString *localContactsQuery = [NSString stringWithFormat:@"SELECT * FROM TABLE_MOBILE_CONTACTS"];
     
     
     qkContacts = [self getUsersData:[self getDbFilePath] query:usersQuery];
     
     localContacts = [self getLocalContacts:[self getDbFilePath] query:localContactsQuery];
     usersArray = [qkContacts arrayByAddingObjectsFromArray:localContacts];*/
    
    // Get All Local Contacts
    
    GetLocalContacts *req = [[GetLocalContacts alloc] init];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        
        [req callGetContactsWithCallback:^(NSError* error, NSMutableArray* response) {
            if (error) {
                NSLog(@"Error: %@",error);
            }
            else{
                
                arrContacts = response;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    // code here
                    
                    [myTableView reloadData];
                });
                
                // NSLog(@"Contacts->>: %@",response);
            }
        }];
    });
    
}
-(void)logoClick{
    
    /* UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     SWRevealViewController *viewProfile = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
     [self presentViewController:viewProfile animated:YES completion:nil];*/
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)classifyClick{
    NSLog(@"Classify clicked");
    /* ClassifyContactsViewController *profileController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ClassifyContactsViewController"];
     [self.navigationController pushViewController:profileController animated:YES];*/
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Searchbar delegates

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    [myTableView resignFirstResponder];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if (searchText.length == 0) {
        isFilled=NO;
    }else{
        isFilled=YES;
        filteredArray = [[NSMutableArray alloc] init];
        for (NSString *str in namesArray) {
            NSLog(@"string before getting ===== %@",str);
            NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (stringRange.location != NSNotFound) {
                NSLog(@"String after getting %@",str);
                [filteredArray addObject:str];
            }
        }
    }
    
    [myTableView reloadData];
    
}

#pragma mark - Table view datasources

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /*if (isFilled) {
     return [filteredArray count];
     }
     return [namesArray count];*/
    
    return [arrContacts count];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"QKCell";
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    //
    //    if (cell == nil) {
    //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    //    }
    
    AllContactsTableViewCell *cell = (AllContactsTableViewCell *)[myTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier ];
    if (cell == nil) {
        cell = [[AllContactsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    //    UIImageView *phone = (UIImageView *)[cell viewWithTag:106];
    //    UIImageView *email_img = (UIImageView *)[cell viewWithTag:107];
    //    UIImageView *msg_img = (UIImageView *)[cell viewWithTag:108];
    
    
    //NSMutableDictionary *user; //= [usersArray objectAtIndex:indexPath.row];
    
    /*  if (!isFilled) {
     cell.displayNameLabel.text = [namesArray objectAtIndex:indexPath.row];
     }else{
     NSString *disName =[filteredArray objectAtIndex:indexPath.row];
     cell.displayNameLabel.text = disName;
     
     // NSLog(@"Filtered array is =======> %@",name.text);
     }*/
    // name.text =[user objectForKey:@"display_name"];
    
    NSDictionary *dic = [arrContacts objectAtIndex:indexPath.row];
    
    // NSLog(@"DN =======> %@",[dic valueForKey:@"DisplayName"]);
    
    
    cell.displayNameLabel.text = [dic valueForKey:@"DisplayName"];
    //cell.userImage = [];
    
    
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

@end
