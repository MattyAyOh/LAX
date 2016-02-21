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
   self.view.backgroundColor = [UIColor laxRED];
   self.karaokeHeader.shadowColor = [UIColor laxGRAY];
   self.karaokeHeader.shadowOffset = CGSizeMake(0,2);
}

@end
