//
//  AppDelegate.m
//  LAX
//
//  Created by Matthew Ao on 2/3/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "AppDelegate.h"
@import CloudKit;

@implementation AppDelegate

- (void)applicationDidBecomeActive:(UIApplication *)application {
   CKDatabase *publicDatabase = [[CKContainer defaultContainer] publicCloudDatabase];
   
   NSPredicate *predicate = [NSPredicate predicateWithValue:YES];
   CKQuery *query = [[CKQuery alloc] initWithRecordType:kTableBusinessMetaData predicate:predicate];
   
   [publicDatabase performQuery:query
                   inZoneWithID:nil
              completionHandler:^(NSArray *results, NSError *error)
    {
       if( error ) {
          self.aboutString = @"LAX is now under new management :)\n\nFree Wi-Fi, free chillin'\n\nRent private rooms for Mahjong and Karaoke\n\nWe have new 9' Pool Tables\n\nWe sell Imported snacks and drinks\n\nWe also host private events, rates given upon request";
       }
       else
       {
          dispatch_async(dispatch_get_main_queue(), ^{
             for( CKRecord *record in results )
             {
                //                NSString *hoursString = [record objectForKey:kOpenHours];
                //                NSArray *firstHoursSplitArray = [hoursString componentsSeparatedByString:@";"];
                //                NSArray *sixToTwoArray = [firstHoursSplitArray[0] componentsSeparatedByString:@":"];
                //                NSArray *twoToTwoArray = [firstHoursSplitArray[1] componentsSeparatedByString:@":"];
                
                NSString *aboutString = [record objectForKey:kAbout];
                NSString *finalAboutString = [aboutString stringByReplacingOccurrencesOfString:@";;" withString:@"\n\n"];
                self.aboutString = finalAboutString;
                
                NSString *newsString = [record objectForKey:kNews];
                NSString *finalNewsString = [newsString stringByReplacingOccurrencesOfString:@";;" withString:@"\n- "];
                self.newsString = finalNewsString;
             }
          });
       }
    }];
   
   if( [self checkIfOpen] ) {
      [self incrementTrackerForKey:kTrackingLaunchOpen];
   }
   else {
      [self incrementTrackerForKey:kTrackingLaunchClosed];
   }
}

- (BOOL)checkIfOpen
{
   NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitWeekday fromDate:[NSDate date]];
   NSInteger currentHour = [components hour];
   NSInteger weekDay = [components weekday];
   
   if( currentHour < 2 )
   {
      return YES;
   }
   else if( currentHour >= 14 && (weekDay == 1 || weekDay == 7) )
   {
      return YES;
   }
   else if( currentHour >= 18 && (weekDay == 2 || weekDay == 3 || weekDay == 4 || weekDay == 5 || weekDay == 6 ) )
   {
      return YES;
   }
   else
   {
      return NO;
   }
}

- (void)incrementTrackerForKey:(NSString*)key;
{
   CKDatabase *publicDatabase = [[CKContainer defaultContainer] publicCloudDatabase];
   
   NSPredicate *predicate = [NSPredicate predicateWithValue:YES];
   CKQuery *trackingQuery = [[CKQuery alloc] initWithRecordType:kTableTracking predicate:predicate];
   [publicDatabase performQuery:trackingQuery
                   inZoneWithID:nil
              completionHandler:^(NSArray *results, NSError *error)
    {
       if( !error )
       {
          for( CKRecord *record in results )
          {
             NSNumber *incrementedCount = [NSNumber numberWithInt:[[record objectForKey:key] intValue] + 1];
             [record setObject:incrementedCount forKey:key];
             CKModifyRecordsOperation *incrementLoad = [[CKModifyRecordsOperation alloc] initWithRecordsToSave:@[record] recordIDsToDelete:nil];
             [publicDatabase addOperation:incrementLoad];
          }
       }
    }];
}

@end
