//
//  AFHTTPSessionManager+ApiClient.m
//  JiaKaoBaoDian
//
//  Created by ligulfzhou on 2/2/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

#import "AFHTTPSessionManager+ApiClient.h"

@implementation AFHTTPSessionManager (ApiClient)


+(instancetype)ApiClient
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager.requestSerializer setValue:[self generateUserAgent] forHTTPHeaderField:@"User-Agent"];
    
    return manager;
 
}

+ (NSString *)generateUserAgent
{
    NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
    NSString *IDFV = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    return [NSString stringWithFormat:@"**********/git_%@/%@/%@/%@/%@",
            appVersion,
            [UIDevice currentDevice].systemName,
            [UIDevice currentDevice].systemVersion,
            [UIDevice currentDevice].model,
            IDFV];
}

@end
