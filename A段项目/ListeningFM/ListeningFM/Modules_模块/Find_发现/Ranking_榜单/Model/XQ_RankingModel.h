//
//  XQ_RankingModel.h
//  ListeningFM
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseModel.h"

@interface XQ_RankingModel : XQ_BaseModel
/**rankingListId*/
@property (nonatomic, assign) NSInteger rankingListId;
/**封面图片*/
@property (nonatomic, copy) NSString *coverPath;
/**标题*/
@property (nonatomic, copy) NSString *title;
/**副标题*/
@property (nonatomic, copy) NSString *subtitle;
/**contentType*/
@property (nonatomic, copy) NSString *contentType;
/**rankingRule*/
@property (nonatomic, copy) NSString *rankingRule;
/**firstId*/
@property (nonatomic, assign) NSInteger firstId;
/**firstTitle*/
@property (nonatomic, copy) NSString *firstTitle;
/**calcPeriod*/
@property (nonatomic, copy) NSString *calcPeriod;
/**前三条*/
@property (nonatomic, retain) NSMutableArray *firstKResults;


@end
