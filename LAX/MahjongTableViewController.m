//
//  MahjongTableViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/18/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "MahjongTableViewController.h"

@interface MahjongTableViewController ()

@property (strong, nonatomic) IBOutlet UIView *roomOneView;
@property (strong, nonatomic) IBOutlet UILabel *roomOneLabel;
@property (strong, nonatomic) IBOutlet UIView *roomTwoView;
@property (strong, nonatomic) IBOutlet UILabel *roomTwoLabel;
@property (strong, nonatomic) IBOutlet UIView *roomThreeView;
@property (strong, nonatomic) IBOutlet UILabel *roomThreeLabel;
@property (strong, nonatomic) IBOutlet UIView *roomFourView;
@property (strong, nonatomic) IBOutlet UILabel *roomFourLabel;
@property (strong, nonatomic) IBOutlet UIView *roomFiveView;
@property (strong, nonatomic) IBOutlet UILabel *roomFiveLabel;
@property (strong, nonatomic) IBOutlet UIView *roomSixView;
@property (strong, nonatomic) IBOutlet UILabel *roomSixLabel;

@end

@implementation MahjongTableViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   
   [self.view setBackgroundColor:[UIColor colorWithRed:(193.0/255.0) green:(11.0/255.0) blue:(33.0/255.0) alpha:1.0]];
   [[self roomThreeView] setBackgroundColor:[UIColor redColor]];
   self.roomThreeLabel.attributedText = [[NSAttributedString alloc] initWithString:@"OCCUPIED SINCE: 6:00PM" attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor blackColor], NSStrokeWidthAttributeName : @-5.0 }];
   self.roomTwoLabel.attributedText = [[NSAttributedString alloc] initWithString:@"AVAILABLE" attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor whiteColor], NSStrokeWidthAttributeName : @-5.0 }];
   self.roomOneLabel.attributedText = [[NSAttributedString alloc] initWithString:@"AVAILABLE" attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor whiteColor], NSStrokeWidthAttributeName : @-5.0 }];
   self.roomFourLabel.attributedText = [[NSAttributedString alloc] initWithString:@"AVAILABLE" attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor whiteColor], NSStrokeWidthAttributeName : @-5.0 }];
   self.roomFiveLabel.attributedText = [[NSAttributedString alloc] initWithString:@"AVAILABLE" attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor whiteColor], NSStrokeWidthAttributeName : @-5.0 }];
   self.roomSixLabel.attributedText = [[NSAttributedString alloc] initWithString:@"AVAILABLE" attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor whiteColor], NSStrokeWidthAttributeName : @-5.0 }];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,200,300,244)];
   tempView.backgroundColor=[UIColor clearColor];
   
   UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(15,0,300,44)];
   tempLabel.backgroundColor=[UIColor clearColor];
   tempLabel.shadowColor = [UIColor colorWithRed:(33.0/255.0) green:(33.0/255.0) blue:(33.0/255.0) alpha:1.0];
   tempLabel.shadowOffset = CGSizeMake(0,2);
   tempLabel.textColor = [UIColor whiteColor]; //here you can change the text color of header.
   tempLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
   tempLabel.font = [UIFont boldSystemFontOfSize:20.0];
   switch (section) {
      case 0:
         tempLabel.text = @"ROOM 1";
         break;
      case 1:
         tempLabel.text = @"ROOM 2 [SICHUAN]";
         break;
      case 2:
         tempLabel.text = @"ROOM 3";
         break;
      case 3:
         tempLabel.text = @"ROOM 4 [SICHUAN]";
         break;
      case 4:
         tempLabel.text = @"ROOM 5";
         break;
      case 5:
         tempLabel.text = @"ROOM 6";
         break;
      default:
         tempLabel.text = @"ERROR LOADING NAME";
         break;
   }
   
   [tempView addSubview:tempLabel];
   
   return tempView;
}

@end
