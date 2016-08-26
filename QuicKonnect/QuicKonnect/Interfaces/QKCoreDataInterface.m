//
//  QKCoreDataInterface.m
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 17/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "QKCoreDataInterface.h"
#import "QKSignUPResponse.h"
#import "QKAccessTokenResponse.h"

@implementation QKCoreDataInterface


+ (NSManagedObjectContext*) getContext
{
    if(qkManagedObjectContext == nil)
    {
        AppDelegate *app = [[UIApplication sharedApplication]delegate];
        qkManagedObjectContext = [app managedObjectContext];
    }
    return qkManagedObjectContext;
}

+ (NSEntityDescription*)fetchEntityFor:(NSString*)entityName :(NSString*)key :(NSString*)value
{
    NSManagedObjectContext* moc = [self getContext];
    NSEntityDescription* entityInstance = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    if(![key isEqualToString:@""] && ![value isEqualToString:@""])
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K==%@", key, value];
        [request setPredicate:predicate];
    }
    
    NSArray *fetchedArray = [moc executeFetchRequest:request error:nil];
    if ([fetchedArray count] > 0) {
        entityInstance =  [fetchedArray objectAtIndex:0];
    }
    return entityInstance;
}

+ (void)deleteAllEntities:(NSString *)nameEntity
{
    NSManagedObjectContext* moc = [self getContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:nameEntity];
    [fetchRequest setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError *error;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *object in fetchedObjects)
    {
        [moc deleteObject:object];
    }
    
    error = nil;
    [moc save:&error];
}

+ (void) clearCoreData
{
    [self deleteAllEntities:@"Login"];
    [self deleteAllEntities:@"Authorization"];
    [self deleteAllEntities:@"GenProfile"];
}

+ (bool)saveLogin:(NSString*)email :(NSString*)password :(bool)flag
{
    [self deleteAllEntities:@"Login"];
    
    NSManagedObjectContext* moc = [self getContext];
    NSEntityDescription* entityInstance = (NSEntityDescription*)[NSEntityDescription insertNewObjectForEntityForName:@"Login" inManagedObjectContext:moc];
    
    [entityInstance setValue:email forKey:@"email"];
    [entityInstance setValue:password forKey:@"password"];
    [entityInstance setValue:[NSNumber numberWithBool:flag] forKey:@"sync_flag"];
    
    NSError *error;
    if (![moc save:&error]) {
        NSLog(@"Save Error - 1");
        return false;
    }
    return true;
}

+ (bool)saveAuthorization:(QKAccessTokenResponse*)accessTokenResponse :(QKSignUpResponse*)signUpResponse :(NSString*)email :(NSDictionary*)dic
{
    NSEntityDescription* entityInstance = nil;
     NSManagedObjectContext* moc = [self getContext];
    
    if(signUpResponse != nil) //call during signup - create a new auth rec
    {
        [self deleteAllEntities:@"Authorize"];
        entityInstance = (NSEntityDescription*)[NSEntityDescription insertNewObjectForEntityForName:@"Authorize" inManagedObjectContext:moc];
        [entityInstance setValue:signUpResponse.email forKey:@"emailid"];
        [entityInstance setValue:signUpResponse.client_id forKey:@"client_id"];
        [entityInstance setValue:signUpResponse.client_secret forKey:@"client_secret"];
        [entityInstance setValue:signUpResponse.grant_type forKey:@"grant_type"];
        [entityInstance setValue:signUpResponse.userid forKey:@"userid"];
        [entityInstance setValue:signUpResponse.username forKey:@"username"];
        
        if(dic)
            [entityInstance setValue:[dic valueForKey:@"password"] forKey:@"password"];
            
    }
    else //signup response is null - already signed up - fetch the auth record to update
    {
        entityInstance = [self fetchEntityFor:@"Authorize" :@"emailid" :email];
        if(entityInstance == nil)
            entityInstance = (NSEntityDescription*)[NSEntityDescription insertNewObjectForEntityForName:@"Authorize" inManagedObjectContext:moc];
    }

    if(accessTokenResponse)
    {
        [entityInstance setValue:accessTokenResponse.access_token forKey:@"access_token"];
        [entityInstance setValue:accessTokenResponse.refresh_token forKey:@"refresh_token"];
        [entityInstance setValue:accessTokenResponse.scope forKey:@"scope"];
        [entityInstance setValue:accessTokenResponse.token_type forKey:@"token_type"];
    }
    
    if(dic)
    {
        if([dic count] == 2)
        {
            [entityInstance setValue:[dic valueForKey:@"username"] forKey:@"emailid"];
            [entityInstance setValue:[dic valueForKey:@"password"] forKey:@"password"];
        }
        else
        {
            [entityInstance setValue:[dic valueForKey:@"client_id"] forKey:@"client_id"];
            [entityInstance setValue:[dic valueForKey:@"client_secret"] forKey:@"client_secret"];
            [entityInstance setValue:[dic valueForKey:@"userid"] forKey:@"userid"];
            [entityInstance setValue:[dic valueForKey:@"username"] forKey:@"username"];
            [entityInstance setValue:[dic valueForKey:@"username"] forKey:@"emailid"];
            [entityInstance setValue:[dic valueForKey:@"password"] forKey:@"password"];
            [entityInstance setValue:@"password" forKey:@"grant_type"];
        }
    }
    
    //Not setting sync_flag and password - VIJAYA
    
    NSError *error;
    if (![moc save:&error]) {
        NSLog(@"Save Error - 1");
        return false;
    }
    return true;
}

+ (NSString*)getAuthorizationString:(NSString*)email :(NSManagedObjectContext*)lmoc
{
    if(lmoc == nil)
    {
        lmoc = [self getContext];
    }
    NSEntityDescription* entityInstance = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Authorize"];
    /*
    if(![email isEqualToString:@""])
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"emailid==%@", email];
        [request setPredicate:predicate];
    }
    */
    
    NSArray *fetchedArray = [lmoc executeFetchRequest:request error:nil];
    if ([fetchedArray count] > 0) {
        entityInstance =  [fetchedArray objectAtIndex:0];
    }
    
    NSString *authorizeString = [NSString stringWithFormat: @"%@ %@", [entityInstance valueForKey:@"token_type"], [entityInstance valueForKey:@"access_token"]];
    NSLog(@"Authorize String : %@", authorizeString);

    return authorizeString;
}



@end
