//
//  XQ_CategoryModel.h
//  ListeningFM
//
//  Created by apple on 16/9/24.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseModel.h"

@interface XQ_CategoryModel : XQ_BaseModel
/**id*/
@property (nonatomic, retain) NSNumber *ID;
/**name*/
@property (nonatomic, copy) NSString *name;
/**title*/
@property (nonatomic, copy) NSString *title;
/**orderNum*/
@property (nonatomic, assign) NSInteger orderNum;
/**coverPath*/
@property (nonatomic, copy) NSString *coverPath;

@end
