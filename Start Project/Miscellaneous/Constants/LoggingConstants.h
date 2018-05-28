//
//  LoggingConstants.h
//  Start Project
//
//  Created by Anthonin Cocagne on 28/05/2018.
//  Copyright © 2018 Anthonin Cocagne. All rights reserved.
//

#ifndef LoggingConstants_h
#define LoggingConstants_h

#pragma mark - Loggings

// DLog will output like DLog only when the DEBUG variable is set

#ifdef DEBUG
//#   define DLog(fmt, ...) GGLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define DLog(fmt, ...) GGLog((fmt), ##__VA_ARGS__);
#else
#   define DLog(...)
#endif


// ULog will always  output like DLog

#define ULog(fmt, ...) GGLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

// ALog will show the UIAlertView only when the DEBUG variable is set

#ifdef DEBUG
#   define ALog(fmt, ...)  { UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alerte" message:[NSString stringWithFormat:fmt, ##__VA_ARGS__] preferredStyle:UIAlertControllerStyleAlert]; [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]]; [Utils showAlertControllerOverEverything:alertController]; DLog((fmt), ##__VA_ARGS__); }
#else
#   define ALog(...)
#endif


#ifdef DEBUG
#   define ALogWithInfos(fmt, ...)  { UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__] preferredStyle:UIAlertControllerStyleAlert]; [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]]; [[Utils topMostController] presentViewController:alertController animated:YES completion:nil]; DLog((fmt), ##__VA_ARGS__); }
#else
#   define ALogWithInfos(...)
#endif

#endif /* LoggingConstants_h */
