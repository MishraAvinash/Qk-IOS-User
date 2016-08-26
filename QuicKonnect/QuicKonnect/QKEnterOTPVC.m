//
//  QKEnterOTPVC.m
//  QuicKonnect
//
//  Created by Vijayalakshmi Shankar on 8/24/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKEnterOTPVC.h"

@interface QKEnterOTPVC ()

@end

@implementation QKEnterOTPVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    UIImage *image = [UIImage imageNamed: @"ic_qk_logo"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(135, -2, 35, 29);
    [self.navigationController.navigationBar addSubview:imageView];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *aButton1 = [UIImage imageNamed:@"left-arrow2.png"];
    [aButton setBackgroundImage:aButton1 forState:UIControlStateNormal];
    aButton.frame = CGRectMake(-20,-10, 18, 22);
    [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    [aButton addTarget:self action:@selector(backToPriorView) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = backButton;
    
    
    
}

-(void)backToPriorView{
    
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    
    //[self.navigationController popViewControllerAnimated:YES];

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

-(IBAction)cancelBtn:(id)sender;
{
    
}
-(IBAction)verifyBtn:(id)sender;
{
    
}

@end
