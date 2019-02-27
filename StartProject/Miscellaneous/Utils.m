//
//  Utils.m
//  StartProject
//
//  Created by Anthonin Cocagne on 15/03/2018.
//  Copyright © 2018 Anthonin Cocagne. All rights reserved.
//

#import "Utils.h"

@implementation Utils


+(UIViewController*) topMostController {
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}


#pragma mark - Alerts

+(void) showAlertWithTitle:(NSString*)title message:(NSString*)message buttonText:(NSString*)buttonText {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:buttonText style:UIAlertActionStyleDefault handler:nil]];
    [Utils showAlertControllerOverEverything:alertController];
}

+(void) showAlertWithTitle:(NSString*)title message:(NSString*)message buttonsText:(NSArray<NSString*>*)buttonsTextArray completionHandler:(void (^)(NSString *clickedButton))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    for (NSString *buttonText in buttonsTextArray) {
        [alertController addAction:[UIAlertAction actionWithTitle:buttonText style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (completionHandler) {
                completionHandler(action.title);
            }
        }]];
    }
    
    [Utils showAlertControllerOverEverything:alertController];
}

+(void) showAlertControllerOverEverything:(UIAlertController*)alertController {
    //to show OVER klcpopup
    dispatch_async(dispatch_get_main_queue(), ^{ //semble nécessaire de show ddans la main queue
        
        UIViewController *blankViewController = [[UIViewController alloc] init];
        [[blankViewController view] setBackgroundColor:[UIColor clearColor]];
        UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [window setRootViewController:blankViewController];
        [window setBackgroundColor:[UIColor clearColor]];
        [window setWindowLevel:UIWindowLevelAlert + 1];
        [window makeKeyAndVisible];
        
        [blankViewController presentViewController:alertController animated:YES completion:nil];
    });
}


#pragma mark - JSON

+(id) getDictionaryOrArrayFromJsonFileWithName:(NSString*)fileName {
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    id dicOrArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error) {
        DLog(@"JSON malformé !");
    }
    return dicOrArray;
}



#pragma mark - Strings

//prefer use NSString+Additions instead
+(NSString*) trimString:(NSString*)stringToTrim {
    return [stringToTrim stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


#pragma mark - Dates

+(NSDate*) getDateFromString:(NSString*)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    return [dateFormatter dateFromString:dateString];
}

+(NSString*) getStringFromDate:(NSDate*)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
}



#pragma mark - Numbers

+(int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}


@end
