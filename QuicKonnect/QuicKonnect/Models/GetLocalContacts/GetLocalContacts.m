//
//  GetLocalContacts.m
//  QuicKonnect
//
//  Created by Amit Naskar on 30/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "GetLocalContacts.h"
#import <Contacts/Contacts.h>

@implementation GetLocalContacts

-(void)callGetContactsWithCallback:(responseCallback)callback{
    
    CNContactStore *store = [[CNContactStore alloc] init];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error){
        if (granted == YES) {
            NSLog(@"Permissions granted");
            NSArray *keys = @[CNContactFamilyNameKey, CNContactGivenNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey, CNContactEmailAddressesKey];
            NSString *containerId = store.defaultContainerIdentifier;
            NSPredicate *predicate = [CNContact predicateForContactsInContainerWithIdentifier:containerId];
            NSError *error;
            NSArray *cnContacts = [store unifiedContactsMatchingPredicate:predicate keysToFetch:keys error:&error];
            if (error) {
                NSLog(@"error fetrching contacts %@",error);
                
                
                callback(error,nil);
                
            }else{
                
                NSMutableArray *arrContacts = [[NSMutableArray alloc] init];
                
                
                
                for (CNContact *contact in cnContacts) {
                    
                    NSLog(@"%@",contact);
                    
                    CNLabeledValue *emailLabel = contact.emailAddresses.firstObject;
                    NSString *email = emailLabel.value;
                    NSString *displayName = [NSString stringWithFormat:@"%@ %@",contact.givenName,contact.familyName];
                    
                    CNPhoneNumber *phNumberLabel = [contact.phoneNumbers.firstObject.value valueForKey:@"digits"];
                    NSString *phNumber = [NSString stringWithFormat:@"%@",phNumberLabel];
                    
                    NSMutableDictionary *dicContact = [[NSMutableDictionary alloc] init];
                    [dicContact setValue:displayName forKey:@"DisplayName"];
                    [dicContact setValue:email forKey:@"Email"];
                    [dicContact setValue:phNumber forKey:@"Phone"];
                    
                    [arrContacts addObject:dicContact];
                    
                    
                    /* NSString *query = [NSString stringWithFormat:@"INSERT INTO TABLE_MOBILE_CONTACTS(display_name,photo_url,email) VALUES (\"%@\",\"%@\",\"%@\")",displayName,contact.imageData,email];
                     if ([self checkExistedContact:[self getDbFilePath] displayName:displayName email:email imageData:contact.imageData]) {
                     //
                     [self insert:[self getDbFilePath] query:query];
                     
                     NSString *localContactId = [self insertContact:[self getDbFilePath] displayName:displayName email:email imageData:contact.imageData];
                     NSLog(@"Local Contact id is %@",localContactId);
                     
                     for (CNLabeledValue *label in contact.phoneNumbers) {
                     NSString *phone = [label.value stringValue];
                     if ([phone length] > 0) {
                     
                     NSString *phoneQuery = [NSString stringWithFormat:@"INSERT INTO TABLE_MOBILE_NUMBERS (phone_number,_id) VALUES(\"%@\",\"%@\")",phone,localContactId];
                     [self insert:[self getDbFilePath] query:phoneQuery];
                     
                     }
                     }
                     
                     }*/
                    
                }
                
                
                callback(nil,arrContacts);
            }
        }
        else{
            // UIAlertController *alertController = [[UIAlertController alloc]]
            NSLog(@"permissions denied");
            return;
        }
        
    }];
}

@end
