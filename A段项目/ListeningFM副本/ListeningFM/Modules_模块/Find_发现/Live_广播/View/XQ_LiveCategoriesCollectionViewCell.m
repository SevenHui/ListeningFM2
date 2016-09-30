//
//  XQ_LiveCategoriesCollectionViewCell.m
//  ListeningFM
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_LiveCategoriesCollectionViewCell.h"
#import "XQ_LiveCategoriesModel.h"

@interface XQ_LiveCategoriesCollectionViewCell ()

/**电台名*/
@property (nonatomic, retain) UILabel *labelName;
/**<#注释#>*/
@property (nonatomic, retain) UIImageView *imageViewPhoto;

@end

@implementation XQ_LiveCategoriesCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.labelName = [[UILabel alloc] init];
        _labelName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_labelName];
        
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self addSubview:_imageViewPhoto];
        
    }
    return self;
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    _labelName.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00];
    _labelName.frame = self.bounds;
    
}

- (void)setCateModel:(XQ_LiveCategoriesModel *)cateModel {
    if (_cateModel != cateModel) {
        _cateModel = cateModel;
    }
    
    _labelName.text = cateModel.name;
    if (_labelName.text == nil) {
        _imageViewPhoto.image = [UIImage imageNamed:@"icon_radio_hide"];
    }
    
}

@end
