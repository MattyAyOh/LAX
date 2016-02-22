//
//  AvailabilityTableViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/17/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "AvailabilityTableViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation AvailabilityTableViewController

-(void)viewDidLoad
{
   [super viewDidLoad];
   [self.view setBackgroundColor:[UIColor laxRED]];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   return 38.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   UITableViewCell *tempCell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
   
   [tempCell.contentView.layer setBorderColor:[UIColor blackColor].CGColor];
   [tempCell.contentView.layer setBorderWidth:2.0f];
   
   return tempCell;
   
}

@end
