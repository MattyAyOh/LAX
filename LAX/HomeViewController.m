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
@property (strong, nonatomic) IBOutlet UIView *transparentRoundedView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   self.view.backgroundColor = [UIColor colorWithRed:(193.0/255.0) green:(11.0/255.0) blue:(33.0/255.0) alpha:1.0];
   
   self.laxHeader.attributedText = [[NSAttributedString alloc] initWithString:self.laxHeader.text attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor whiteColor], NSStrokeWidthAttributeName : @-1.0 }];
   
   self.transparentRoundedView.layer.cornerRadius = 20.0;
   self.transparentRoundedView.backgroundColor = [UIColor colorWithRed:(33.0/255.0) green:(33.0/255.0) blue:(33.0/255.0) alpha:0.7];
}

@end
