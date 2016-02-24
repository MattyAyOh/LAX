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
   
   UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tappedRightButton:)];
   [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
   [self.view addGestureRecognizer:swipeLeft];
   
   UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tappedLeftButton:)];
   [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
   [self.view addGestureRecognizer:swipeRight];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
   CGRect frame = CGRectInset(self.view.bounds, -10, -10);
   
   return CGRectContainsPoint(frame, point) ? self.view : nil;
}

- (IBAction)tappedRightButton:(id)sender
{
   NSUInteger selectedIndex = [self selectedIndex];
   
   if( selectedIndex < 3 )
   {
      [self setSelectedIndex:selectedIndex + 1];
      
      CATransition *anim= [CATransition animation];
      [anim setType:kCATransitionPush];
      [anim setSubtype:kCATransitionFromRight];
      [anim setDuration:0.3];
      [anim setTimingFunction:[CAMediaTimingFunction functionWithName:
                               kCAMediaTimingFunctionEaseIn]];
      [self.view.layer addAnimation:anim forKey:@"fadeTransition"];
   }
}

- (IBAction)tappedLeftButton:(id)sender
{
   NSUInteger selectedIndex = [self selectedIndex];
   
   if( selectedIndex > 0 )
   {
      [self setSelectedIndex:selectedIndex - 1];
      
      CATransition *anim= [CATransition animation];
      [anim setType:kCATransitionPush];
      [anim setSubtype:kCATransitionFromLeft];
      
      [anim setDuration:0.3];
      [anim setTimingFunction:[CAMediaTimingFunction functionWithName:
                               kCAMediaTimingFunctionEaseIn]];
      [self.view.layer addAnimation:anim forKey:@"fadeTransition"];
   }
}
@end
