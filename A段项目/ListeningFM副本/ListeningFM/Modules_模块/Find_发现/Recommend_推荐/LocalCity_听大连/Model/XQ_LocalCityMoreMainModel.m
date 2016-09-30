//
//  XQ_LocalCityMoreMainModel.m
//  ListeningFM
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_LocalCityMoreMainModel.h"

@implementation XQ_LocalCityMoreMainModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}

@end
