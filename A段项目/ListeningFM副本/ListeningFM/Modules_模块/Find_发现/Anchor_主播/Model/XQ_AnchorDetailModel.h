//
//  XQ_AnchorDetailModel.h
//  ListeningFM
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseModel.h"

@interface XQ_AnchorDetailModel : XQ_BaseModel
/**uid*/
@property (nonatomic, retain) NSNumber *uid;
/**nickname*/
@property (nonatomic, retain) NSString *nickname;
/**smallLogo*/
@property (nonatomic, retain) NSString *smallLogo;
/**tracksCounts*/
@property (nonatomic, assign) NSInteger tracksCounts;
/**followersCounts*/
@property (nonatomic, assign) NSInteger followersCounts;
/**personDescribe*/
@property (nonatomic, copy) NSString *personDescribe;
/**verifyTitle*/
@property (nonatomic, copy) NSString *verifyTitle;

@end
