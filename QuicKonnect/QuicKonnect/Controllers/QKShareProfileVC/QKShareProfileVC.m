//
//  QKShareProfileVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 01/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKShareProfileVC.h"
#import "QKQrCodeVC.h"

@interface QKShareProfileVC ()

@end

@implementation QKShareProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.title=@"Share Profile";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
   /* defaults  = [NSUserDefaults standardUserDefaults];
    
    self.userName.text = [defaults objectForKey:@"Profilename"];*/
    
    self.userName.text = @"Amit";
    
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
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
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:logoBarButn, nil]];
    // self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}
-(void)backToPriorView{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)logoClick{
    
    
    /* UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     SWRevealViewController *viewProfile = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
     [self presentViewController:viewProfile animated:YES completion:nil];*/
    
    [self.navigationController popViewControllerAnimated:YES];
    
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

- (IBAction)segmentbtn:(id)sender {
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0)
    {
        //toggle the correct view to be visible
        //        [self.contactsvierw setHidden:NO];
        //        [self.Postview setHidden:YES];
        sample=@"0";
    }
    else
    {
        //toggle the correct view to be visible
        //        [self.contactsvierw setHidden:YES];
        //        [self.Postview setHidden:NO];
        
        sample=@"1";
    }
    
}
- (IBAction)workprobtn:(id)sender {
    
    
    
    
    if (self.segmentController.selectedSegmentIndex ==0) {
        NSLog(@"Qtag Selected");
        
        //        UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:self.mainview.bounds];
        //        toolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //
        //        if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0) {
        //            toolBar.barTintColor = nil;
        //            toolBar.translucent = YES;
        //            toolBar.barStyle = UIBarStyleBlack;
        //        }
        //        else
        //            [toolBar setTintColor:[UIColor colorWithRed:5 green:31 blue:75 alpha:1]];
        //[self.mainview insertSubview:toolBar atIndex:0];
        self.profileName.text = @"Work Profile";
        
      //  NSLog(@"Qtag of Work profile is %@",[defaults objectForKey:@"qtag_1"]);
        
        self.qtag.text = @"QtagW";
        [self prepare];
        
    }
    else if (self.segmentController.selectedSegmentIndex==1){
        
        QKQrCodeVC *qrCodeVC = (QKQrCodeVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKQrCodeVC"];
        qrCodeVC.profile_name=@"WorkProfile";
        [self.navigationController pushViewController:qrCodeVC animated:YES];
    }
    
    
    
}

-(void)prepare{
    [self.mainview setBackgroundColor: [self colorWithHexString:@"706B6B"]];
    [UIView transitionWithView:self.popupview duration:1.0 options:UIViewAnimationOptionTransitionCurlDown animations:^(void){
        //[self.mainview setUserInteractionEnabled:NO];
        [self.popupview setHidden:NO];
        
    } completion:nil];
    
    
}

- (IBAction)myprofbtn:(id)sender {
    
    if (self.segmentController.selectedSegmentIndex ==0) {
        NSLog(@"Qtag Selected");
        self.profileName.text = @"General Profile";
        self.qtag.text = @"QTagP";
        [self prepare];
    }
    else if (self.segmentController.selectedSegmentIndex==1){
        
        QKQrCodeVC *qrCodeVC = (QKQrCodeVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKQrCodeVC"];
        qrCodeVC.profile_name=@"GeneralProfile";
        [self.navigationController pushViewController:qrCodeVC animated:YES];
    }
    
    
}

- (IBAction)familyprofibtn:(id)sender {
    
    if (self.segmentController.selectedSegmentIndex ==0) {
        NSLog(@"Qtag Selected");
        self.profileName.text = @"Family Profile";
        self.qtag.text =  @"QTagF";
        [self prepare];
    }
    else if (self.segmentController.selectedSegmentIndex==1){
        
        QKQrCodeVC *qrCodeVC = (QKQrCodeVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKQrCodeVC"];
        qrCodeVC.profile_name=@"FamilyProfile";
        [self.navigationController pushViewController:qrCodeVC animated:YES];
    }
    
    
    
}

- (IBAction)friendsprofbtn:(id)sender {
    
    if (self.segmentController.selectedSegmentIndex ==0) {
        NSLog(@"Qtag Selected");
        self.profileName.text = @"Friends Profile";
        self.qtag.text  = @"QTagFR";
        [self prepare];
    }
    else if (self.segmentController.selectedSegmentIndex==1){
        
        QKQrCodeVC *qrCodeVC = (QKQrCodeVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKQrCodeVC"];
        qrCodeVC.profile_name=@"FriendsProfile";
        [self.navigationController pushViewController:qrCodeVC animated:YES];
    }
    
}

- (IBAction)closebtn:(id)sender {
    
    self.popupview.hidden=YES;
    [self.mainview setBackgroundColor:[UIColor whiteColor] ];
    [self.mainview setUserInteractionEnabled:YES];
    //self.mainview
    
    
}


@end
