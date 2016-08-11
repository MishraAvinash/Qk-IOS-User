//
//  QKSliderTableVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 29/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKSliderTableVC.h"
#import "MFSideMenu.h"

#import "QKProfileVC.h"
#import "QKPostsVC.h"
#import "QKNotificationsVC.h"
#import "QKShareProfileVC.h"

@interface QKSliderTableVC ()
{
     NSArray *menuItems;
}

@end

@implementation QKSliderTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    menuItems = @[@"title", @"news", @"comments", @"calendar", @"wishlist", @"bookmark", @"tag1",@"tag2",@"tag3",@"tag4"];
    self.tableView.separatorColor = [UIColor clearColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return menuItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = [menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
   /* if (indexPath.row == 0) {
        UILabel *profileName = (UILabel *)[self.tableView viewWithTag:20];
        UILabel *userName = (UILabel *)[self.tableView viewWithTag:21];
        UIImageView *profilepic = (UIImageView *)[self.tableView viewWithTag:22];
        NSString *profilePicString =[defaults objectForKey:@"userProfilePic"];
        
        if (profilePicString.length >10) {
            
            NSData *data = [[NSData alloc]initWithBase64EncodedString:profilePicString options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *ret = [UIImage imageWithData:data];
            
            profilepic.image = ret;
            profilepic.layer.cornerRadius = profilepic.frame.size.height /2;
            profilepic.layer.masksToBounds = YES;
            profilepic.layer.borderWidth = 0;
            //  profilepic.layer.cornerRadius = 15;
        }
        
        
        profileName.text=[defaults objectForKey:@"Profilename"];
        userName.text=[defaults objectForKey:@"username"];
        //        NSLog(@"Defaults user name is -----> %@",[defaults objectForKey:@"username"]);
        //        NSLog(@"Defaults user profile name is -----> %@",[defaults objectForKey:@"Profilename"]);
    }*/
    
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor =[self colorWithHexString:@"012E6A"];
    return cell;
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Set the title of navigation bar by using the menu items
    
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
    
    NSString *str = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didSelectMenuTable" object:str];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) { //change 0 to whatever cell index you want taller
        return 150;
    }
    else {
        return 44;
    }
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - IBActions

- (IBAction)syncBtn:(id)sender {
}

- (IBAction)scanQRCodeBtn:(id)sender {
    
  /* NSString *str = @"6";
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didSelectMenuTable" object:str];*/
}

- (IBAction)notificationsBtn:(id)sender {
    
    //    AllNotificationViewController *loginController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AllNotificationViewController"];
    //    [self presentViewController:loginController animated:YES completion:nil];
    
}

- (IBAction)shareBtn:(id)sender {
    
   /* ShareProfileViewController *profileController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ShareProfileViewController"];
    //[self presentViewController:profileController animated:YES completion:nil];
    [self.navigationController pushViewController:profileController animated:YES];*/
    
    
}


- (IBAction)signoutBtn:(id)sender {
    
    
    /* LandingViewController *loginController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LandingViewController"];
     
     [self presentViewController:loginController animated:YES completion:nil];
    
    NSString *str = @"7";
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didSelectMenuTable" object:str];*/
    
     [self.menuContainerViewController dismissViewControllerAnimated:YES completion:nil];
    
}
@end
