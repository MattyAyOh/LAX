//
//  AvailabilityViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/21/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "AvailabilityViewController.h"

@implementation AvailabilityViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   self.view.backgroundColor = [UIColor laxRED];
   [self.loadingView setBackgroundColor:[UIColor laxVeryLightTransparentGRAY]];
}

- (void)updateRowWithRecord:(CKRecord*)record ForView:(UIView*)view andLabel:(UILabel*)label
{
   int hourTaken = [(NSNumber*)[record objectForKey:kHour] intValue];
   
   if( hourTaken == 66 )
   {
      [view setBackgroundColor:[UIColor laxGRAY]];
      [label setText:@"Currently Unavailable :("];
      [label setAttributedText:[label.attributedText stringByAddingOutlineOfColor:[UIColor blackColor] thickness:@-5.0]];
   }
   else if( hourTaken > 24 )
   {
      [view setBackgroundColor:[UIColor laxGREEN]];
      [label setText:@"Available"];
      [label setAttributedText:[label.attributedText stringByAddingOutlineOfColor:[UIColor blackColor] thickness:@-5.0]];
   }
   else
   {
      [view setBackgroundColor:[UIColor laxGRAY]];
      int minuteTaken = [(NSNumber*)[record objectForKey:kMinute] intValue];
      minuteTaken = (minuteTaken > 60) ? 0 : minuteTaken;
      
      NSString *ampmString = (hourTaken > 11) ? @"PM" : @"AM";
      hourTaken = hourTaken % 12;
      if( hourTaken == 0 ) hourTaken = 12;
      
      NSString *timeString = [NSString stringWithFormat:@"OCCUPIED SINCE: %d:%02d%@", hourTaken, minuteTaken, ampmString];
      [label setText:timeString];
      NSMutableAttributedString *tempString = [label.attributedText mutableCopy];
      [tempString setAttributes:@{NSForegroundColorAttributeName:[UIColor laxLightGRAY]} range:NSMakeRange(0, 15)];
      [label setAttributedText:[tempString stringByAddingOutlineOfColor:[UIColor blackColor] thickness:@-5.0]];
   }
}

- (void)displayLoadingError
{
   dispatch_async(dispatch_get_main_queue(), ^{
      [self.progressSpinner setHidden:YES];
      [self.loadingLabel setText:@"LOAD FAILED :("];
      [self.loadingLabel setTextColor:[UIColor laxRED]];
   });
}

@end
