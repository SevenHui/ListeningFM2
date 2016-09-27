//
//  XQ_LocalCityModel.h
//  ListeningFM
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseModel.h"

@interface XQ_LocalCityModel : XQ_BaseModel
/**id*/
@property (nonatomic, retain) NSNumber *ID;
/**albumId*/
@property (nonatomic, assign) NSInteger albumId;
/**uid*/
@property (nonatomic, assign) NSInteger uid;
/**intro*/
@property (nonatomic, copy) NSString *intro;
/**nickname*/
@property (nonatomic, copy) NSString *nickname;
/**封面*/
@property (nonatomic, copy) NSString *coverSmall;
/**title*/
@property (nonatomic, copy) NSString *title;
/**tracks*/
@property (nonatomic, assign) NSInteger tracks;
/**playsCounts*/
@property (nonatomic, assign) NSInteger playsCounts;
/**trackId*/
@property (nonatomic, assign) NSInteger trackId;
/**trackTitle*/
@property (nonatomic, copy) NSString *trackTitle;

@end
