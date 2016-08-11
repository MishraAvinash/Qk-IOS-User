//
//  QKUpdateProfileVC.m
//  QuicKonnect
//
//  Created by Amit Naskar on 28/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKUpdateProfileVC.h"
#import "Reachability.h"
#import "MTProgressIndicator.h"


@interface QKUpdateProfileVC ()
{
    NSString *dateString, *countryCodeTxt, *countryNameTxt, *gProfilePicStr, *faProfilePicStr, *fiProfilePicStr,*wProfilePicStr;
    Reachability *reachability;
    BOOL keyboardIsShown;
    UITextField *activeField;
    
    
    UpdateProfileCell *cell;
}
@end

@implementation QKUpdateProfileVC


-(void)backToPriorView{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
   
    
    reachability  = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    // [aButton setTitle:@"Cancel" forState:UIControlStateNormal];
    
    
    UIImage *aButton1 = [UIImage imageNamed:@"left-arrow2.png"];
    [aButton setBackgroundImage:aButton1 forState:UIControlStateNormal];
    aButton.frame = CGRectMake(-20,-10, 18, 22);
    [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    [aButton addTarget:self action:@selector(backToPriorView) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = backButton;

    
    
    // [self.generalScrollView setContentSize:CGSizeMake(400, 1000)];
   // [self.generalScrollView setScrollEnabled:YES];
    
    
  /*  if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
        
        self.generalView.hidden = NO;
        self.FFView.hidden = YES;
        self.workView.hidden = YES;
    }
    else if ([self.profile_name isEqualToString:@"FriendsProfile"]) {
        self.generalView.hidden = YES;
        self.FFView.hidden = NO;
        self.workView.hidden = YES;
        NSLog(@"general profile data needs to populate -=-=-=-=-=-> %@",[defaults objectForKey:@"userGeneralProfileData"]);
        [self updateViewData];
    }
    else if ([self.profile_name isEqualToString:@"FamilyProfile"]) {
        self.generalView.hidden = YES;
        self.FFView.hidden = NO;
        self.workView.hidden = YES;
        [self updateViewData];
    }
    else if ([self.profile_name isEqualToString:@"WorkProfile"]) {
        self.generalView.hidden = YES;
        self.FFView.hidden = YES;
        self.workView.hidden = NO;
        [self updateViewData];
    }*/
    
   /* UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard:)];
    [self.generalScrollView addGestureRecognizer:gestureRecognizer];
    [self.ffScrollView addGestureRecognizer:gestureRecognizer];
    [self.workScrollView addGestureRecognizer:gestureRecognizer];*/
    
    
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
    static NSString *MyIdentifier = @"UpdateProfileCell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UpdateProfileCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier];
    }
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    
    cell.gEmail.text = self.signupCriteria.email;
    cell.gFirstName.text = self.signupCriteria.fName;
    cell.gLastName.text = self.signupCriteria.lName;
    
    [[cell.gAboutMeTxt layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[cell.gAboutMeTxt layer] setBorderWidth:1];
    
    //[[self.ffAboutMeTxt layer] setBorderColor:[[UIColor grayColor] CGColor]];
    //[[self.ffAboutMeTxt layer] setBorderWidth:1];
    
    
    //[[self.wAboutMeTxt layer] setBorderColor:[[UIColor grayColor] CGColor]];
    //[[self.wAboutMeTxt layer] setBorderWidth:1];
    
    
    //General Profile
    
    cell.gDisplayName.delegate = self;
    cell.gEmail.delegate = self;
    cell.gPhoneNumber.delegate = self;
    cell.gBirthday.delegate = self;
    
    cell.gFirstName.delegate = self;
    cell.gLastName.delegate = self;
    cell.gCurrentLocation.delegate = self;
    cell.gCountry.delegate = self;
    cell.gHomeTown.delegate = self;
    cell.gAboutMeTxt.delegate = self;
    
    cell.gHomePhone.delegate = self;
    cell.gWorkPhone.delegate = self;
    cell.gPhoneOther.delegate = self;
    cell.gWorkEmail.delegate = self;
    cell.gWebsite.delegate = self;
    cell.gFacebook.delegate = self;
    cell.gInstagram.delegate = self;
    cell.gTwitter.delegate = self;
    cell.gSnapChat.delegate = self;
    cell.gLinkedin.delegate = self;
    cell.gGooglePlus.delegate = self;
    
    cell.gSchoolDate.delegate = self;
    cell.gCollegeDate.delegate = self;
    cell.gEngagementDate.delegate = self;
    cell.gMarriageDate.delegate = self;
    
    cell.gHighSchool.delegate = self;
    cell.gCollege.delegate = self;
    cell.gCompanyName.delegate = self;
    cell.gJobTitle.delegate = self;
    
    /*
     //Friends and Family Profile
     self.ffDisplayName.delegate = self;
     self.ffPhoneNumber.delegate = self;
     self.ffBirthday.delegate = self;
     
     self.ffLastName.delegate = self;
     self.ffFirstName.delegate = self;
     self.ffCurrentLocation.delegate = self;
     self.ffCountry.delegate = self;
     self.ffHomeTown.delegate = self;
     self.ffAboutMeTxt.delegate = self;
     
     self.ffHomePhone.delegate = self;
     self.ffEmailPersonal.delegate = self;
     self.ffPhoneOther.delegate = self;
     self.ffFacebook.delegate = self;
     self.ffInstagram.delegate = self;
     self.ffTwitter.delegate = self;
     self.ffSnapChat.delegate = self;
     self.ffLinkedin.delegate = self;
     self.ffGooglePlus.delegate = self;
     self.ffWebsite.delegate = self;
     
     self.ffSchoolDate.delegate = self;
     self.ffCollegeDate.delegate = self;
     self.ffEngagementDate.delegate = self;
     self.ffMarriageDate.delegate = self;
     
     self.ffHighSchool.delegate = self;
     self.ffCollege.delegate = self;
     
     //Work Profile delegates
     
     self.wDisplayName.delegate = self;
     self.wPhone.delegate = self;
     self.wWorkEmail.delegate = self;
     self.wBirthday.delegate = self;
     
     self.wFirstName.delegate = self;
     self.wLastName.delegate = self;
     self.wCurrentLocation.delegate = self;
     self.wCountry.delegate = self;
     
     self.wAboutMeTxt.delegate = self;
     
     self.wHomePhone.delegate = self;
     
     self.wPhoneOther.delegate = self;
     self.wFacebook.delegate = self;
     
     self.wTwitter.delegate = self;
     
     self.wLinkedin.delegate = self;
     self.wGooglePlus.delegate = self;
     self.wWebsite.delegate = self;
     
     self.wHighSchool.delegate = self;
     self.wCollege.delegate = self;
     self.wCompanyName.delegate = self;
     self.wJobTitle.delegate = self;*/
    
    
    
    
    genderTxt=@"MALE";
    
    UIToolbar *keyboardToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    keyboardToolBar.barStyle = UIBarStyleDefault;
    [keyboardToolBar setItems: [NSArray arrayWithObjects:
                                
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(resignKeyboard)],
                                nil]];
    cell.gBirthday.inputAccessoryView = keyboardToolBar;
    // self.ffBirthday.inputAccessoryView = keyboardToolBar;
    // self.wBirthday.inputAccessoryView = keyboardToolBar;
    cell.gSchoolDate.inputAccessoryView = keyboardToolBar;
    cell.gCollegeDate.inputAccessoryView = keyboardToolBar;
    cell.gEngagementDate.inputAccessoryView = keyboardToolBar;
    cell.gMarriageDate.inputAccessoryView = keyboardToolBar;
    
    // self.ffSchoolDate.inputAccessoryView = keyboardToolBar;
    // self.ffCollegeDate.inputAccessoryView = keyboardToolBar;
    // self.ffEngagementDate.inputAccessoryView = keyboardToolBar;
    // self.ffMarriageDate.inputAccessoryView = keyboardToolBar;
    
    return cell;
}

#pragma mark - text field datasource and delegates

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    /*[self.generalScrollView setContentSize:CGSizeMake(self.generalScrollView.frame.size.width, self.generalScrollView.frame.size.height+1500)];
    [self.ffScrollView setContentSize:CGSizeMake(self.ffScrollView.frame.size.width, self.ffScrollView.frame.size.height+1300)];
    [self.workScrollView setContentSize:CGSizeMake(self.workScrollView.frame.size.width, self.workScrollView.frame.size.height+1000)];*/
    return YES;
}

