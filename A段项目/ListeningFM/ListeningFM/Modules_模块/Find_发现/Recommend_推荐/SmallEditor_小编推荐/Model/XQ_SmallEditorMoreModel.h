//
//  XQ_SmallEditorMoreModel.h
//  ListeningFM
//
//  Created by apple on 16/9/24.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseModel.h"

@interface XQ_SmallEditorMoreModel : XQ_BaseModel
/**id*/
@property (nonatomic, retain) NSNumber *ID;
/**albumId*/
@property (nonatomic, assign) NSInteger albumId;
/**uid*/
@property (nonatomic, assign) NSInteger uid;
/**trackId*/
@property (nonatomic, assign) NSInteger trackId;
/**intro*/
@property (nonatomic, copy) NSString *intro;
/**nickname*/
@property (nonatomic, copy) NSString *nickname;
/**coverSmall*/
@property (nonatomic, copy) NSString *coverSmall;
/**title*/
@property (nonatomic, copy) NSString *title;
/**tags*/
@property (nonatomic, copy) NSString *tags;
/**trackTitle*/
@property (nonatomic, copy) NSString *trackTitle;
/**tracks*/
@property (nonatomic, copy) NSString *tracks;
/**playsCounts*/
@property (nonatomic, copy) NSString *playsCounts;

@end
