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
@property (nonatomic, retain) NSNumber *albumId;
/**uid*/
@property (nonatomic, retain) NSNumber *uid;
/**trackId*/
@property (nonatomic, retain) NSNumber *trackId;
/**intro*/
@property (nonatomic, copy) NSString *intro;
/**nickname*/
@property (nonatomic, copy) NSString *nickname;
/**coverSmall*/
@property (nonatomic, copy) NSString *coverSmall;
/**title*/
@property (nonatomic, copy) NSString *title;
/**trackTitle*/
@property (nonatomic, copy) NSString *trackTitle;
/**tracks*/
@property (nonatomic, assign) NSInteger tracks;
/**playsCounts*/
@property (nonatomic, assign) NSInteger playsCounts;

@end
