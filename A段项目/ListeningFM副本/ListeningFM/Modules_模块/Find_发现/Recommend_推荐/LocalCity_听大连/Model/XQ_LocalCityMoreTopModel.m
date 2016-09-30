//
//  XQ_LocalCityMoreTopModel.m
//  ListeningFM
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_LocalCityMoreTopModel.h"

@implementation XQ_LocalCityMoreTopModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}

@end