/***
 //
 //This method is calling while start the editing
 //
 ***/

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    // activeField = textField;
    //[self animateTextField:textField up:YES];
    //[self animateTextField:textField up:YES];
  //  NSString *alertTitle, *alertMsg;
    if (textField.tag == 101 || textField.tag == 106) {
        [self intializeTextFieldInputViewGDob];
    }
    if (textField.tag == 102 || textField.tag == 107) {
        
        [self intializeTextFieldInputViewdates:@"schoolDate"];
    }
    if (textField.tag == 103 || textField.tag == 108) {
        
        [self intializeTextFieldInputViewdates:@"collegeDate"];
    }
    if (textField.tag == 104 || textField.tag == 109) {
        
        [self intializeTextFieldInputViewdates:@"engagementDate"];
    }
    if (textField.tag == 105 || textField.tag == 110) {
        
        [self intializeTextFieldInputViewdates:@"marriageDate"];
    }
   /* if (textField.tag == 20) {
        if (countryCodeTxt == (id)[NSNull null] || countryCodeTxt.length == 0) {
            alertTitle = @"Select Country Code";
            alertMsg = @"please Select country code";
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle message:alertMsg preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                // -[self gConuntryCodeBtnClick];
                // [self countryCodeAlert];
            }]];
            [self presentViewController:alertController animated:YES completion:nil];
            //            dispatch_async(dispatch_get_main_queue(), ^{
            //                [self presentViewController:alertController animated:YES completion:nil];
            //            });
            
        }
        else{
            NSLog(@"countru code is there %@",countryCodeTxt);
        }
    }*/
    
}
/***
 //
 //Text field end editing method
 //
 ***/
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    // [self animateTextField:textField up:NO];
    NSString *alertTitle, *alertMsg;
    
    NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailReg];
    if (textField.tag == 200) {
        if ([emailTest evaluateWithObject:cell.gEmail.text] == NO) {
            {
                alertTitle = @"Enter the Valid Email ID";
                alertMsg = @"please try with proper email id";
                [self showAlertMsg:alertTitle alertMsg:alertMsg];
                [cell.gEmail becomeFirstResponder];
            }
        }
    }
    if (textField.tag == 201) {
        if ([emailTest evaluateWithObject:cell.gWorkEmail.text] == NO) {
            {
                alertTitle = @"Enter the Valid Email ID";
                alertMsg = @"please try with proper Work email Address";
                [self showAlertMsg:alertTitle alertMsg:alertMsg];
                [cell.gWorkEmail becomeFirstResponder];
            }
        }
    }
    /*if (textField.tag == 202) {
        if ([emailTest evaluateWithObject:self.ffEmailPersonal.text] == NO) {
            {
                alertTitle = @"Enter the Valid Email ID";
                alertMsg = @"please try with proper personal Email Address";
                [self showAlertMsg:alertTitle alertMsg:alertMsg];
                [self.ffEmailPersonal becomeFirstResponder];
            }
        }
    }
    if (textField.tag == 203) {
        if ([emailTest evaluateWithObject:self.wWorkEmail.text] == NO) {
            {
                alertTitle = @"Enter the Valid Email ID";
                alertMsg = @"please try with Work email address";
                [self showAlertMsg:alertTitle alertMsg:alertMsg];
                [self.wWorkEmail becomeFirstResponder];
            }
        }
    }*/
    if (textField.tag == 20) {
        
        if (cell.gPhoneNumber.text.length<10 || 13<cell.gPhoneNumber.text.length ) {
            alertTitle = @"phone number length is wrong";
            alertMsg = @"please enter correct phone number";
            [self showAlertMsg:alertTitle alertMsg:alertMsg];
            [cell.gPhoneNumber becomeFirstResponder];
        }
    }
   /* if (textField.tag == 21) {
        
        if (self.ffPhoneNumber.text.length<10 || 13<self.ffPhoneNumber.text.length ) {
            alertTitle = @"phone number length is wrong";
            alertMsg = @"please enter correct phone number";
            [self showAlertMsg:alertTitle alertMsg:alertMsg];
            [self.ffPhoneNumber becomeFirstResponder];
        }
    }
    if (textField.tag == 23) {
        
        if (self.wPhone.text.length<10 || 13<self.wPhone.text.length ) {
            alertTitle = @"phone number length is wrong";
            alertMsg = @"please enter correct phone number";
            [self showAlertMsg:alertTitle alertMsg:alertMsg];
            [self.wPhone becomeFirstResponder];
        }
    }*/
    if (textField.tag == 30) {
        
        if (cell.gHomePhone.text.length<10 || 13<cell.gHomePhone.text.length ) {
            alertTitle = @"phone number length is wrong";
            alertMsg = @"please enter correct phone number";
            [self showAlertMsg:alertTitle alertMsg:alertMsg];
            [cell.gHomePhone becomeFirstResponder];
        }
    }
    if (textField.tag == 31) {
        
        if (cell.gWorkPhone.text.length<10 || 13<cell.gWorkPhone.text.length ) {
            alertTitle = @"phone number length is wrong";
            alertMsg = @"please enter correct phone number";
            [self showAlertMsg:alertTitle alertMsg:alertMsg];
            [cell.gWorkPhone becomeFirstResponder];
        }
    }
    if (textField.tag == 32) {
        
        if (cell.gPhoneOther.text.length<10 || 13<cell.gPhoneOther.text.length ) {
            alertTitle = @"phone number length is wrong";
            alertMsg = @"please enter correct phone number";
            [self showAlertMsg:alertTitle alertMsg:alertMsg];
            [cell.gPhoneOther becomeFirstResponder];
        }
    }
   /* if (textField.tag == 40) {
        
        if (self.ffHomePhone.text.length<10 || 13<self.ffHomePhone.text.length ) {
            alertTitle = @"phone number length is wrong";
            alertMsg = @"please enter correct phone number";
            [self showAlertMsg:alertTitle alertMsg:alertMsg];
            [self.ffHomePhone becomeFirstResponder];
        }
    }
    if (textField.tag == 41) {
        
        if (self.ffPhoneOther.text.length<10 || 13<self.ffPhoneOther.text.length ) {
            alertTitle = @"phone number length is wrong";
            alertMsg = @"please enter correct phone number";
            [self showAlertMsg:alertTitle alertMsg:alertMsg];
            [self.ffPhoneOther becomeFirstResponder];
        }
    }
    if (textField.tag == 50) {
        
        if (self.wHomePhone.text.length<10 || 13<self.wHomePhone.text.length ) {
            alertTitle = @"phone number length is wrong";
            alertMsg = @"please enter correct phone number";
            [self showAlertMsg:alertTitle alertMsg:alertMsg];
            [self.wHomePhone becomeFirstResponder];
        }
    }
    if (textField.tag == 51) {
        
        if (self.wPhoneOther.text.length<10 || 13<self.wPhoneOther.text.length ) {
            alertTitle = @"phone number length is wrong";
            alertMsg = @"please enter correct phone number";
            [self showAlertMsg:alertTitle alertMsg:alertMsg];
            [self.wPhoneOther becomeFirstResponder];
        }
    }*/
    
}

