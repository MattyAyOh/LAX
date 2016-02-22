//
//  KaraokeTableViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/18/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "KaraokeTableViewController.h"

@implementation KaraokeTableViewController

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   UIView *tempView = [super formattedTableHeaderView];
   UILabel *tempLabel = [super formattedTableHeaderLabel];
   
   switch (section) {
      case 0:
         tempLabel.text = @"Room 1 ($28/hr)";
         break;
      case 1:
         tempLabel.text = @"Room 2 ($28/hr)";
         break;
      case 2:
         tempLabel.text = @"Room 3 ($28/hr)";
         break;
      case 3:
         tempLabel.text = @"Big Room 4 ($42/hr)";
         break;
      default:
         tempLabel.text = @"ERROR LOADING NAME";
         break;
   }
   
   [tempView addSubview:tempLabel];
   
   return tempView;
}

@end
