//
//  QKNotificationsVC.h
//  QuicKonnect
//
//  Created by Amit Naskar on 30/06/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QKNotificationsVC : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *notificationsTable;
@property (strong, nonatomic) IBOutlet UIView *notificationsView;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentController;
- (IBAction)segmentBtn:(id)sender;

@end
