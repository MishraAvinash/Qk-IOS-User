//
//  QKNotificationsVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 30/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKNotificationsVC.h"

@interface QKNotificationsVC ()
{
    NSMutableArray *tableData;
    NSMutableArray *notificationsArray,*pendingNotificationsArray;
}
@end

@implementation QKNotificationsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Notifications";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    
   // defaults = [NSUserDefaults standardUserDefaults];
    
    /*
     ***
     **
     * Setting Navigation Bar Right Buttons
     **
     *** 9666468899
     */
    UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *logoImg = [UIImage imageNamed:@"ic_qk_logo"];
    [logoButton setBackgroundImage:logoImg forState:UIControlStateNormal];
    logoButton.frame = CGRectMake(-80, -10, 25, 25);
    [logoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *logoBarButn = [[UIBarButtonItem alloc] initWithCustomView:logoButton];
    [logoButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:logoBarButn, nil]];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *aButton1 = [UIImage imageNamed:@"left-arrow2.png"];
    [aButton setBackgroundImage:aButton1 forState:UIControlStateNormal];
    aButton.frame = CGRectMake(-20,-10, 18, 22);
    [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    [aButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = backButton;
    
    
    tableData = [NSMutableArray arrayWithObjects:@"Srinu M", @"Shiva Chigurupati", @"Haardhik y", @"Samiulla Jamadar", @"Dinesh MVVN", @"Ramu P", @"Srinuvas Rankireddy", @"Kiran Nimani", @"Rajasekar P", @"Vasu D", @"Mahesh K", @"Laxman T", @"Jamal ", @"Giribabu", @"Harish P", @"Kesav Bandi", nil];
    NSLog(@"loading table view");
    
    
    if (self.segmentController.selectedSegmentIndex == 0) {
        self.notificationsTable.tag = 0;
        [self.view2 setHidden:NO];
        [self.notificationsView setHidden:YES];
    }
    
  /*  NSMutableDictionary *inputData = [NSMutableDictionary dictionary];
    NSString *methodName;
    methodName = [NSString stringWithFormat:@"getAllNotificationDetails/"];
    NSDictionary *notificationResponse = [jsoncontact parseJsonResponse:inputData :methodName:@"getAuthorization"];
    // NSLog(@"Posts Response data %@",notificationResponse);
    if ([[notificationResponse allKeys] containsObject:@"Response"]) {
        NSString *status = [notificationResponse objectForKey:@"Response"];
        int a = [status intValue];
        if (a==1) {
            notificationsArray = [notificationResponse objectForKey:@"Data"];
        }
    }
    methodName = [NSString stringWithFormat:@"requestStatus/%@/",[defaults objectForKey:@"UserID"]];
    NSLog(@"User ID %@",[defaults objectForKey:@"UserID"]);
    NSDictionary *pendingNotificationResponse = [jsoncontact parseJsonResponse:inputData :methodName :@"getAuthorization"];
    
    if ([[pendingNotificationResponse allKeys] containsObject:@"Data"]) {
        NSString *status = [pendingNotificationResponse objectForKey:@"Response"];
        int b =[status intValue];
        if (b==1) {
            NSMutableDictionary *pendingResult =[pendingNotificationResponse objectForKey:@"Data"];
            
            pendingNotificationsArray = [pendingResult objectForKey:@"Connection Status List"];
            NSLog(@"pending notifications %@",pendingNotificationsArray);
            
        }
    }*/

}

-(void)logoClick{
    
    /* UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     SWRevealViewController *viewProfile = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
     [self presentViewController:viewProfile animated:YES completion:nil];*/
    
     [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view datasources

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    
    return view;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [tableData count];
    if (tableView.tag ==0) {
        return [pendingNotificationsArray count];
    }
    else if (tableView.tag ==1){
        //NSLog(@"table data count %lu",(unsigned long)[postsArray count]);
        return [notificationsArray count];
    }
    else{
        NSLog(@"emptydata returning");
        return 0;
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return [tableData count];
    static NSString *simpleTableIdentifier = @"TableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    UILabel *title = (UILabel *)[cell viewWithTag:100];
    UILabel *notificationType = (UILabel *)[cell viewWithTag:102];
    UILabel *dateCreated = (UILabel *)[cell viewWithTag:101];
    //title.text = [tableData objectAtIndex:indexPath.row];
    NSLog(@"table view tag %lu",(long) tableView.tag);
    if (tableView.tag == 0) {
        NSMutableDictionary *pendingnotification = [pendingNotificationsArray objectAtIndex:indexPath.row];
        NSLog(@"Individual notification is %@",pendingnotification);
        NSString *msg = [NSString stringWithFormat:@"%@ wants to add your %@",[pendingnotification objectForKey:@"Sender Name"],[pendingnotification objectForKey:@"profile_type"]];
        title.text = msg;
        //        dateCreated.text = [notification objectForKey:@"date_created"];
        //        NSString *type = [notification objectForKey:@"notification_type"];
        //        notificationType.text = [type uppercaseString];
    }
    else if(tableView.tag == 1){
        NSMutableDictionary *notification = [notificationsArray objectAtIndex:indexPath.row];
        title.text = [notification objectForKey:@"notification_content"];
        dateCreated.text = [notification objectForKey:@"date_created"];
        NSString *type = [notification objectForKey:@"notification_type"];
        notificationType.text = [type uppercaseString];
    }
    
    //NSLog(@"Notification is  %@",notification);
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

- (IBAction)segmentBtn:(id)sender {
    
    UISegmentedControl *segmentControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentControl.selectedSegmentIndex;
    if (selectedSegment == 0) {
        //         if ([postsArray count] >0) {
        if ([pendingNotificationsArray count]>0) {
            self.notificationsTable.tag = 0;
            [self.view2 setHidden:NO];
            [self.notificationsView setHidden:YES];
        }
        else{
            //self.notificationsTable.tag = 0;
            [self.view2 setHidden:NO];
            [self.notificationsView setHidden:YES];
        }
        
    }
    else{
        if([notificationsArray count] >0){
            self.notificationsTable.tag = 1;
            [self.view2 setHidden:YES];
            [self.notificationsView setHidden:NO];
        }else{
            [self.view2 setHidden:NO];
            [self.notificationsView setHidden:YES];
        }
        
    }
    
    
}


@end
