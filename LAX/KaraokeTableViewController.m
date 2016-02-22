//
//  KaraokeTableViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/18/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "KaraokeTableViewController.h"

@implementation KaraokeTableViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   
   self.roomOneLabel.attributedText = [[NSAttributedString alloc] initWithString:@"LOADING..." attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor whiteColor], NSStrokeWidthAttributeName : @-5.0 }];
   self.roomTwoLabel.attributedText = [[NSAttributedString alloc] initWithString:@"LOADING..." attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor whiteColor], NSStrokeWidthAttributeName : @-5.0 }];
   self.roomThreeLabel.attributedText = [[NSAttributedString alloc] initWithString:@"LOADING..." attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor whiteColor], NSStrokeWidthAttributeName : @-5.0 }];
   self.roomFourLabel.attributedText = [[NSAttributedString alloc] initWithString:@"LOADING..." attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor whiteColor], NSStrokeWidthAttributeName : @-5.0 }];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,200,300,244)];
   tempView.backgroundColor=[UIColor clearColor];
   
   UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(15,0,300,44)];
   tempLabel.backgroundColor=[UIColor clearColor];
   tempLabel.shadowColor = [UIColor laxGRAY];
   tempLabel.shadowOffset = CGSizeMake(0,2);
   tempLabel.textColor = [UIColor whiteColor];
   tempLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
   tempLabel.font = [UIFont boldSystemFontOfSize:20.0];
   switch (section) {
      case 0:
         tempLabel.text = @"ROOM 1 ($28/hr)";
         break;
      case 1:
         tempLabel.text = @"ROOM 2 ($28/hr)";
         break;
      case 2:
         tempLabel.text = @"ROOM 3 ($28/hr)";
         break;
      case 3:
         tempLabel.text = @"BIG ROOM ($42/hr)";
         break;
      default:
         tempLabel.text = @"ERROR LOADING NAME";
         break;
   }
   
   [tempView addSubview:tempLabel];
   
   return tempView;
}

@end
