//
//  XQ_DisCollectionViewCell.m
//  ListeningFM
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_DisCollectionViewCell.h"
#import "XQ_DisModel.h"

@interface XQ_DisCollectionViewCell ()

/**封面图片*/
@property (nonatomic, retain) UIImageView *imageViewPhoto;
/**标题*/
@property (nonatomic, retain) UILabel *labelTitle;

@end

@implementation XQ_DisCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self addSubview:_imageViewPhoto];
        
        self.labelTitle = [[UILabel alloc] init];
        _labelTitle.textAlignment = 1;
        [self addSubview:_labelTitle];
        
    }
    return self;
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
//    _imageViewPhoto.backgroundColor = [UIColor redColor];
    _imageViewPhoto.frame = CGRectMake(WIDTH * 0.12, HEIGHT * 0.05, WIDTH - WIDTH * 0.24, HEIGHT * 0.6);
    
//    _labelTitle.backgroundColor = [UIColor yellowColor];
    _labelTitle.frame = CGRectMake(0, HEIGHT * 0.7, WIDTH, HEIGHT * 0.3);

    
}
- (void)setDisModel:(XQ_DisModel *)disModel {
    if (_disModel != disModel) {
        _disModel = disModel;
    }
    
    [_imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:disModel.coverPath] placeholderImage:[UIImage imageNamed:@"live_btn_image"]];
    _labelTitle.text = disModel.title;
    
}

@end
