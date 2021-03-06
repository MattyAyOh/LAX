//
//  AvailabilityTableViewController.h
//  LAX
//
//  Created by Matthew Ao on 2/17/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AvailabilityViewController;
@interface AvailabilityTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UIView *roomOneView;
@property (strong, nonatomic) IBOutlet UILabel *roomOneLabel;
@property (strong, nonatomic) IBOutlet UIView *roomTwoView;
@property (strong, nonatomic) IBOutlet UILabel *roomTwoLabel;
@property (strong, nonatomic) IBOutlet UIView *roomThreeView;
@property (strong, nonatomic) IBOutlet UILabel *roomThreeLabel;
@property (strong, nonatomic) IBOutlet UIView *roomFourView;
@property (strong, nonatomic) IBOutlet UILabel *roomFourLabel;
@property (strong, nonatomic) IBOutlet UIView *roomFiveView;
@property (strong, nonatomic) IBOutlet UILabel *roomFiveLabel;
@property (strong, nonatomic) IBOutlet UIView *roomSixView;
@property (strong, nonatomic) IBOutlet UILabel *roomSixLabel;
@property (strong, nonatomic) IBOutlet UIView *roomSevenView;
@property (strong, nonatomic) IBOutlet UILabel *roomSevenLabel;
@property (strong, nonatomic) IBOutlet UIView *roomEightView;
@property (strong, nonatomic) IBOutlet UILabel *roomEightLabel;

@property (weak) AvailabilityViewController *parentAvailabilityViewController;

- (UIView*)formattedTableHeaderView;
- (UILabel*)formattedTableHeaderLabel;

- (void)setRowsToLoadingStatus;
@end
