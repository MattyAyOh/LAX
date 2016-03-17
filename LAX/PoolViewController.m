//
//  PoolViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/13/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "PoolViewController.h"
#import "PoolTableViewController.h"

@interface PoolViewController ()

@property IBOutlet UILabel *poolHeader;
@property PoolTableViewController *poolTable;

@end

@implementation PoolViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   self.poolHeader.shadowColor = [UIColor laxGRAY];
   self.poolHeader.shadowOffset = CGSizeMake(0,2);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   NSString * segueName = segue.identifier;
   if ([segueName isEqualToString: @"poolSegue"]) {
      self.poolTable = (PoolTableViewController*)[segue destinationViewController];
      self.poolTable.parentAvailabilityViewController = self;
   }
}

-(void)viewDidAppear:(BOOL)animated
{
   [self.progressSpinner setHidden:NO];
   [self.loadingLabel setText:@"LOADING..."];
   [self.loadingLabel setTextColor:[UIColor whiteColor]];
   [self.loadingView setHidden:NO];
   [self.poolTable setRowsToLoadingStatus];
   
   CKDatabase *publicDatabase = [[CKContainer defaultContainer] publicCloudDatabase];
   
   NSPredicate *predicate = [NSPredicate predicateWithValue:YES];
   CKQuery *query = [[CKQuery alloc] initWithRecordType:@"Pool" predicate:predicate];
   
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
                   [self updateRowWithRecord:record ForView:self.poolTable.roomOneView andLabel:self.poolTable.roomOneLabel];
                }
                else if( [roomNumber isEqual: @2] )
                {
                   [self updateRowWithRecord:record ForView:self.poolTable.roomTwoView andLabel:self.poolTable.roomTwoLabel];
                }
                else if( [roomNumber isEqual: @3] )
                {
                   [self updateRowWithRecord:record ForView:self.poolTable.roomThreeView andLabel:self.poolTable.roomThreeLabel];
                }
                else if( [roomNumber isEqual: @4] )
                {
                   [self updateRowWithRecord:record ForView:self.poolTable.roomFourView andLabel:self.poolTable.roomFourLabel];
                }
             }
             [self.loadingView setHidden:YES];
          });
       }
    }];
   
   [(AppDelegate*)[[UIApplication sharedApplication] delegate] incrementTrackerForKey:kTrackingPoolPressed];
   [super viewDidAppear:animated];
}

@end
