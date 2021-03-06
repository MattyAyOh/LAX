//
//  NSAttributedString+LAX.m
//  LAX
//
//  Created by Matthew Ao on 2/21/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "NSAttributedString+LAX.h"

@implementation NSAttributedString (LAX)

- (NSAttributedString*)stringByAddingOutlineOfColor:(UIColor*)color thickness:(NSNumber*)thick
{
   NSMutableAttributedString *returnString = [self mutableCopy];
   [returnString addAttribute:NSStrokeColorAttributeName value:color range:NSMakeRange(0, self.length)];
   [returnString addAttribute:NSStrokeWidthAttributeName value:thick range:NSMakeRange(0, self.length)];
   return returnString;
}

@end
