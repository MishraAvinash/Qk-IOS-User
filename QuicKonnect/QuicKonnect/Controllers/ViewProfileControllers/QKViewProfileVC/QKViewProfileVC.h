//
//  QKViewProfileVC.h
//  QuicKonnect
//
//  Created by Amit Naskar on 01/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QKViewProfileVC : UIViewController<UITextFieldDelegate,UITextViewDelegate>

@property(nonatomic, retain)NSMutableArray *profilesRecord;
@property(nonatomic, retain)NSManagedObjectContext *managedObjectContext;
@property(nonatomic, retain)NSMutableArray *personData;
@property(nonatomic, retain)NSManagedObjectContext *stdManagedObjectContext;

@property(nonatomic, retain) IBOutlet UITextField *displayname;
@property(nonatomic, retain) IBOutlet UITextField *phonenumber ;
@property(nonatomic, retain) IBOutlet UITextField *birthday ;

-(IBAction)getCallBack:(UIStoryboardSegue *)segue;
-(void)reloadProfilesRecords;

@end
