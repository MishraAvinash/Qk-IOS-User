//
//  GenProfile.h
//  QuicKonnect
//
//  Created by Vijaya Gujjari on 18/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface GenProfile : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

- (NSDictionary*)getDictionary;

@end

NS_ASSUME_NONNULL_END

#import "GenProfile+CoreDataProperties.h"
