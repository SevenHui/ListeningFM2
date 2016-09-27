//
//  XQ_TopCollectionViewCell.h
//  ListeningFM
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XQ_TopModel;

@interface XQ_TopCollectionViewCell : UICollectionViewCell
/**<#注释#>*/
@property (nonatomic, retain) XQ_TopModel *topModel;
/**<#注释#>*/
@property (nonatomic , assign) BOOL didSelected;

@end
