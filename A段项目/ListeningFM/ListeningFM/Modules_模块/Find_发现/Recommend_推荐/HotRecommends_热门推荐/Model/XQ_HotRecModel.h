//
//  XQ_HotRecModel.h
//  ListeningFM
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseModel.h"

@interface XQ_HotRecModel : XQ_BaseModel
/**标题*/
@property (nonatomic, copy) NSString *title;
/**contentType*/
@property (nonatomic, copy) NSString *contentType;
/**内容数组*/
@property (nonatomic, retain) NSMutableArray *arrayList;

@end
