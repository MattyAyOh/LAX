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
   CKQuery *query = [[CKQuery alloc] initWithRecordType:@"BusinessMetaData" predicate:predicate];
   
   [publicDatabase performQuery:query
                   inZoneWithID:nil
              completionHandler:^(NSArray *results, NSError *error)
    {
       if( error ) {
          //LOAD ERROR LOADING IN VIEWS
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
}

@end
