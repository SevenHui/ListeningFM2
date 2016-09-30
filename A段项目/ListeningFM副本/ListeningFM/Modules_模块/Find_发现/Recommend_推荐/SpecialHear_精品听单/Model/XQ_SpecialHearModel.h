//
//  XQ_SpecialHearModel.h
//  ListeningFM
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseModel.h"

@interface XQ_SpecialHearModel : XQ_BaseModel
/**specialId*/
@property (nonatomic, assign) NSInteger specialId;
/**标题*/
@property (nonatomic, copy) NSString *title;
/**副标题*/
@property (nonatomic, copy) NSString *subtitle;
/**声音数量*/
@property (nonatomic, copy) NSString *footnote;
/**封面图片*/
@property (nonatomic, copy) NSString *coverPath;
/**contentType*/
@property (nonatomic, copy) NSString *contentType;

@end