-(void)showAlertMsg:(NSString *)alertTitle alertMsg:(NSString *)alertMsg{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle message:alertMsg preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
    }]];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
    
}
/***
 //
 //Following methods are initializing the text field for date picker
 //
 ***/
-(void) intializeTextFieldInputViewGDob
{
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.minuteInterval = 5;
    datePicker.backgroundColor = [UIColor whiteColor];
    datePicker.maximumDate=[NSDate date];
    [datePicker addTarget:self action:@selector(dateUpdated:) forControlEvents:UIControlEventValueChanged];
    if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
        
        cell.gBirthday.inputView = datePicker;
    }
   /* else if ([self.profile_name isEqualToString:@"WorkProfile"]) {
        self.wBirthday.inputView = datePicker;
    }
    else {
        self.ffBirthday.inputView = datePicker;
    }*/
    
}
-(void) intializeTextFieldInputViewdates:(NSString *) dateType
{
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.minuteInterval = 5;
    datePicker.backgroundColor = [UIColor whiteColor];
    datePicker.maximumDate=[NSDate date];
    if ([dateType isEqualToString:@"schoolDate"]) {
        [datePicker addTarget:self action:@selector(schoolDateUpdated:) forControlEvents:UIControlEventValueChanged];
        if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
            
            cell.gSchoolDate.inputView = datePicker;
        }
        /*else {
            self.ffSchoolDate.inputView = datePicker;
        }*/
        
    }
    else if ([dateType isEqualToString:@"collegeDate"]){
        [datePicker addTarget:self action:@selector(collegeDateUpdated:) forControlEvents:UIControlEventValueChanged];
        if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
            
            cell.gCollegeDate.inputView = datePicker;
        }
        /*else {
            self.ffCollegeDate.inputView = datePicker;
        }*/
        
    }
    else if ([dateType isEqualToString:@"engagementDate"]){
        [datePicker addTarget:self action:@selector(engagementDateUpdated:) forControlEvents:UIControlEventValueChanged];
        if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
            
            cell.gEngagementDate.inputView = datePicker;
        }
       /* else {
            self.ffEngagementDate.inputView = datePicker;
        }*/
        
    }
    else{
        [datePicker addTarget:self action:@selector(marriageDateUpdated:) forControlEvents:UIControlEventValueChanged];
        if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
            
            cell.gMarriageDate.inputView = datePicker;
        }
        /*else {
            self.ffMarriageDate.inputView = datePicker;
        }*/
        
    }
    
    
}
/***
 //
 //Following methods for updating the input with selected date
 //
 ***/
