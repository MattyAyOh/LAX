//
//  AppDelegate.h
//  LAX
//
//  Created by Matthew Ao on 2/3/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property NSString *aboutString;
@property NSString *newsString;

- (BOOL)checkIfOpen;
- (void)incrementTrackerForKey:(NSString*)key;
@end

