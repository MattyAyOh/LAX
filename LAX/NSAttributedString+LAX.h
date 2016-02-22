//
//  NSAttributedString+LAX.h
//  LAX
//
//  Created by Matthew Ao on 2/21/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (LAX)

- (NSAttributedString*)stringByAddingOutlineOfColor:(UIColor*)color thickness:(NSNumber*)thick;

@end
