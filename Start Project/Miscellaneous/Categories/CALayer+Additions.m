//
//  CALayer+Additions.m
//  StartProject
//
//  Created by Anthonin Cocagne on 25/04/2018.
//  Copyright © 2018 Anthonin Cocagne. All rights reserved.
//

#import "CALayer+Additions.h"
#import <QuartzCore/QuartzCore.h>

@implementation CALayer (Additions)

- (void)setBorderColorFromUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}

- (void)setShadowColorFromUIColor:(UIColor *)shadowUIColor {
    self.shadowColor = shadowUIColor.CGColor;
}

@end
