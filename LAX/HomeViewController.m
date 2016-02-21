//
//  HomeViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/13/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "HomeViewController.h"
#import "UIColor+LAX.h"

@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UILabel *laxHeader;
@property (strong, nonatomic) IBOutlet UIView *transparentRoundedView;
@property (strong, nonatomic) IBOutlet UIView *openView;
@property (strong, nonatomic) IBOutlet UILabel *hoursLabel;
@property (strong, nonatomic) IBOutlet UILabel *websiteLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;

@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property int characterIndex;

@end

@implementation HomeViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   self.view.backgroundColor = [UIColor colorWithRed:(193.0/255.0) green:(11.0/255.0) blue:(33.0/255.0) alpha:1.0];
   
   self.laxHeader.attributedText = [[NSAttributedString alloc] initWithString:self.laxHeader.text attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor whiteColor], NSStrokeWidthAttributeName : @-0.0 }];
   
   self.transparentRoundedView.layer.cornerRadius = 20.0;
   self.transparentRoundedView.backgroundColor = [UIColor colorWithRed:(33.0/255.0) green:(33.0/255.0) blue:(33.0/255.0) alpha:0.6];
   
   self.openView.layer.cornerRadius = 25.0;
   self.openView.backgroundColor = [UIColor colorWithRed:(33.0/255.0) green:(33.0/255.0) blue:(33.0/255.0) alpha:0.8];
   
   CGFloat borderWidth = 2.0f;
   
   self.openView.frame = CGRectInset(self.openView.frame, -borderWidth, -borderWidth);
   self.openView.layer.borderColor = [UIColor blackColor].CGColor;
   self.openView.layer.borderWidth = borderWidth;

   
   [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(flashStatus:) userInfo:nil repeats:YES];
}



-(void)flashStatus:(NSTimer*)timer
{
   self.characterIndex ++;

   NSMutableAttributedString *tempString = [self.statusLabel.attributedText mutableCopy];
   NSDictionary *redAttribute = @{NSForegroundColorAttributeName:[UIColor redColor]};
   NSDictionary *grayAttribute = @{NSForegroundColorAttributeName:[UIColor laxGRAY]};

   NSRange range = NSMakeRange(0, tempString.length);
   if( self.characterIndex==([tempString length]+5) )
   {
      [tempString setAttributes: grayAttribute range:range];
      self.characterIndex = 0;
   }
   if( self.characterIndex==([tempString length]+4) )
   {
      [tempString setAttributes: redAttribute range:range];
   }
   else if( self.characterIndex==([tempString length]+3) )
   {
      [tempString setAttributes: grayAttribute range:range];
   }
   else if( self.characterIndex==([tempString length]+2))
   {
      [tempString setAttributes: redAttribute range:range];
   }
   else if (self.characterIndex==([tempString length]+1))
   {
      [tempString setAttributes: grayAttribute range:range];
   }
   else
   {
      NSRange range = NSMakeRange(0, self.characterIndex);
      [tempString setAttributes: redAttribute range:range];
   }
   self.statusLabel.attributedText = tempString;
}

@end