- (void) dateUpdated:(UIDatePicker *)datePicker {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MMM/yyyy"];
    //self.gBirthday.text = [formatter stringFromDate:datePicker.date];
    if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
        cell.gBirthday.text = [formatter stringFromDate:datePicker.date];
    }
    /*else if ([self.profile_name isEqualToString:@"WorkProfile"]) {
        self.wBirthday.text = [formatter stringFromDate:datePicker.date];
    }
    else {
        self.ffBirthday.text = [formatter stringFromDate:datePicker.date];
    }*/
    
    //self.ffBirthday.text = [formatter stringFromDate:datePicker.date];
}
- (void) schoolDateUpdated:(UIDatePicker *)datePicker {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MMM/yyyy"];
    
    if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
        cell.gSchoolDate.text = [formatter stringFromDate:datePicker.date];
    }
    /*else {
        self.ffSchoolDate.text = [formatter stringFromDate:datePicker.date];
    }*/
    
}
- (void) collegeDateUpdated:(UIDatePicker *)datePicker {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MMM/yyyy"];
    
    if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
        cell.gCollegeDate.text = [formatter stringFromDate:datePicker.date];
    }
    /*else {
        self.ffCollegeDate.text = [formatter stringFromDate:datePicker.date];
    }*/
    
}
- (void) engagementDateUpdated:(UIDatePicker *)datePicker {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MMM/yyyy"];
    
    if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
        cell.gEngagementDate.text = [formatter stringFromDate:datePicker.date];
    }
    /*else {
        self.ffEngagementDate.text = [formatter stringFromDate:datePicker.date];
    }*/
}
- (void) marriageDateUpdated:(UIDatePicker *)datePicker {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MMM/yyyy"];
    
    if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
        cell.gMarriageDate.text = [formatter stringFromDate:datePicker.date];
    }
    /*else {
        self.ffMarriageDate.text = [formatter stringFromDate:datePicker.date];
    }*/
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string  {
    if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
        if (textField == cell.gHomePhone || textField == cell.gPhoneNumber || textField == cell.gWorkPhone || textField == cell.gPhoneOther ) {
            NSUInteger newLength = [textField.text length] + [string length] - range.length;
            NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            return (([string isEqualToString:filtered])&&(newLength <= 10));
            
        }
        if (textField == cell.gHomePhone || textField == cell.gPhoneNumber || textField == cell.gWorkPhone || textField == cell.gPhoneOther ) {
            NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
            NSLog(@"it is text field for number");
            BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
            return stringIsValid;
            
        }
        
    }
    /*else if ([self.profile_name isEqualToString:@"WorkProfile"]){
        if (textField == self.wHomePhone || textField == self.wPhone || textField == self.wPhoneOther ) {
            NSUInteger newLength = [textField.text length] + [string length] - range.length;
            NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            return (([string isEqualToString:filtered])&&(newLength <= 10));
            
        }
        if (textField == self.wHomePhone || textField == self.wPhone || textField == self.wPhoneOther ) {
            NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
            NSLog(@"it is text field for number");
            BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
            return stringIsValid;
            
        }
        
    }
    else {
        
        if (textField == self.ffHomePhone || textField == self.ffPhoneOther || textField == self.ffPhoneOther ) {
            NSUInteger newLength = [textField.text length] + [string length] - range.length;
            NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            return (([string isEqualToString:filtered])&&(newLength <= 10));
            
        }
        if (textField == self.ffHomePhone || textField == self.ffPhoneOther || textField == self.ffPhoneOther) {
            NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
            NSLog(@"it is text field for number");
            BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
            return stringIsValid;
            
        }
        
    }*/
    return YES;
}

