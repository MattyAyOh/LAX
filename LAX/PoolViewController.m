//
//  PoolViewController.m
//  LAX
//
//  Created by Matthew Ao on 2/13/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "PoolViewController.h"

@interface PoolViewController ()

@property IBOutlet UILabel *poolHeader;

@end

@implementation PoolViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   self.view.backgroundColor = [UIColor laxRED];
   
   self.poolHeader.shadowColor = [UIColor laxGRAY];
   self.poolHeader.shadowOffset = CGSizeMake(0,2);}

@end
