//
//  XQ_SmallEditorModel.h
//  ListeningFM
//
//  Created by apple on 16/9/22.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseModel.h"

@interface XQ_SmallEditorModel : XQ_BaseModel
/**id*/
@property (nonatomic, retain) NSNumber *ID;
/**albumId*/
@property (nonatomic, assign) NSInteger albumId;
/**uid*/
@property (nonatomic, assign) NSInteger uid;
/**简介*/
@property (nonatomic, copy) NSString *intro;
/**昵称*/
@property (nonatomic, copy) NSString *nickname;
/**封面图片*/
@property (nonatomic, copy) NSString *coverSmall;
/**标题*/
@property (nonatomic, copy) NSString *title;
/**类型*/
@property (nonatomic, copy) NSString *tags;
/**tracks*/
@property (nonatomic, assign) NSInteger tracks;
/**播放数量*/
@property (nonatomic, copy) NSString *playsCounts;
/**trackId*/
@property (nonatomic, assign) NSInteger trackId;
/**trackTitle*/
@property (nonatomic, copy) NSString *trackTitle;

@end
