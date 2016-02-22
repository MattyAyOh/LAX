//
//  MahjongTableViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/18/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "MahjongTableViewController.h"

@implementation MahjongTableViewController

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   UIView *tempView = [super formattedTableHeaderView];
   UILabel *tempLabel = [super formattedTableHeaderLabel];
   switch (section) {
      case 0:
         tempLabel.text = @"Room 1 ($20/hr)";
         break;
      case 1:
         tempLabel.text = @"Room 2 ($20/hr)";
         break;
      case 2:
         tempLabel.text = @"Room 3 ($20/hr)";
         break;
      case 3:
         tempLabel.text = @"Room 4 [川麻] ($20/hr)";
         break;
      case 4:
         tempLabel.text = @"Room 5 ($20/hr)";
         break;
      case 5:
         tempLabel.text = @"Room 6 ($20/hr)";
         break;
      case 6:
         tempLabel.text = @"Room 7 ($20/hr)";
         break;
      case 7:
         tempLabel.text = @"Room 8 [川麻] ($20/hr)";
         break;
      default:
         tempLabel.text = @"ERROR LOADING NAME";
         break;
   }
   
   [tempView addSubview:tempLabel];
   
   return tempView;
}

@end
