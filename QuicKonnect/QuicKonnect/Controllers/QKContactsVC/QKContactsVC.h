//
//  QKContactsVC.h
//  QuicKonnect
//
//  Created by Amit Naskar on 30/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>

@interface QKContactsVC : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

{
    IBOutlet UITableView *myTableView;
    IBOutlet UISearchBar *mySearchBar;
    NSMutableArray *filteredArray;
    NSMutableArray *totalArray;
    BOOL isFilled;
    
}

@end
