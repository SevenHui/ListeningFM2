//
//  XQ_HotRecListModel.m
//  ListeningFM
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_HotRecListModel.h"

@implementation XQ_HotRecListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"properties"]) {
        self.albumId = [[value objectForKey:@"albumId"] integerValue];
        self.key = [value objectForKey:@"key"];
        self.contentType = [value objectForKey:@"contentType"];
    }
    if ([key isEqualToString:@"id"]) {
        self.albumId = [value integerValue];
    }
    
    
}

@end
