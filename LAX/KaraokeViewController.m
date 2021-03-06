//
//  KaraokeViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/13/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "KaraokeViewController.h"
#import "KaraokeTableViewController.h"

@interface KaraokeViewController ()

@property IBOutlet UILabel *karaokeHeader;
@property KaraokeTableViewController *karaokeTable;

@end

@implementation KaraokeViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   self.karaokeHeader.shadowColor = [UIColor laxGRAY];
   self.karaokeHeader.shadowOffset = CGSizeMake(0,2);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   NSString * segueName = segue.identifier;
   if ([segueName isEqualToString: @"karaokeSegue"]) {
      self.karaokeTable = (KaraokeTableViewController*)[segue destinationViewController];
      self.karaokeTable.parentAvailabilityViewController = self;
   }
}

-(void)viewDidAppear:(BOOL)animated
{
   [self.progressSpinner setHidden:NO];
   [self.loadingLabel setText:@"LOADING..."];
   [self.loadingLabel setTextColor:[UIColor whiteColor]];
   [self.loadingView setHidden:NO];
   [self.karaokeTable setRowsToLoadingStatus];
   
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
                NSNumber *roomNumber = [record objectForKey:kRoomNumber];
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
                   [self updateRowWithRecord:record ForView:self.karaokeTable.roomFourView andLabel:self.karaokeTable.roomFourLabel];
                }
             }
             [self.loadingView setHidden:YES];
          });
       }
    }];
   
   [(AppDelegate*)[[UIApplication sharedApplication] delegate] incrementTrackerForKey:kTrackingKaraokePressed];
   [super viewDidAppear:animated];
}



@end
