//
//  XQ_DisModel.h
//  ListeningFM
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseModel.h"

@interface XQ_DisModel : XQ_BaseModel
/**标题*/
@property (nonatomic, copy) NSString *title;
/**封面图片*/
@property (nonatomic, copy) NSString *coverPath;
/**英文*/
@property (nonatomic, copy) NSString *contentType;
/**传值内容*/
@property (nonatomic, retain) NSMutableArray *arrayProperties;

@end
