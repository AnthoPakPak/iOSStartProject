//
//  Utils.h
//  StartProject
//
//  Created by Anthonin Cocagne on 15/03/2018.
//  Copyright © 2018 Anthonin Cocagne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+(UIViewController*) topMostController;
+(void) showAlertControllerOverEverything:(UIAlertController*)alertController;
+(void) showAlertWithTitle:(NSString*)title message:(NSString*)message buttonText:(NSString*)buttonText;

+(id) getDictionaryOrArrayFromJsonFileWithName:(NSString*)fileName;

+(NSString*) trimString:(NSString*)stringToTrim;

+(NSDate*) getDateFromString:(NSString*)dateString;
+(NSString*) getStringFromDate:(NSDate*)date;

+(int)getRandomNumberBetween:(int)from to:(int)to;

@end
