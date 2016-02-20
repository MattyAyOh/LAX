//
//  LAXTabBarController.m
//  LAX
//
//  Created by Matthew Ao on 2/20/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "LAXTabBarController.h"

@interface LAXTabBarController ()

@end

@implementation LAXTabBarController

- (void)viewDidLoad
{
   [super viewDidLoad];
   [self.viewControllers enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL *stop) {
      vc.title = nil;
      vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
   }];
}

@end
