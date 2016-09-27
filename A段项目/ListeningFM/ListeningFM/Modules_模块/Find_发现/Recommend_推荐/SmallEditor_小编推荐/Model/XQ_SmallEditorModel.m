//
//  XQ_SmallEditorModel.m
//  ListeningFM
//
//  Created by apple on 16/9/22.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_SmallEditorModel.h"

@implementation XQ_SmallEditorModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}

@end
