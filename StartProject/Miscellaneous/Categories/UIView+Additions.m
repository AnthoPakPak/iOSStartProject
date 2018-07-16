//
//  UIView+Additions.m
//  StartProject
//
//  Created by Anthonin Cocagne on 09/05/2018.
//  Copyright © 2018 Anthonin Cocagne. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

// Can cause layout bugs if call before autolayout is finished. May be called in viewDidLayoutSubviews, or call [self layoutIfNeeded] just before
-(void)roundCornersOnTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius {
//    [self layoutIfNeeded]; // Without this, we can sometimes get wrong frame size

    if (tl || tr || bl || br) {
        UIRectCorner corner = 0;
        if (tl) {corner = corner | UIRectCornerTopLeft;}
        if (tr) {corner = corner | UIRectCornerTopRight;}
        if (bl) {corner = corner | UIRectCornerBottomLeft;}
        if (br) {corner = corner | UIRectCornerBottomRight;}
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
    }
}

@end
