//
//  MahjongViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/13/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "MahjongViewController.h"
#import "MahjongTableViewController.h"

@interface MahjongViewController ()

@property IBOutlet UILabel *mahjongHeader;
@property MahjongTableViewController *mahjongTable;

@end

@implementation MahjongViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   self.mahjongHeader.shadowColor = [UIColor laxGRAY];
   self.mahjongHeader.shadowOffset = CGSizeMake(0,2);
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   NSString * segueName = segue.identifier;
   if ([segueName isEqualToString: @"mahjongSegue"]) {
      self.mahjongTable = (MahjongTableViewController*)[segue destinationViewController];
   }
}

-(void)viewDidAppear:(BOOL)animated
{
   [self.progressSpinner setHidden:NO];
   [self.loadingLabel setText:@"LOADING..."];
   [self.loadingLabel setTextColor:[UIColor whiteColor]];
   [self.loadingView setHidden:NO];
   [self.mahjongTable setRowsToLoadingStatus];
   CKDatabase *publicDatabase = [[CKContainer defaultContainer] publicCloudDatabase];
   
   NSPredicate *predicate = [NSPredicate predicateWithValue:YES];
   CKQuery *query = [[CKQuery alloc] initWithRecordType:@"Mahjong" predicate:predicate];
   
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
                   [self updateRowWithRecord:record ForView:self.mahjongTable.roomOneView andLabel:self.mahjongTable.roomOneLabel];
                }
                else if( [roomNumber isEqual: @2] )
                {
                   [self updateRowWithRecord:record ForView:self.mahjongTable.roomTwoView andLabel:self.mahjongTable.roomTwoLabel];
                }
                else if( [roomNumber isEqual: @3] )
                {
                   [self updateRowWithRecord:record ForView:self.mahjongTable.roomThreeView andLabel:self.mahjongTable.roomThreeLabel];
                }
                else if( [roomNumber isEqual: @4] )
                {
                   [self updateRowWithRecord:record ForView:self.mahjongTable.roomFourView andLabel:self.mahjongTable.roomFourLabel];
                }
                else if( [roomNumber isEqual: @5] )
                {
                   [self updateRowWithRecord:record ForView:self.mahjongTable.roomFiveView andLabel:self.mahjongTable.roomFiveLabel];
                }
                else if( [roomNumber isEqual: @6] )
                {
                   [self updateRowWithRecord:record ForView:self.mahjongTable.roomSixView andLabel:self.mahjongTable.roomSixLabel];
                }
                else if( [roomNumber isEqual: @7] )
                {
                   [self updateRowWithRecord:record ForView:self.mahjongTable.roomSevenView andLabel:self.mahjongTable.roomSevenLabel];
                }
                else if( [roomNumber isEqual: @8] )
                {
                   [self updateRowWithRecord:record ForView:self.mahjongTable.roomEightView andLabel:self.mahjongTable.roomEightLabel];
                }
             }
             [self.loadingView setHidden:YES];
          });
       }
    }];
}


@end
