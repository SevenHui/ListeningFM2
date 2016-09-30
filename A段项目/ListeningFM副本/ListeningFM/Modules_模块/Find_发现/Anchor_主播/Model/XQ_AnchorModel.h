//
//  XQ_AnchorModel.h
//  ListeningFM
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseModel.h"

@interface XQ_AnchorModel : XQ_BaseModel
/**id*/
@property (nonatomic, retain) NSNumber *ID;
/**title*/
@property (nonatomic, copy) NSString *title;
/**name*/
@property (nonatomic, copy) NSString *name;
/**list*/
@property (nonatomic, retain) NSMutableArray *listArray;

@end
