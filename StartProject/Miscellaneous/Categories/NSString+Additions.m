//
//  NSString+Additions.m
//  StartProject
//
//  Created by Antho on 26/04/2018.
//  Copyright © 2018 Anthonin Cocagne. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

-(BOOL) isEmpty {
    return [self.trim isEqualToString:@""];
}

-(NSString *) trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
