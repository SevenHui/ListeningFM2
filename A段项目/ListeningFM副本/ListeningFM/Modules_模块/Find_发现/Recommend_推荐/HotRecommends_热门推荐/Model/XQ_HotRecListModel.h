//
//  XQ_HotRecListModel.h
//  ListeningFM
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseModel.h"

@interface XQ_HotRecListModel : XQ_BaseModel
/**id*/
@property (nonatomic, retain) NSNumber *ID;
/**albumId*/
@property (nonatomic, assign) NSInteger albumId;
/**uid*/
@property (nonatomic, assign) NSInteger uid;
/**封面图片*/
@property (nonatomic, copy) NSString *coverSmall;
/**简介*/
@property (nonatomic, copy) NSString *trackTitle;
/**标题*/
@property (nonatomic, copy) NSString *title;
/**intro*/
@property (nonatomic, copy) NSString *intro;
/**nickname*/
@property (nonatomic, copy) NSString *nickname;
/**tracks*/
@property (nonatomic, assign) NSInteger tracks;
/**playsCounts*/
@property (nonatomic, assign) NSInteger playsCounts;
/**trackId*/
@property (nonatomic, copy) NSString *trackId;
/**key*/
@property (nonatomic, copy) NSString *key;
/**contentType*/
@property (nonatomic, copy) NSString *contentType;

@end
