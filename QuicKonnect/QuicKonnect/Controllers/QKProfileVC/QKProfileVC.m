//
//  QKProfileVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 30/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKProfileVC.h"
#import "QKDetailProfileVC.h"

@interface QKProfileVC ()

@end

@implementation QKProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.title=@"Profile";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *aButton1 = [UIImage imageNamed:@"left-arrow2.png"];
    [aButton setBackgroundImage:aButton1 forState:UIControlStateNormal];
    aButton.frame = CGRectMake(-20,-10, 18, 22);
    [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    [aButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    //self.navigationItem.leftBarButtonItem = backButton;
    
    UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *logoImg = [UIImage imageNamed:@"ic_qk_logo"];
    [logoButton setBackgroundImage:logoImg forState:UIControlStateNormal];
    logoButton.frame = CGRectMake(-80, -10, 25, 25);
    [logoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *logoBarButn = [[UIBarButtonItem alloc] initWithCustomView:logoButton];
    [logoButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:backButton, nil]];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:logoBarButn, nil]];
    // self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
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


- (IBAction)my_profile_btn:(id)sender {
    
  
    QKDetailProfileVC *viewProfile = (QKDetailProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKDetailProfileVC"];
    viewProfile.profile_name=@"MyProfile";
    [self.navigationController pushViewController:viewProfile animated:YES];
    
}

- (IBAction)friends_profile_btn:(id)sender {
    
    QKDetailProfileVC *viewProfile = (QKDetailProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKDetailProfileVC"];
    viewProfile.profile_name=@"FriendsProfile";
    [self.navigationController pushViewController:viewProfile animated:YES];
    
}

- (IBAction)family_profile_btn:(id)sender {
    
    QKDetailProfileVC *viewProfile = (QKDetailProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKDetailProfileVC"];
    viewProfile.profile_name=@"FamilyProfile";
    [self.navigationController pushViewController:viewProfile animated:YES];
    
}

- (IBAction)work_profile_btn:(id)sender {
    
    QKDetailProfileVC *viewProfile = (QKDetailProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKDetailProfileVC"];
    viewProfile.profile_name=@"WorkProfile";
    [self.navigationController pushViewController:viewProfile animated:YES];

}

-(void)logoClick{
    
    /* UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     SWRevealViewController *viewProfile = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
     [self presentViewController:viewProfile animated:YES completion:nil];*/
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
