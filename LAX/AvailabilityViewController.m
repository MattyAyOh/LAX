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
   int hourTaken = [(NSNumber*)[record objectForKey:@"HourTaken"] intValue];
   if( hourTaken > 24 )
   {
      [view setBackgroundColor:[UIColor laxGREEN]];
      [label setAttributedText:[[NSAttributedString alloc] initWithString:@"AVAILABLE" attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor blackColor], NSStrokeWidthAttributeName : @-5.0 }]];
   }
   else
   {
      [view setBackgroundColor:[UIColor laxGRAY]];
      int minuteTaken = [(NSNumber*)[record objectForKey:@"MinuteTaken"] intValue];
      minuteTaken = (minuteTaken > 60) ? 0 : minuteTaken;
      
      NSString *ampmString = (hourTaken > 11) ? @"PM" : @"AM";
      hourTaken = hourTaken % 12;
      if( hourTaken == 0 ) hourTaken = 12;
      
      NSString *timeString = [NSString stringWithFormat:@"OCCUPIED SINCE: %d:%02d%@", hourTaken, minuteTaken, ampmString];
      [label setAttributedText:[[NSAttributedString alloc] initWithString:timeString attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor whiteColor], NSStrokeWidthAttributeName : @-5.0 }]];
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
