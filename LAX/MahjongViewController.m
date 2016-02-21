//
//  MahjongViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/13/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "MahjongViewController.h"

@interface MahjongViewController ()

@property IBOutlet UILabel *mahjongHeader;

@end

@implementation MahjongViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   self.view.backgroundColor = [UIColor laxRED];
   
   self.mahjongHeader.shadowColor = [UIColor laxGRAY];
   self.mahjongHeader.shadowOffset = CGSizeMake(0,2);
}

@end
