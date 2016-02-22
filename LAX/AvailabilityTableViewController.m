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

- (UIView*)formattedTableHeaderView
{
   UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,200,300,244)];
   tempView.backgroundColor=[UIColor clearColor];
   
   return tempView;
}

- (UILabel*)formattedTableHeaderLabel
{
   UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(15,0,300,44)];
   tempLabel.backgroundColor=[UIColor clearColor];
   tempLabel.shadowColor = [UIColor laxGRAY];
   tempLabel.shadowOffset = CGSizeMake(0,2);
   tempLabel.textColor = [UIColor whiteColor];
   tempLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
   tempLabel.font = [UIFont boldSystemFontOfSize:20.0];
   
   return tempLabel;
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
