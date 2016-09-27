//
//  XQ_HotRecModel.m
//  ListeningFM
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_HotRecModel.h"
#import "XQ_HotRecListModel.h"

@implementation XQ_HotRecModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"list"]) {
        self.arrayList = [NSMutableArray array];
        for (NSDictionary *dic in value) {
            XQ_HotRecListModel *model = [[XQ_HotRecListModel alloc] initWithDic:dic];
            [_arrayList addObject:model];
        }
    }

}

@end
