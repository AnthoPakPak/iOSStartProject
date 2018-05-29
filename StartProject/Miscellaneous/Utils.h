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

+(id) getDictionaryOrArrayFromJsonFileWithName:(NSString*)fileName;

+(NSString*) trimString:(NSString*)stringToTrim;

+(NSDate*) getDateFromString:(NSString*)dateString;
+(NSString*) getStringFromDate:(NSDate*)date;

@end
