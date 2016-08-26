//
//  ScanDBOperation.m
//  MultiThread1
//
//  Created by Vijaya Gujjari on 09/08/16.
//  Copyright © 2016 VIJAYA. All rights reserved.
//

#import "ScanDB.h"
#import "AppDelegate.h"

#import "GenProfile.h"
#import "MTProgressIndicator.h"
#import "QKProfileFillingRequest.h"
#import "QKProfileFillingResponse.h"
#import "QKCoreDataInterface.h"

NSString* respMessage = @"";
NSString* authString = @"";

@implementation ScanDB

/*
 firstTime = true;
 AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
 NSManagedObjectContext* localDownloadContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
 
 NSPersistentStoreCoordinator* psc = [delegate persistentStoreCoordinator];
 [localDownloadContext setPersistentStoreCoordinator:psc];
 [localDownloadContext setUndoManager:nil];
 
 NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
 [center addObserver:self selector:@selector(mergeChanges:) name:NSManagedObjectContextDidSaveNotification object:localDownloadContext];
 
 [localDownloadContext performBlockAndWait:^{
 
 // Do things in the context.
 // Every 50 or so creations/updates/deletions, then once at the end, save the localContext, which will merge the changes and update the main context.
 NSLog(@"In PerformBlockAndWait");
 
 // NSString* responseMessage = @"";
 
 //Send Request To Server
 [NSThread detachNewThreadSelector:@selector(sendRequestToServer:) toTarget:self withObject:responseMessage];
 while([responseMessage isEqualToString:@""])
 {
 NSLog(@"Waiting in while loop : Download Operation main : %@", responseMessage);
 }
 
 
 if(firstTime)
 {
 firstTime = false;
 
 //Process the server response Message.
 NSManagedObject* skillObject = [NSEntityDescription insertNewObjectForEntityForName:@"Skills" inManagedObjectContext:localDownloadContext];
 [skillObject setValue:@"Development" forKey:@"name"];
 [skillObject setValue:@"DV001" forKey:@"code"];
 
 NSManagedObject* employee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:localDownloadContext];
 [employee setValue:@"Vijaya" forKey:@"name"];
 [employee setValue:@"DV001" forKey:@"skillcode"];
 [employee setValue:[NSNumber numberWithInt:3] forKey:@"experience"];
 [employee setValue:skillObject forKey:@"skillsrelation"];
 
 NSError* error;
 
 if (! [localDownloadContext save:&error]) {
 NSLog(@"Error saving context: %@", [error localizedDescription]);
 }
 
 responseMessage = @"";
 
 //Send Request To Server
 [NSThread detachNewThreadSelector:@selector(sendRequestToServer:) toTarget:self withObject:responseMessage];
 while([responseMessage isEqualToString:@""])
 {
 NSLog(@"Waiting in while loop : Download Operation main");
 }
 }
 
 //Process Server Response MessageCreate Skill Object and Employee Object and update DB.
 
 int iCount = 0;
 
 responseMessage = @""; //rescan
 //New object recevied from server.
 NSManagedObject* skill2 = [NSEntityDescription insertNewObjectForEntityForName:@"Skills" inManagedObjectContext:localDownloadContext];
 [skill2 setValue:@"ProjectManagement" forKey:@"name"];
 
 NSManagedObject* emp2 = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:localDownloadContext];
 [emp2 setValue:@"Neha" forKey:@"name"];
 [emp2 setValue:@"PM001" forKey:@"skillcode"];
 [emp2 setValue:[NSNumber numberWithInt:2] forKey:@"experience"];
 [emp2 setValue:skill2 forKey:@"skillsrelation"];
 iCount = 50; //Set the increment counter based on the number of objects received.
 
 if (iCount % 50 == 0)
 {
 NSError* error;
 
 if (! [localDownloadContext save:&error]) {
 NSLog(@"Error saving context: %@", [error localizedDescription]);
 }
 }
 
 }];

 
 
 */

- (void) AddProfileToServer :(NSString*)email
{
   // firstTime = true;
    
    NSManagedObjectContext* moc = [QKCoreDataInterface getContext];

        //Perform Fetch from DB
        
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        NSEntityDescription* entity2 = (NSEntityDescription*)[NSEntityDescription entityForName:@"GenProfile" inManagedObjectContext:moc];
        
        [request setEntity:entity2];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"sync_flag==0"];
        NSLog(@"PREDICATE : %@", predicate);
        [request setPredicate:predicate];
        
        NSError* error;
        NSArray* fetchedObjects = [moc executeFetchRequest:request error:&error];
        
        authString = [QKCoreDataInterface getAuthorizationString:@"" :moc];
        
        for(int i = 0 ; i < [fetchedObjects count]; i++)
        {
            GenProfile* profObject = [fetchedObjects objectAtIndex:i];
            
            NSLog(@"Sync Flag : %@", profObject.sync_flag);

            NSLog(@"In PerformBlockAndWait");
        
            respMessage = @"";
            //Send Request To Server
           /* NSDictionary* dic = [[NSDictionary alloc] init];
            [dic setValue:profObject forKey:@"general_profile"];
            [dic setValue:accessToken forKey:@"access_token"]; */
            [NSThread detachNewThreadSelector:@selector(callProfileFillingService:) toTarget:self withObject:profObject];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [[MTProgressIndicator sharedIndicator] dismissProgressView];
                
                NSLog(@"THREAD SCANDB COMPLETED");
            });

            while([respMessage isEqualToString:@""])
            {
            //    NSLog(@"Waiting For Profile Filling Response from Server : %@", responseMessage);
            }

        }
    
    }

- (void) callProfileFillingService : (GenProfile*)genProfileObject
{
   // GenProfile* genProfileObject = (GenProfile*)[dic valueForKey:@"general_profile"];
   // NSString* accessToken = [dic valueForKey:@"access_token"];
    
    QKProfileFillingRequest* request = [[QKProfileFillingRequest alloc] init];
    request.authorizationString = authString;
    
    [request callProfileFillingService:genProfileObject withCallback:^(NSError* error, QKResponse* response){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [[MTProgressIndicator sharedIndicator] dismissProgressView];
            
        });
        
        if (error) {
            
            NSLog(@"%@",error);
            respMessage = @"ERROR";
            
            return ;
        }
        
        QKProfileFillingResponse* profileFillingResponse = (QKProfileFillingResponse*)response;
        
        NSString* result = profileFillingResponse.result;
        NSNumber* number = [response Response];
        

        NSLog(@"%@", number );
        
        if([number isEqualToNumber:[NSNumber numberWithInt:1]]) //Profile Filling Update Success
        {
            
            respMessage = @"UPDATED PROFILE TO SERVER SUCESSFULLY";
            NSLog(respMessage);

        }
        else
        {
            respMessage = result;
            NSLog(respMessage);
            // [self DisplayErrorAlert:@"Error Retrieving Access Token"];
        }
    }];
}




@end

