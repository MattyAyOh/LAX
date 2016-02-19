//
//  KaraokeViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/13/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "KaraokeViewController.h"

@interface KaraokeViewController ()

@property IBOutlet UILabel *karaokeHeader;
@end

@implementation KaraokeViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   self.view.backgroundColor = [UIColor colorWithRed:(193.0/255.0) green:(11.0/255.0) blue:(33.0/255.0) alpha:1.0];
   self.karaokeHeader.shadowColor = [UIColor colorWithRed:(33.0/255.0) green:(33.0/255.0) blue:(33.0/255.0) alpha:1.0];
   self.karaokeHeader.shadowOffset = CGSizeMake(0,2);
}

@end
