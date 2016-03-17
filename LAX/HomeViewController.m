//
//  HomeViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/13/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"

@interface HomeViewController ()

@property (strong, nonatomic) IBOutlet UILabel *laxHeader;

@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UIView *statusBackgroundView;
@property int characterIndex;
@property BOOL statusIsOpen;

@property (strong, nonatomic) IBOutlet UISegmentedControl *homeSegmentedControl;

@property (strong, nonatomic) IBOutlet UIView *homeBackgroundView;

@property (strong, nonatomic) IBOutlet UITextView *newsTextView;
@property (strong, nonatomic) IBOutlet UITextView *aboutTextView;

@property (strong, nonatomic) IBOutlet UILabel *hoursLabel;
@property (strong, nonatomic) IBOutlet UITextView *addressTextView;
@property (strong, nonatomic) IBOutlet UITextView *phoneTextView;
@property (strong, nonatomic) IBOutlet UITextView *websiteTextView;

@property NSTimer *signTimer;
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
   
   self.newsTextView.attributedText = [self.newsTextView.attributedText stringByAddingOutlineOfColor:[UIColor blackColor] thickness:@-3.0];
   self.addressTextView.attributedText = [self.addressTextView.attributedText stringByAddingOutlineOfColor:[UIColor blueColor] thickness:@-3.0];
   self.phoneTextView.attributedText = [self.phoneTextView.attributedText stringByAddingOutlineOfColor:[UIColor blueColor] thickness:@-3.0];
   self.websiteTextView.attributedText = [self.websiteTextView.attributedText stringByAddingOutlineOfColor:[UIColor blueColor] thickness:@-3.0];
   
   if( [[UIScreen mainScreen] bounds].size.height < 550 )
   {
      [self.addressTextView removeFromSuperview];
      [self.phoneTextView removeFromSuperview];
   }
   
   [self homeSegmentedControlChanged:nil];
   
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(beginSignTimer)
                                                name:UIApplicationDidBecomeActiveNotification
                                              object:nil];
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(endSignTimer)
                                                name:UIApplicationDidEnterBackgroundNotification
                                              object:nil];
}

-(void)dealloc
{
   [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)hideBusinessInfo:(BOOL)flag
{
   [self.hoursLabel setHidden:flag];
   [self.addressTextView setHidden:flag];
   [self.phoneTextView setHidden:flag];
   [self.websiteTextView setHidden:flag];
}

- (IBAction)homeSegmentedControlChanged:(id)sender
{
   if( self.homeSegmentedControl.selectedSegmentIndex == 0 )
   {
      NSDictionary *attributes = [self.newsTextView.attributedText attributesAtIndex:0 effectiveRange:NULL];
      NSString *newsString = [(AppDelegate*)[[UIApplication sharedApplication] delegate] newsString];
      if( newsString ) {
         self.newsTextView.attributedText = [[NSAttributedString alloc] initWithString:newsString attributes:attributes];
      }
      
      [self.aboutTextView setHidden:YES];
      [self.newsTextView setHidden:NO];
      [self hideBusinessInfo:YES];
      
      [(AppDelegate*)[[UIApplication sharedApplication] delegate] incrementTrackerForKey:kTrackingNewsPressed];
   }
   else if( self.homeSegmentedControl.selectedSegmentIndex == 1 )
   {
      [self.aboutTextView setHidden:YES];
      [self.newsTextView setHidden:YES];
      [self hideBusinessInfo:NO];
   }
   else
   {
      NSDictionary *attributes = [self.aboutTextView.attributedText attributesAtIndex:0 effectiveRange:NULL];
      NSString *aboutString = [(AppDelegate*)[[UIApplication sharedApplication] delegate] aboutString];
      if ( aboutString ) {
         self.aboutTextView.attributedText = [[NSAttributedString alloc] initWithString:aboutString attributes:attributes];
      }
      [self.aboutTextView setHidden:NO];
      [self.newsTextView setHidden:YES];
      [self hideBusinessInfo:YES];
      
      [(AppDelegate*)[[UIApplication sharedApplication] delegate] incrementTrackerForKey:kTrackingAboutPressed];
   }
}

- (void)beginSignTimer
{
   self.signTimer = [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(flashStatus:) userInfo:nil repeats:YES];
   
   if( [(AppDelegate*)[[UIApplication sharedApplication] delegate] checkIfOpen] ) {
      [self setStatusToOpen];
   }
   else {
      [self setStatusToClosed];
   }
}

- (void)endSignTimer
{
   [self.signTimer invalidate];
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
