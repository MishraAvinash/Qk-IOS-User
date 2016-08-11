//
//  QKAddContactVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 01/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKAddContactVC.h"

@interface QKAddContactVC ()
{
    IBOutlet UIView *addQTagView;
}

@end

@implementation QKAddContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.title = @"Add Contact";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
     addQTagView.hidden = YES;
    
    UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *logoImg = [UIImage imageNamed:@"ic_qk_logo"];
    [logoButton setBackgroundImage:logoImg forState:UIControlStateNormal];
    logoButton.frame = CGRectMake(-80, -10, 25, 25);
    [logoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *logoBarButn = [[UIBarButtonItem alloc] initWithCustomView:logoButton];
    [logoButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    
    //[self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:backButton,logoBarButn, nil]];
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *aButton1 = [UIImage imageNamed:@"left-arrow2.png"];
    [aButton setBackgroundImage:aButton1 forState:UIControlStateNormal];
    aButton.frame = CGRectMake(-20,-10, 18, 22);
    [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    [aButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = backButton;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:logoBarButn, nil]];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}
-(void)logoClick{
    
    
    /*   UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     SWRevealViewController *viewProfile = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
     [self presentViewController:viewProfile animated:YES completion:nil];*/
    
    [self.navigationController popViewControllerAnimated:YES];

    
    
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

- (IBAction)qrCodeButtonClicked:(UIButton *)sender {
    
}

- (IBAction)qTagButtonClicked:(UIButton *)sender {
    
    //[self callPopUpAnimation];
    
    addQTagView.hidden = NO;
    
}
- (IBAction)manualButtonClicked:(UIButton *)sender {
    
}
- (IBAction)addQTagButtonClicked:(UIButton *)sender {
}
- (IBAction)cancelQTagButtonClicked:(UIButton *)sender {
    addQTagView.hidden = YES;
}

@end
