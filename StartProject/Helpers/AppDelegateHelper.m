//
//  AppDelegateHelper.m
//  StartProject
//
//  Created by Anthonin Cocagne on 16/05/2018.
//  Copyright © 2018 Anthonin Cocagne. All rights reserved.
//


#import "AppDelegateHelper.h"
#import "AFNetworking.h"

@implementation AppDelegateHelper

static NSString* const kLastRefusedUpdateBuildNumber = @"lastRefusedUpdateBuildNumber";

+(void) newVersionChecker {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString *url = API_GET_VERSION_CHECKER;
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        if (responseObject[@"build_number"] && responseObject[@"version"]) {
            
            NSString *currentVersionServer = responseObject[@"version"];
            float currentBuildNumberServer = [responseObject[@"build_number"] floatValue];
            float lastBuildNumberForceUpdate = [responseObject[@"last_force_update_build_number"] floatValue];
            NSString *buildLocationUrl = responseObject[@"build_location"];
            
            float currentBuildNumberLocal = [[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey] floatValue];
            
            BOOL forceUpdate = currentBuildNumberLocal < lastBuildNumberForceUpdate; //if forceUpdate, we'll urge the user to install the update
            
            if (currentBuildNumberServer > currentBuildNumberLocal) {
                NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"] != nil ? [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"] : [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
                NSString *message = forceUpdate ? [NSString stringWithFormat:@"Une nouvelle version (%@) de %@ est disponible.\nVous devez installer la nouvelle version pour continuer.", currentVersionServer, appName] : @"Une nouvelle version est disponible, voulez-vous mettre à jour maintenant ?";
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Mise à jour disponible" message:message preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *downloadNow = [UIAlertAction actionWithTitle:@"Télécharger" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    if (@available(iOS 10.0, *)) {
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:buildLocationUrl] options:@{} completionHandler:nil];
                    } else {
                        // Fallback on earlier versions
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:buildLocationUrl]];
                    }
                }];
                
                [alert addAction:downloadNow];
                
                if (!forceUpdate) {
                    if (defaults_float(kLastRefusedUpdateBuildNumber) == currentBuildNumberServer) {
                        NSLog(@"New version available but user denied requests previously");
                        return;
                    }
                    
                    UIAlertAction *later = [UIAlertAction actionWithTitle:@"Plus tard" style:UIAlertActionStyleDefault handler:nil];
                    UIAlertAction *never = [UIAlertAction actionWithTitle:@"Jamais" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                        //ici save que l'user ne veut pas update la version numéro "…"
                        defaults_set_float(kLastRefusedUpdateBuildNumber, currentBuildNumberServer);
                    }];
                    
                    [alert addAction:later];
                    [alert addAction:never];
                }
                
                [Utils showAlertControllerOverEverything:alert];
            } else {
                NSLog(@"Current version is up to date");
            }
            
        } else { //error
            NSLog(@"Error while getting new version check : %@", responseObject[@"message"]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
