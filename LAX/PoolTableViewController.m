//
//  PoolTableViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/18/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "PoolTableViewController.h"

@implementation PoolTableViewController

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   UIView *tempView = [super formattedTableHeaderView];
   UILabel *tempLabel = [super formattedTableHeaderLabel];
   
   switch (section) {
      case 0:
         tempLabel.text = @"Table 1 ($10/hr)";
         break;
      case 1:
         tempLabel.text = @"Table 2 ($10/hr)";
         break;
      case 2:
         tempLabel.text = @"Table 3 ($10/hr)";
         break;
      case 3:
         tempLabel.text = @"Table 4 ($10/hr)";
         break;
      default:
         tempLabel.text = @"ERROR LOADING NAME";
         break;
   }
   
   [tempView addSubview:tempLabel];
   
   return tempView;
}

@end
