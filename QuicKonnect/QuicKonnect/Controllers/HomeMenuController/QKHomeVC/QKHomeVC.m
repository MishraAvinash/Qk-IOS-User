//
//  QKHomeVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 29/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKHomeVC.h"
#import "MFSideMenu.h"

#import "QKProfileVC.h"
#import "QKDetailProfileVC.h"
#import "QKPostsVC.h"
#import "QKNotificationsVC.h"
#import "QKContactsVC.h"
#import "QKAddContactVC.h"
#import "QKShareProfileVC.h"

@interface QKHomeVC ()
{
    NSString *selectedIndexStr;
}
@end

@implementation QKHomeVC
-(void)callSliderAnimation{
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.title=@"QUICKONNECT";
    
    // Add an observer that will respond to didSelectMenuTable
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didSelectMenuTable:)
                                                 name:@"didSelectMenuTable" object:nil];
  
    /* SWRevealViewController *revealViewController = self.revealViewController;
     if ( revealViewController )
     {
     [self.sidebarButton setTarget: self.revealViewController];
     [self.sidebarButton setAction: @selector( revealToggle: )];
     [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
     
     
     }
    
    // Add an observer that will respond to didSelectMenuTable
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didSelectMenuTable:)
                                                 name:@"didSelectMenuTable" object:nil];*/
    
    self.sidebarButton.target = self;
    [self.sidebarButton setAction: @selector(callSliderAnimation)];
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;

    
  /*  NSString *profilePicString =[defaults objectForKey:@"userProfilePic"];
    
    if (profilePicString.length >10) {
        
        NSData *imagedata = [[NSData alloc]initWithBase64EncodedString:profilePicString options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *ret = [UIImage imageWithData:imagedata];
        [self.profilePicBtn setBackgroundImage:ret forState:UIControlStateNormal];
    }*/
}

-(void)didSelectMenuTable:(NSNotification *) notification
{
    
    selectedIndexStr = [notification object];
    
    if ([selectedIndexStr isEqualToString:@"1"]) {
        QKProfileVC *viewProfile = (QKProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKProfileVC"];
        [self.navigationController pushViewController:viewProfile animated:YES];
    }
    else if ([selectedIndexStr isEqualToString:@"2"]) {
        QKPostsVC *postsVC = (QKPostsVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKPostsVC"];
        [self.navigationController pushViewController:postsVC animated:YES];
    }
    else if ([selectedIndexStr isEqualToString:@"3"]) {
        
        QKShareProfileVC *shareVC = (QKShareProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKShareProfileVC"];
        [self.navigationController pushViewController:shareVC animated:YES];
    }
    else if ([selectedIndexStr isEqualToString:@"4"]) {
        QKNotificationsVC *notificationsVC = (QKNotificationsVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKNotificationsVC"];
        [self.navigationController pushViewController:notificationsVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (IBAction)profilesButtonClicked:(UIButton *)sender {
    QKProfileVC *viewProfile = (QKProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKProfileVC"];
    [self.navigationController pushViewController:viewProfile animated:YES];
}

- (IBAction)profilePicBtnClicked:(UIButton *)sender {
    
  /*  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailProfileViewController *viewProfile = (DetailProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"DetailProfileViewController"];
    viewProfile.isPresentedVC = NO;
    viewProfile.profile_name=@"MyProfile";
    [self.navigationController pushViewController:viewProfile animated:YES];*/
    
    QKDetailProfileVC *viewProfile = (QKDetailProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKDetailProfileVC"];
    viewProfile.profile_name=@"MyProfile";
    [self.navigationController pushViewController:viewProfile animated:YES];
    
}
- (IBAction)postsButtonClicked:(UIButton *)sender {
    
    QKPostsVC *postsVC = (QKPostsVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKPostsVC"];
    [self.navigationController pushViewController:postsVC animated:YES];
}
- (IBAction)notificationsButtonClicked:(UIButton *)sender {
    
    QKNotificationsVC *notificationsVC = (QKNotificationsVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKNotificationsVC"];
    [self.navigationController pushViewController:notificationsVC animated:YES];
}

- (IBAction)contactsButtonClicked:(UIButton *)sender {
    
    QKContactsVC *contactsVC = (QKContactsVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKContactsVC"];
    [self.navigationController pushViewController:contactsVC animated:YES];
}
- (IBAction)addContactButtonClicked:(UIButton *)sender {
    
    QKAddContactVC *addContactVC = (QKAddContactVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKAddContactVC"];
    [self.navigationController pushViewController:addContactVC animated:YES];
}
- (IBAction)shareContactButtonClicked:(UIButton *)sender {
    
    QKShareProfileVC *shareVC = (QKShareProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKShareProfileVC"];
    [self.navigationController pushViewController:shareVC animated:YES];
}

@end