-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    const int movementDistance = -130; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



#pragma mark - Resign and Hide Keyboard

-(void)resignKeyboard{
    [cell.gBirthday resignFirstResponder];
   // [self.ffBirthday resignFirstResponder];
   // [self.wBirthday resignFirstResponder];
    [cell.gSchoolDate resignFirstResponder];
    [cell.gCollegeDate resignFirstResponder];
    [cell.gEngagementDate resignFirstResponder];
    [cell.gMarriageDate resignFirstResponder];
   // [self.ffSchoolDate resignFirstResponder];
   // [self.ffCollegeDate resignFirstResponder];
   // [self.ffEngagementDate resignFirstResponder];
   // [self.ffMarriageDate resignFirstResponder];
    
}

-(void) hideKeyBoard:(UIGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}


#pragma mark - Update Profile delegate methods
//Country Code method
- (void)gConuntryCodeBtnClick:(id)sender {
    
    [self countryCodeAlert];
    
}


-(void)countryCodeAlert{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Select Country Code " message:@" " preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"54 - Argentina" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+54" countryName:@"Argentina"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"374 - Armenia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+374" countryName:@"Armenia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"61 - Australia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+61" countryName:@"Australia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"43 - Austria" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+43" countryName:@"Austria"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"994 - Azerbaijan" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+994" countryName:@"Azerbaijan"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"375 - Belarus" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+375" countryName:@"Belarus"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"32 - Belgium" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+32" countryName:@"Belgium"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"591 - Bolivia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+591" countryName:@"Bolivia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"387 - Bosnia  Herzegovina" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+387" countryName:@"Bosnia  Herzegovina"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"55 - Brazil" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+55" countryName:@"Brazil"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"359 - Bulgaria" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+359" countryName:@"Bulgaria"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"1 - Canada" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+1" countryName:@"Canada"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"86 - China" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+86" countryName:@"China"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"57 - Colombia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+57" countryName:@"Colombia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"385 - Croatia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+385" countryName:@"Croatia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"357 - Cyprus" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+357" countryName:@"Cyprus"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"420 - Czech Republic" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+420" countryName:@"Czech Republic"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"45 - Denmark" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+45" countryName:@"Denmark"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"372 - Estonia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+372" countryName:@"Estonia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"358 - Finland" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+358" countryName:@"Finland"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"33 - France" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+33" countryName:@"France"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"995 - Georgia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+995" countryName:@"Georgia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"49 - Germany" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+49" countryName:@"Germany"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"233 - Ghana" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+233" countryName:@"Ghana"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"30 - Greece" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+30" countryName:@"Greece"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"852 - Hong Kong" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+852" countryName:@"Hong Kong"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"36 - Hungary" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+36" countryName:@"Hungary"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"354 - Iceland" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+354" countryName:@"Iceland"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"91 - India" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+91" countryName:@"India"];
        NSLog(@"Country code %@ and name: %@ in selected",countryCodeTxt,countryNameTxt);
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"62 - Indonesia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+62" countryName:@"Indonesia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"98 - Iran" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+98" countryName:@"Iran"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"353 - Ireland" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+353" countryName:@"Ireland"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"972 - Israel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+972" countryName:@"Israel"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"39 - Italy" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+39" countryName:@"Italy"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"81 - Japan" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+81" countryName:@"Japan"];
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"7 - Kazakhstan" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+7" countryName:@"Kazakhstan"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"254 - Kenya" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+254" countryName:@"Kenya"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"996 - Kyrgyzstan" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+996" countryName:@"Kyrgyzstan"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"371 - Latvia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+371" countryName:@"Venezuela"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"423 - Liechtenstein" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+58" countryName:@"Latvia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"370 - Lithuania" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"352 - Luxembourg" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+352" countryName:@"Luxembourg"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"389 - Macedonia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+389" countryName:@"Macedonia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"596 - Martinique" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+596" countryName:@"Martinique"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"373 - Moldova" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+373" countryName:@"Moldova"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"377 - Monaco" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+377" countryName:@"Monaco"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"31 - Netherlands" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+31" countryName:@"Netherlands"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"64 - New Zealand" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+64" countryName:@"New Zealand"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"47 - Norway" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+47" countryName:@"Norway"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"970 - Palestine" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+970" countryName:@"Palestine"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"51 - State of PS Peru" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+51" countryName:@"State of PS Peru"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"63 - Philippines" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+63" countryName:@"Philippines"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"48 - Poland" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+48" countryName:@"Poland"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"351 - Portugal" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+351" countryName:@"Portugal"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"40 - Romania" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+40" countryName:@"Romania"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"7 - Russia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+7" countryName:@"Russia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"381 - Serbia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+381" countryName:@"Serbia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"65 - Singapore" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+65" countryName:@"Singapore"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"421 - Slovakia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+421" countryName:@"Slovakia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"386 - Slovenia" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+386" countryName:@"Slovenia"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"27 - South Africa" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+27" countryName:@"South Africa"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"34 - Spain" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+34" countryName:@"Spain"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"94 - Sri Lanka" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+94" countryName:@"Sri Lanka"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"46 - Sweden" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+46" countryName:@"Sweden"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"41 - Switzerland" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+41" countryName:@"Switzerland"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"90 - Turkey" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+90" countryName:@"Turkey"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"256 - Uganda" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+256" countryName:@"Uganda"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"380 - Ukraine" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+380" countryName:@"Ukraine"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"971 - United Arab Emirates" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+971" countryName:@"United Arab Emirates"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"44 - United Kingdom" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+44" countryName:@"United Kingdom"];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"1 - U.S.A." style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+1" countryName:@"U.S.A."];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"58 - Venezuela" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self setCountryData:@"+58" countryName:@"Venezuela"];}]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        
    }]];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
    
    NSLog(@"user selected country code %@ for country %@",countryCodeTxt,countryNameTxt);
    cell.gCountry.text = countryNameTxt;
    
    
}
-(void)setCountryData:(NSString *)countryCode countryName:(NSString *)countryName{
    
    countryCodeTxt = countryCode;
    countryNameTxt = countryName;
    if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
        [cell.gCountryCode setTitle:countryCode forState:UIControlStateNormal];
        cell.gCountry.text = countryName;
    }
   /* else if ([self.profile_name isEqualToString:@"WorkProfile"]) {
        [self.wCountryCode setTitle:countryCode forState:UIControlStateNormal];
        self.wCountry.text = countryName;
    }
    else
    {
        [self.ffCountryCode setTitle:countryCode forState:UIControlStateNormal];
        self.ffCountry.text = countryName;
    }*/
    
}


- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}


- (void)uploadPic:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    UIAlertController *alertController =[UIAlertController
                                         alertControllerWithTitle:nil
                                         message:nil
                                         preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction
                                actionWithTitle:@"Choose Existing" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                                    
                                    if (picker) {
                                        picker.allowsEditing = YES;
                                        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                    }
                                    [self presentViewController:picker animated:YES completion:nil];
                                }]];
    [alertController addAction:[UIAlertAction
                                actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                                    if (picker) {
                                        
                                        picker.allowsEditing = YES;
                                        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                                        
                                    }
                                    [self presentViewController:picker animated:YES completion:nil];
                                }]];
    
    [alertController addAction:[UIAlertAction
                                actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
                                    
                                }]];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chooseImage = info[UIImagePickerControllerEditedImage];
    
    NSLog(@"it is in did finish picker");
    
    if ([self.profile_name isEqualToString:@"GeneralProfile"]) {
        cell.generalProfilePic.image=chooseImage;
        cell.generalProfilePic.layer.cornerRadius = cell.generalProfilePic.frame.size.height /2;
        cell.generalProfilePic.layer.masksToBounds = YES;
        cell.generalProfilePic.layer.borderWidth = 0;
        
        gProfilePicStr = [self encodeToBase64String:chooseImage];
        
        NSLog(@"Profile pic in general profile");
    }
  /*  else if ([self.profile_name isEqualToString:@"FriendsProfile"]) {
        self.ffProfilePic.image=chooseImage;
        self.ffProfilePic.layer.cornerRadius = self.ffProfilePic.frame.size.height /2;
        self.ffProfilePic.layer.masksToBounds = YES;
        self.ffProfilePic.layer.borderWidth = 0;
        
        fiProfilePicStr = [self encodeToBase64String:chooseImage];
    }
    else if ([self.profile_name isEqualToString:@"FamilyProfile"]) {
        self.ffProfilePic.image=chooseImage;
        self.ffProfilePic.layer.cornerRadius = self.ffProfilePic.frame.size.height /2;
        self.ffProfilePic.layer.masksToBounds = YES;
        self.ffProfilePic.layer.borderWidth = 0;
        
        
        faProfilePicStr = [self encodeToBase64String:chooseImage];
    }
    else if ([self.profile_name isEqualToString:@"WorkProfile"]) {
        self.workProfilePic.image=chooseImage;
        self.workProfilePic.layer.cornerRadius = self.workProfilePic.frame.size.height /2;
        self.workProfilePic.layer.masksToBounds = YES;
        self.workProfilePic.layer.borderWidth = 0;
        
        wProfilePicStr = [self encodeToBase64String:chooseImage];
    }*/
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)gActivitiesBtn:(id)sender {
    
    UIAlertController *alertController =[UIAlertController
                                         alertControllerWithTitle:@"Activities" message:@"Enter Your Activity" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel") style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
                                       
                                   }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = NSLocalizedString(@"ACTIVITY1, ACTIVITY2", @"ACTIVITY1, ACTIVITY2");
        if (![activitiesTextField isEqual: [NSNull null]]) {
            textField.text = activitiesTextField;
        }
        
        
        
    }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Ok", @"Ok")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){
                                   UITextField *activitiesText = alertController.textFields.firstObject;
                                   activitiesTextField = activitiesText.text;
                                   NSLog(@"Activities %@ and %@",activitiesTextField,activitiesText.text);
                               }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)gTVShowsBtn:(id)sender {
    
    UIAlertController *alertController =[UIAlertController
                                         alertControllerWithTitle:@"TV Shows" message:@"Enter Your Favourite TV Show" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel")
                                   style:UIAlertActionStyleDestructive
                                   handler:^(UIAlertAction *action){
                                       
                                   }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = NSLocalizedString(@"TV SHOWS1, TV SHOWS2", @"Enter TV SHOWS1, TV SHOWS2");
        if (![tvShowsTextField isEqual: [NSNull null]]) {
            textField.text = tvShowsTextField;
        }
        
        
        
    }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Ok", @"Ok")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){
                                   UITextField *tvshowsText = alertController.textFields.firstObject;
                                   tvShowsTextField = tvshowsText.text;
                                   NSLog(@"TV Showa %@ and %@",tvShowsTextField,tvshowsText.text);
                               }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}

