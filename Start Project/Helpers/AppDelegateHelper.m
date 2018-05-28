//
//  AppDelegateHelper.m
//  StartProject
//
//  Created by Anthonin Cocagne on 16/05/2018.
//  Copyright © 2018 Anthonin Cocagne. All rights reserved.
//

#import "AppDelegateHelper.h"
#import "NSJSONSerialization+ANDYJSONFile.h"

@implementation AppDelegateHelper

+(void) newVersionCheckerWithForceUpdate:(BOOL)forceUpdate {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    NSString *url = API_GET_VERSION_CHECKER;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        DLog(@"JSON: %@", responseObject);
        
        if (responseObject[@"build_number"] && responseObject[@"version"]) {
            
            NSString *currentVersionServer = responseObject[@"version"];
            float currentBuildNumberServer = [responseObject[@"build_number"] floatValue];
            
            float currentBuildNumberLocal = [[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey] floatValue];
            
            if (currentBuildNumberServer > currentBuildNumberLocal) {
                NSString *message = forceUpdate ? [NSString stringWithFormat:@"Une nouvelle version (%@) de APP_NAME est disponible.\nVous devez installer la nouvelle version pour continuer.", currentVersionServer] : @"Une nouvelle version est disponible, voulez-vous mettre à jour maintenant ?";
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Mise à jour disponible" message:message preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *downloadNow = [UIAlertAction actionWithTitle:@"Télécharger" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    if (@available(iOS 10.0, *)) {
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL_DOWNLOAD_NEW_VERSION] options:@{} completionHandler:nil];
                    } else {
                        // Fallback on earlier versions
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL_DOWNLOAD_NEW_VERSION]];
                    }
                }];
                
                [alert addAction:downloadNow];
                
                //A implémenter si besoin, dans l'immédiat on repropose à chaque fois de download
                if (!forceUpdate) {
                    ALog(@"Attention, le !forceUpdate n'est pas encore implém ! (n'était pas nécessaire jusqu'à maintenant)");
                    UIAlertAction *later = [UIAlertAction actionWithTitle:@"Plus tard" style:UIAlertActionStyleDefault handler:nil];
                    UIAlertAction *never = [UIAlertAction actionWithTitle:@"Jamais" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                        //ici save que l'user ne veut pas update la version numéro "…"
                    }];
                    
                    [alert addAction:later];
                    [alert addAction:never];
                }
                
                [Utils showAlertControllerOverEverything:alert];
            } else {
                DLog(@"Current version is up to date");
            }
            
        } else { //error
            ALog(@"Error while getting persons : %@", responseObject[@"message"]);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        ALogWithInfos(@"Error: %@", error);
    }];
}

@end
