//
//  GetLocalContacts.h
//  QuicKonnect
//
//  Created by Amit Naskar on 30/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetLocalContacts : NSObject

typedef void (^responseCallback)(NSError* error, NSMutableArray* response);

-(void)callGetContactsWithCallback:(responseCallback)callback;

@end
