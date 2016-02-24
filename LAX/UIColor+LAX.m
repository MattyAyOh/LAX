//
//  UIColor+LAX.m
//  LAX
//
//  Created by Matthew Ao on 2/21/16.
//  Copyright © 2016 AYOH. All rights reserved.
//

#import "UIColor+LAX.h"

@implementation UIColor (LAX)

+(UIColor*)laxRED
{
   return [UIColor colorWithRed:(193.0/255.0) green:(11.0/255.0) blue:(33.0/255.0) alpha:1.0];
}

+(UIColor*)laxGREEN
{
   return [UIColor colorWithRed:(21.0/255.0) green:(198.0/255.0) blue:(98.0/255.0) alpha:1.0];
}

+(UIColor*)laxLightGRAY
{
   return [UIColor colorWithRed:(189.0/255.0) green:(189.0/255.0) blue:(189.0/255.0) alpha:1.0];
}

+(UIColor*)laxGRAY
{
   return [UIColor colorWithRed:(33.0/255.0) green:(33.0/255.0) blue:(33.0/255.0) alpha:1.0];
}

+(UIColor*)laxVeryLightTransparentGRAY
{
   return [UIColor colorWithRed:(33.0/255.0) green:(33.0/255.0) blue:(33.0/255.0) alpha:0.9];
}

+(UIColor*)laxLightTransparentGRAY
{
   return [UIColor colorWithRed:(33.0/255.0) green:(33.0/255.0) blue:(33.0/255.0) alpha:0.8];
}

+(UIColor*)laxSemiTransparentGRAY
{
   return [UIColor colorWithRed:(33.0/255.0) green:(33.0/255.0) blue:(33.0/255.0) alpha:0.5];
}

@end
