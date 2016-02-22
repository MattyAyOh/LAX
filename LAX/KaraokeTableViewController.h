//
//  KaraokeTableViewController.h
//  LAX
//
//  Created by Matthew Ao on 2/18/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "AvailabilityTableViewController.h"

@interface KaraokeTableViewController : AvailabilityTableViewController

@property (strong, nonatomic) IBOutlet UIView *roomOneView;
@property (strong, nonatomic) IBOutlet UILabel *roomOneLabel;
@property (strong, nonatomic) IBOutlet UIView *roomTwoView;
@property (strong, nonatomic) IBOutlet UILabel *roomTwoLabel;
@property (strong, nonatomic) IBOutlet UIView *roomThreeView;
@property (strong, nonatomic) IBOutlet UILabel *roomThreeLabel;
@property (strong, nonatomic) IBOutlet UIView *roomFourView;
@property (strong, nonatomic) IBOutlet UILabel *roomFourLabel;

@end
