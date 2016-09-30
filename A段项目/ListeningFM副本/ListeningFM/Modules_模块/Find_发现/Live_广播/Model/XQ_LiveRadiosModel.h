//
//  XQ_LiveRadiosModel.h
//  ListeningFM
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseModel.h"

@interface XQ_LiveRadiosModel : XQ_BaseModel
/**id*/
@property (nonatomic, retain) NSNumber *ID;
/**fmUid*/
@property (nonatomic, retain) NSNumber *fmUid;
/**programId*/
@property (nonatomic, retain) NSNumber *programId;
/**programScheduleId*/
@property (nonatomic, retain) NSNumber *programScheduleId;
/**电台标题*/
@property (nonatomic, copy) NSString *name;
/**封面图片*/
@property (nonatomic, copy) NSString *coverSmall;
/**正在直播*/
@property (nonatomic, copy) NSString *programName;
/**收听人数*/
@property (nonatomic, retain) NSNumber *playCount;
/**声音*/
@property (nonatomic, retain) NSString *ts24;


@end