- (void)gSportsBtn:(id)sender {
    
    UIAlertController *alertController =[UIAlertController
                                         alertControllerWithTitle:@"Sports" message:@"Enter Your Favourite Sports" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel")
                                   style:UIAlertActionStyleDestructive
                                   handler:^(UIAlertAction *action){
                                       
                                   }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = NSLocalizedString(@"SPORTS1,SPORTS2", @"SPORTS1,SPORTS2");
        if (![sportsTextField isEqual: [NSNull null]]) {
            textField.text = sportsTextField;
        }
        
        
    }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Ok", @"Ok")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){
                                   UITextField *sportsText = alertController.textFields.firstObject;
                                   sportsTextField = sportsText.text;
                                   NSLog(@"Sports %@ and %@",sportsTextField,sportsText.text);
                               }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
}

- (void)gBooksBtn:(id)sender {
    
    UIAlertController *alertController =[UIAlertController
                                         alertControllerWithTitle:@"Books" message:@"Enter Your Favourite Books" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel")
                                   style:UIAlertActionStyleDestructive
                                   handler:^(UIAlertAction *action){
                                       
                                   }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = NSLocalizedString(@"BOOK1,BOOK2", @"BOOK1,BOOK2");
        
        if (![booksTextField isEqual: [NSNull null]]) {
            textField.text = booksTextField;
        }
        
        
    }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Ok", @"Ok")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){
                                   UITextField *booksText = alertController.textFields.firstObject;
                                   booksTextField = booksText.text;
                                   NSLog(@"books %@ and %@",booksTextField,booksText.text);
                               }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}

