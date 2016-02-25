//
//  AvailabilityViewController.h
//  LAX
//
//  Created by Matthew Ao on 2/21/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@import CloudKit;

@interface AvailabilityViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *loadingView;
@property (strong, nonatomic) IBOutlet UILabel *loadingLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *progressSpinner;

- (void)updateRowWithRecord:(CKRecord*)record ForView:(UIView*)view andLabel:(UILabel*)label;
- (void)displayLoadingError;

@end
