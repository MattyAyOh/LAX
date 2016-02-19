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
   self.view.backgroundColor = [UIColor colorWithRed:(193.0/255.0) green:(11.0/255.0) blue:(33.0/255.0) alpha:1.0];
   
   self.poolHeader.shadowColor = [UIColor colorWithRed:(33.0/255.0) green:(33.0/255.0) blue:(33.0/255.0) alpha:1.0];
   self.poolHeader.shadowOffset = CGSizeMake(0,2);}

@end