- (void)gMusicBtn:(id)sender {
    
    UIAlertController *alertController =[UIAlertController
                                         alertControllerWithTitle:@"Music" message:@"Enter Your Favourite Music" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel")
                                   style:UIAlertActionStyleDestructive
                                   handler:^(UIAlertAction *action){
                                       
                                   }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = NSLocalizedString(@"MUSIC1,MUSIC2", @"MUSIC1,MUSIC2");
        
        if (![musicTextField isEqual: [NSNull null]]) {
            textField.text = musicTextField;
        }
        
        
        
    }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Ok", @"Ok")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){
                                   UITextField *musicText = alertController.textFields.firstObject;
                                   musicTextField = musicText.text;
                                   NSLog(@"music %@ and %@",musicTextField,musicText.text);
                               }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
}

- (void)gMoviesBtn:(id)sender {
    
    UIAlertController *alertController =[UIAlertController
                                         alertControllerWithTitle:@"Movies" message:@"Enter Your Favourite Movie" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel")
                                   style:UIAlertActionStyleDestructive
                                   handler:^(UIAlertAction *action){
                                       
                                   }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = NSLocalizedString(@"MOVIE1,MOVIE2", @"MOVIE1,MOVIE2");
        
        if (![moviesTextField isEqual: [NSNull null]]) {
            textField.text = moviesTextField;
        }
        
    }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Ok", @"Ok")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){
                                   UITextField *moviesText = alertController.textFields.firstObject;
                                   moviesTextField = moviesText.text;
                                   NSLog(@"Movies %@ and %@",moviesTextField,moviesText.text);
                               }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
}

- (void)genderBtnClick:(id)sender {
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0)
    {
        genderTxt = @"MALE";
    }
    else
    {
        genderTxt = @"FEMALE";
        
    }
    
}


- (void)gSaveBtn:(id)sender {
  /*  [[NSNotificationCenter defaultCenter] postNotificationName:@"NavigateToSlider" object:nil];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];*/
    
    if (cell.gPhoneNumber.text.length>0) {
        self.signupCriteria.phNumber = cell.gPhoneNumber.text;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [[MTProgressIndicator sharedIndicator] showProgressView];
                
            });
            
            [self callSignUpService];
        });
        
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QuicKonnect" message:@"Please enter your phone number" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void) callSignUpService
{
    
    QKSignUpRequest* request = [[QKSignUpRequest alloc] init];
    [request callRegistrationServiceWithCriteria:self.signupCriteria withCallback:^(NSError* error, QKResponse* response){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
             [[MTProgressIndicator sharedIndicator] dismissProgressView];
            
        });
        
        if (error) {
            
            // NSLog(@"%@",error);
            
            return ;
        }
        
      //  QKSIgnUpResponse* signupResponse = (QKSIgnUpResponse*)response;

       // NSString* userId = [NSString stringWithFormat:@"%@",signupResponse.userid];
       //  NSString* userName = [NSString stringWithFormat:@"%@",signupResponse.username];
        
      //   NSLog(@"%@",userId);
       //  NSLog(@"%@",userName);
       
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NavigateToSlider" object:nil];
        
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        
    }];
}



@end
