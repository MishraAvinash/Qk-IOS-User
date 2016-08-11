//
//  QKQrCodeVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 01/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKQrCodeVC.h"

@interface QKQrCodeVC ()
{
    NSString *qtag;
}

@end

@implementation QKQrCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Share Profile";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0,-60) forBarMetrics:UIBarMetricsDefault];
    
    
    
    UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *logoImg = [UIImage imageNamed:@"ic_qk_logo"];
    [logoButton setBackgroundImage:logoImg forState:UIControlStateNormal];
    logoButton.frame = CGRectMake(-80, -10, 25, 25);
    [logoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *logoBarButn = [[UIBarButtonItem alloc] initWithCustomView:logoButton];
    [logoButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    
    // [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:backButton,logoBarButn, nil]];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:logoBarButn, nil]];
    
    
    //self.userName.text=[defaults objectForKey:@"Profilename"];
    self.userName.text = @"Amit";
    
    self.profileName.text=self.profile_name;
    if ([self.profile_name isEqualToString:@"WorkProfile"]) {
        qtag = @"QTagW";
    }
    else if([self.profile_name isEqualToString:@"FamilyProfile"]){
        qtag = @"QTagF";
    }
    else if ([self.profile_name isEqualToString:@"FriendsProfile"]){
        qtag = @"QTagFR";
    }else{
        qtag = @"QTagP";
    }
    
  /*  NSString *profilePicString =[defaults objectForKey:@"userProfilePic"];
    
    NSData *imagedata = [[NSData alloc]initWithBase64EncodedString:profilePicString options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *ret = [UIImage imageWithData:imagedata];
    if (profilePicString.length >10) {
        self.profilePic.image = ret;
        self.profilePic.layer.cornerRadius = self.profilePic.frame.size.height /2;
        self.profilePic.layer.masksToBounds = YES;
        self.profilePic.layer.borderWidth = 0;
        //  profilepic.layer.cornerRadius = 15;
        
    }*/
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    //    NSLog(@"filterAttributes:%@", filter.attributes);
    
    [filter setDefaults];
    
    NSString *kText = [NSString stringWithFormat:@"%@,%@",self.profile_name,qtag];
    
    NSData *data = [kText dataUsingEncoding:NSUTF8StringEncoding];
    //NSString *data = @"MyName";
    [filter setValue:data forKey:@"inputMessage"];
    
    CIImage *outputImage = [filter outputImage];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:outputImage
                                       fromRect:[outputImage extent]];
    
    UIImage *image = [UIImage imageWithCGImage:cgImage
                                         scale:1.
                                   orientation:UIImageOrientationUp];
    
    // Resize without interpolating
    UIImage *resized = [self resizeImage:image
                             withQuality:kCGInterpolationNone
                                    rate:5.0];
    
    self.imageView.image = resized;
    
    CGImageRelease(cgImage);
}
- (UIImage *)resizeImage:(UIImage *)image
             withQuality:(CGInterpolationQuality)quality
                    rate:(CGFloat)rate
{
    UIImage *resized = nil;
    CGFloat width = image.size.width * rate;
    CGFloat height = image.size.height * rate;
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, quality);
    [image drawInRect:CGRectMake(0, 0, width, height)];
    resized = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resized;
}
-(void)backToPriorView{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)logoClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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

@end
