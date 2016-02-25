//
//  AvailabilityTableViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/17/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "AvailabilityTableViewController.h"
#import "AvailabilityViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation AvailabilityTableViewController

-(void)viewDidLoad
{
   [super viewDidLoad];
   [self.view setBackgroundColor:[UIColor clearColor]];
   self.refreshControl = [[UIRefreshControl alloc] init];
   [self.refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
   [self.tableView addSubview:self.refreshControl];
}

- (void)refresh:(id)sender
{
   [self.parentAvailabilityViewController viewDidAppear:YES];
   [self.refreshControl endRefreshing];
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   return 38.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   UITableViewCell *tempCell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
   
   [tempCell.contentView.layer setBorderColor:[UIColor blackColor].CGColor];
   [tempCell.contentView.layer setBorderWidth:2.0f];
   
   return tempCell;
}

//Yeah... I know.
- (void)setRowsToLoadingStatus
{
   if( self.roomOneView ) {
      [self.roomOneView setBackgroundColor:[UIColor laxGRAY]];
      [self.roomOneLabel setText:@"Loading..."];
      [self.roomOneLabel setAttributedText:[self.roomOneLabel.attributedText stringByAddingOutlineOfColor:[UIColor blackColor] thickness:@-5.0]];
   }
   if( self.roomTwoView ) {
      [self.roomTwoView setBackgroundColor:[UIColor laxGRAY]];
      [self.roomTwoLabel setText:@"Loading..."];
      [self.roomTwoLabel setAttributedText:[self.roomTwoLabel.attributedText stringByAddingOutlineOfColor:[UIColor blackColor] thickness:@-5.0]];
   }
   if( self.roomThreeView ) {
      [self.roomThreeView setBackgroundColor:[UIColor laxGRAY]];
      [self.roomThreeLabel setText:@"Loading..."];
      [self.roomThreeLabel setAttributedText:[self.roomThreeLabel.attributedText stringByAddingOutlineOfColor:[UIColor blackColor] thickness:@-5.0]];
   }
   if( self.roomFourView ) {
      [self.roomFourView setBackgroundColor:[UIColor laxGRAY]];
      [self.roomFourLabel setText:@"Loading..."];
      [self.roomFourLabel setAttributedText:[self.roomFourLabel.attributedText stringByAddingOutlineOfColor:[UIColor blackColor] thickness:@-5.0]];
   }
   if( self.roomFiveView ) {
      [self.roomFiveView setBackgroundColor:[UIColor laxGRAY]];
      [self.roomFiveLabel setText:@"Loading..."];
      [self.roomFiveLabel setAttributedText:[self.roomFiveLabel.attributedText stringByAddingOutlineOfColor:[UIColor blackColor] thickness:@-5.0]];
   }
   if( self.roomSixView ) {
      [self.roomSixView setBackgroundColor:[UIColor laxGRAY]];
      [self.roomSixLabel setText:@"Loading..."];
      [self.roomSixLabel setAttributedText:[self.roomSixLabel.attributedText stringByAddingOutlineOfColor:[UIColor blackColor] thickness:@-5.0]];
   }
   if( self.roomSevenView ) {
      [self.roomSevenView setBackgroundColor:[UIColor laxGRAY]];
      [self.roomSevenLabel setText:@"Loading..."];
      [self.roomSevenLabel setAttributedText:[self.roomSevenLabel.attributedText stringByAddingOutlineOfColor:[UIColor blackColor] thickness:@-5.0]];
   }
   if( self.roomEightView ) {
      [self.roomEightView setBackgroundColor:[UIColor laxGRAY]];
      [self.roomEightLabel setText:@"Loading..."];
      [self.roomEightLabel setAttributedText:[self.roomEightLabel.attributedText stringByAddingOutlineOfColor:[UIColor blackColor] thickness:@-5.0]];
   }
}

@end
