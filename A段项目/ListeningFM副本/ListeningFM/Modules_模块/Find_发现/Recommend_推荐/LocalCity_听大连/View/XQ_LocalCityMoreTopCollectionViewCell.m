//
//  XQ_LocalCityMoreTopCollectionViewCell.m
//  ListeningFM
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_LocalCityMoreTopCollectionViewCell.h"
#import "XQ_LocalCityMoreTopModel.h"

@interface XQ_LocalCityMoreTopCollectionViewCell ()

/**<#注释#>*/
@property (nonatomic, retain) UILabel *labelName;

@end

@implementation XQ_LocalCityMoreTopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.labelName = [[UILabel alloc] init];
        _labelName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_labelName];
        
    }
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _labelName.frame = self.bounds;
    
    
}

- (void)setModel:(XQ_LocalCityMoreTopModel *)model {
    if (_model != model) {
        _model = model;
    }
    
    _labelName.text = model.name;
    
    
}


@end
