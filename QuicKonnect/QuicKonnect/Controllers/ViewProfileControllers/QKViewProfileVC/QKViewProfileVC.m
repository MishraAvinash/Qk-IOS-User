//
//  QKViewProfileVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 01/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKViewProfileVC.h"
#import "ViewProfileCell.h"

#import "QKUpdateProfileVC.h"
#import "AppDelegate.h"
#import "Profile.h"


@interface QKViewProfileVC ()
{
    ViewProfileCell *cell;
}

@end

@implementation QKViewProfileVC
@synthesize profilesRecord;
@synthesize stdManagedObjectContext ;
@synthesize personData;
@synthesize displayname, birthday, phonenumber ;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.title=navigationTitle;
    
    profilesRecord = [NSMutableArray array];
    
  //  [self.text reloadData ];
    
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    self.stdManagedObjectContext = [app managedObjectContext];
    
    
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    // [aButton setTitle:@"Cancel" forState:UIControlStateNormal];
    
    UIImage *aButton1 = [UIImage imageNamed:@"back.gif"];
    [aButton setBackgroundImage:aButton1 forState:UIControlStateNormal];
    aButton.frame = CGRectMake(-30,-10, 20, 22);
    [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    // UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    [aButton addTarget:self action:@selector(backToPriorView) forControlEvents:UIControlEventTouchUpInside];
    //self.navigationItem.leftBarButtonItem = backButton;
    
    UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *logoImg = [UIImage imageNamed:@"ic_qk_logo"];
    [logoButton setBackgroundImage:logoImg forState:UIControlStateNormal];
    logoButton.frame = CGRectMake(-80, -10, 25, 25);
    [logoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *logoBarButn = [[UIBarButtonItem alloc] initWithCustomView:logoButton];
    [logoButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    
    //NSLog(@"navigation message %@",self.test);
    UIBarButtonItem *editBar =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(profiledatabtn)] ;
     [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:logoBarButn,editBar, nil]];

}

-(void)reloadProfilesRecords{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Profile"];
    
    NSError *error;
    self.profilesRecord = [[self.stdManagedObjectContext  executeFetchRequest: request error:&error] mutableCopy];
    for(int i=0; i<[self.profilesRecord count]; i++){
        Profile *proEnt = [ self.profilesRecord objectAtIndex:i];
        NSLog(@"from CoreData Displayname %@", proEnt.displayname);
        NSLog(@"from CoreData Phonenumber %@", proEnt.phonenumber);
        NSLog(@"from CoreData Birthday %@", proEnt.birthday);
        
              
        
        
    }
  
    //[self.placeholder reloadData];
    
    
}

-(void)logoClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)backToPriorView{
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //            ProfileMeenuViewController *loginController = (ProfileMeenuViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ProfileMeenuViewController"];
    //           [self.navigationController pushViewController:loginController animated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)profiledatabtn{
   
    QKUpdateProfileVC *updateProfileVC = (QKUpdateProfileVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"QKUpdateProfileVC"];
    updateProfileVC.profile_name = @"GeneralProfile";
    [self.navigationController pushViewController:updateProfileVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view datasource and delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"ViewProfileCell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[ViewProfileCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:MyIdentifier];
    }
    
   // cell.delegate = self;
    
   // [[cell.gAboutMeTxt layer] setBorderColor:[[UIColor grayColor] CGColor]];
   // [[cell.gAboutMeTxt layer] setBorderWidth:1];
    
    //[[self.ffAboutMeTxt layer] setBorderColor:[[UIColor grayColor] CGColor]];
    //[[self.ffAboutMeTxt layer] setBorderWidth:1];
    
    
    //[[self.wAboutMeTxt layer] setBorderColor:[[UIColor grayColor] CGColor]];
    //[[self.wAboutMeTxt layer] setBorderWidth:1];
    
    
    //General Profile
    
    cell.textField1.delegate = self;
    cell.textField2.delegate= self;
    cell.textField3.delegate= self;
    
    cell.about_me.delegate = self;
    cell.general_data.delegate = self;
    cell.contact_information.delegate=self;
    cell.social_media.delegate=self;
    cell.dates_to_remember.delegate=self;
    cell.education.delegate=self;
    cell.work_experience.delegate=self;
    cell.activities_text.delegate=self;
    cell.sports_text.delegate=self;
    cell.movies_text.delegate=self;
    cell.tv_shows_text.delegate=self;
    cell.music_text.delegate=self;
    cell.books_text.delegate=self;
    
    
    CALayer *bottomBorder1 = [CALayer layer];
    bottomBorder1.frame = CGRectMake(0.0f, cell.textField1.frame.size.height - 1, cell.textField1.frame.size.width, 1.0f);
    bottomBorder1.backgroundColor = [UIColor blackColor].CGColor;
    // [self.textField1.layer addSublayer:bottomBorder1];
    
    CALayer *bottomBorder2 = [CALayer layer];
    bottomBorder2.frame = CGRectMake(0.0f, cell.textField2.frame.size.height - 1, cell.textField2.frame.size.width, 1.0f);
    bottomBorder2.backgroundColor = [UIColor blackColor].CGColor;
    [cell.textField2.layer addSublayer:bottomBorder2];
    CALayer *bottomBorder3 = [CALayer layer];
    bottomBorder3.frame = CGRectMake(0.0f, cell.textField3.frame.size.height - 1, cell.textField3.frame.size.width, 1.0f);
    bottomBorder3.backgroundColor = [UIColor blackColor].CGColor;
    [cell.textField3.layer addSublayer:bottomBorder3];
    
    [[cell.about_me layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.about_me layer] setBorderWidth:1];
    
    [[cell.general_data layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.general_data layer] setBorderWidth:1];
    
    [[cell.contact_information layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.contact_information layer] setBorderWidth:1];
    
    [[cell.social_media layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.social_media layer] setBorderWidth:1];
    
    [[cell.dates_to_remember layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.dates_to_remember layer] setBorderWidth:1];
    
    [[cell.education layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.education layer] setBorderWidth:1];
    
    [[cell.work_experience layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.work_experience layer] setBorderWidth:1];
    
    [[cell.activities_text layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.activities_text layer] setBorderWidth:1];
    [[cell.contact_information layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.contact_information layer] setBorderWidth:1];
    
    [[cell.sports_text layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.sports_text layer] setBorderWidth:1];
    
    [[cell.movies_text layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.movies_text layer] setBorderWidth:1];
    
    [[cell.tv_shows_text layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.tv_shows_text layer] setBorderWidth:1];
    
    [[cell.music_text layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.music_text layer] setBorderWidth:1];
    
    [[cell.books_text layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.books_text layer] setBorderWidth:1];
    

    
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
