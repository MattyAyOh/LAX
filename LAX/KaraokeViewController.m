//
//  KaraokeViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/13/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "KaraokeViewController.h"
#import "KaraokeTableViewController.h"
@import CloudKit;

@interface KaraokeViewController ()

@property (strong, nonatomic) IBOutlet UIView *loadingView;
@property (strong, nonatomic) IBOutlet UILabel *loadingLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *progressSpinner;

@property IBOutlet UILabel *karaokeHeader;
@property KaraokeTableViewController *karaokeTable;

@end

@implementation KaraokeViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   [self.loadingView setBackgroundColor:[UIColor laxVeryLightTransparentGRAY]];
   self.view.backgroundColor = [UIColor laxRED];
   self.karaokeHeader.shadowColor = [UIColor laxGRAY];
   self.karaokeHeader.shadowOffset = CGSizeMake(0,2);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   NSString * segueName = segue.identifier;
   if ([segueName isEqualToString: @"karaokeSegue"]) {
      self.karaokeTable = (KaraokeTableViewController*)[segue destinationViewController];
   }
}

-(void)viewDidAppear:(BOOL)animated
{
   [self.progressSpinner setHidden:NO];
   [self.loadingLabel setText:@"LOADING..."];
   [self.loadingLabel setTextColor:[UIColor whiteColor]];
   [self.loadingView setHidden:NO];
   CKDatabase *publicDatabase = [[CKContainer defaultContainer] publicCloudDatabase];
   
   NSPredicate *predicate = [NSPredicate predicateWithValue:YES];
   CKQuery *query = [[CKQuery alloc] initWithRecordType:@"Karaoke" predicate:predicate];
   
   [publicDatabase performQuery:query
                   inZoneWithID:nil
              completionHandler:^(NSArray *results, NSError *error)
    {
       if (error) {
          [self displayLoadingError];
       }
       else {
          dispatch_async(dispatch_get_main_queue(), ^{
             for( CKRecord *record in results )
             {
                NSNumber *roomNumber = [record objectForKey:@"RoomNumber"];
                if( [roomNumber isEqual: @1] )
                {
                   [self updateRowWithRecord:record ForView:self.karaokeTable.roomOneView andLabel:self.karaokeTable.roomOneLabel];
                }
                else if( [roomNumber isEqual: @2] )
                {
                   [self updateRowWithRecord:record ForView:self.karaokeTable.roomTwoView andLabel:self.karaokeTable.roomTwoLabel];
                }
                else if( [roomNumber isEqual: @3] )
                {
                   [self updateRowWithRecord:record ForView:self.karaokeTable.roomThreeView andLabel:self.karaokeTable.roomThreeLabel];
                }
                else if( [roomNumber isEqual: @4] )
                {
                   [self updateRowWithRecord:record ForView:self.karaokeTable.roomFourLabel andLabel:self.karaokeTable.roomFourLabel];
                }
             }
             [self.loadingView setHidden:YES];
          });
       }
    }];
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
