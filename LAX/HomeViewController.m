//
//  HomeViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/13/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (strong, nonatomic) IBOutlet UILabel *laxHeader;

@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UIView *statusBackgroundView;
@property int characterIndex;
@property BOOL statusIsOpen;

@property (strong, nonatomic) IBOutlet UISegmentedControl *homeSegmentedControl;

@property (strong, nonatomic) IBOutlet UIView *homeBackgroundView;

@property (strong, nonatomic) IBOutlet UITextView *newsTextView;

@property (strong, nonatomic) IBOutlet UILabel *hoursLabel;
@property (strong, nonatomic) IBOutlet UITextView *addressTextView;
@property (strong, nonatomic) IBOutlet UITextView *phoneTextView;
@property (strong, nonatomic) IBOutlet UITextView *websiteTextView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   self.view.backgroundColor = [UIColor laxRED];
   
   self.statusBackgroundView.layer.cornerRadius = 25.0;
   self.statusBackgroundView.backgroundColor = [UIColor laxLightTransparentGRAY];
   
   CGFloat borderWidth = 2.0f;
   self.statusBackgroundView.frame = CGRectInset(self.statusBackgroundView.frame, -borderWidth, -borderWidth);
   self.statusBackgroundView.layer.borderColor = [UIColor blackColor].CGColor;
   self.statusBackgroundView.layer.borderWidth = borderWidth;
   
   self.homeBackgroundView.layer.cornerRadius = 20.0;
   self.homeBackgroundView.backgroundColor = [UIColor laxSemiTransparentGRAY];

   self.newsTextView.attributedText = [self.newsTextView.attributedText stringByAddingOutlineOfColor:[UIColor blackColor]];
   self.addressTextView.attributedText = [self.addressTextView.attributedText stringByAddingOutlineOfColor:[UIColor blueColor]];
   self.phoneTextView.attributedText = [self.phoneTextView.attributedText stringByAddingOutlineOfColor:[UIColor blueColor]];
   self.websiteTextView.attributedText = [self.websiteTextView.attributedText stringByAddingOutlineOfColor:[UIColor blueColor]];
   
   if( [[UIScreen mainScreen] bounds].size.height < 550 )
   {
      [self.addressTextView removeFromSuperview];
      [self.phoneTextView removeFromSuperview];
   }

   [self homeSegmentedControlChanged:nil];
   
   [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(flashStatus:) userInfo:nil repeats:YES];
}

- (IBAction)homeSegmentedControlChanged:(id)sender
{
   if( self.homeSegmentedControl.selectedSegmentIndex == 0 )
   {
      [self.newsTextView setHidden:NO];
      [self.hoursLabel setHidden:YES];
      [self.addressTextView setHidden:YES];
      [self.phoneTextView setHidden:YES];
      [self.websiteTextView setHidden:YES];
   }
   else
   {
      [self.newsTextView setHidden:YES];
      [self.hoursLabel setHidden:NO];
      [self.addressTextView setHidden:NO];
      [self.phoneTextView setHidden:NO];
      [self.websiteTextView setHidden:NO];
   }
}

-(void)viewDidAppear:(BOOL)animated
{
   NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitWeekday fromDate:[NSDate date]];
   NSInteger currentHour = [components hour];
   NSInteger weekDay = [components weekday];

   if( currentHour < 2 )
   {
      [self setStatusToOpen];
   }
   else if( currentHour >= 14 && (weekDay == 1 || weekDay == 7) )
   {
      [self setStatusToOpen];
   }
   else if( currentHour >= 18 && (weekDay == 2 || weekDay == 3 || weekDay == 4 || weekDay == 5 || weekDay == 6 ) )
   {
      [self setStatusToOpen];
   }
   else
   {
      [self setStatusToClosed];
   }
}

- (void)setStatusToOpen
{
   [self.statusLabel setText:@"OPEN NOW"];
   self.statusIsOpen = YES;
}

- (void)setStatusToClosed
{
   [self.statusLabel setText:@"CLOSED NOW"];
   self.statusIsOpen = NO;
}


- (void)flashStatus:(NSTimer*)timer
{
   self.characterIndex ++;

   NSMutableAttributedString *tempString = [self.statusLabel.attributedText mutableCopy];
   NSDictionary *activeAttribute = @{NSForegroundColorAttributeName:[UIColor redColor]};
   if( self.statusIsOpen )
   {
      activeAttribute = @{NSForegroundColorAttributeName:[UIColor greenColor]};
   }
   NSDictionary *grayAttribute = @{NSForegroundColorAttributeName:[UIColor laxGRAY]};

   NSRange range = NSMakeRange(0, tempString.length);
   if( self.characterIndex==([tempString length]+5) )
   {
      [tempString setAttributes: grayAttribute range:range];
      self.characterIndex = 0;
   }
   if( self.characterIndex==([tempString length]+4) )
   {
      [tempString setAttributes: activeAttribute range:range];
   }
   else if( self.characterIndex==([tempString length]+3) )
   {
      [tempString setAttributes: grayAttribute range:range];
   }
   else if( self.characterIndex==([tempString length]+2))
   {
      [tempString setAttributes: activeAttribute range:range];
   }
   else if (self.characterIndex==([tempString length]+1))
   {
      [tempString setAttributes: grayAttribute range:range];
   }
   else
   {
      NSRange range = NSMakeRange(0, self.characterIndex);
      [tempString setAttributes: activeAttribute range:range];
   }
   self.statusLabel.attributedText = tempString;
}

@end
