//
//  XQ_AnchorCollectionViewCell.m
//  ListeningFM
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_AnchorCollectionViewCell.h"
//#import "XQ_AnchorDetailModel.h"

@interface XQ_AnchorCollectionViewCell ()

/**底层view*/
@property (nonatomic, retain) UIView *view;
/**封面图片*/
@property (nonatomic, retain) UIImageView *imageViewPhoto;
/**昵称*/
@property (nonatomic, retain) UILabel *labelName;
/**介绍*/
@property (nonatomic, retain) UILabel *labelTitle;

@end

@implementation XQ_AnchorCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.view = [[UIView alloc] init];
        [self addSubview:_view];
        
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self addSubview:_imageViewPhoto];
        
        self.labelName = [[UILabel alloc] init];
        _labelName.textAlignment = NSTextAlignmentCenter;
        _labelName.textColor = [UIColor colorWithRed:0.75 green:0.65 blue:0.51 alpha:1.00];
        [self addSubview:_labelName];
        
        self.labelTitle = [[UILabel alloc] init];
        _labelTitle.numberOfLines = 2;
        _labelTitle.font = [UIFont systemFontOfSize:16];
        [self addSubview:_labelTitle];
        
        
    }
    return self;
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    _view.backgroundColor = [UIColor colorWithRed:0.75 green:0.65 blue:0.51 alpha:1.00];
    _view.frame = CGRectMake(0, 0, WIDTH, HEIGHT * 0.7);
    
    _imageViewPhoto.backgroundColor = [UIColor whiteColor];
    _imageViewPhoto.frame = CGRectMake(_view.frame.size.width * 0.02, _view.frame.size.height * 0.012, _view.frame.size.width * 0.96, _view.frame.size.height * 0.74);
    
    _labelName.backgroundColor = [UIColor whiteColor];
    _labelName.frame = CGRectMake(_imageViewPhoto.frame.origin.x, _imageViewPhoto.frame.size.height, _imageViewPhoto.frame.size.width, _view.frame.size.height - _imageViewPhoto.frame.size.height * 1.02);
    
//    _labelTitle.backgroundColor = [UIColor cyanColor];
    _labelTitle.frame = CGRectMake(_view.frame.origin.x, _view.frame.size.height, _view.frame.size.width, HEIGHT - _view.frame.size.height);

    
}


- (void)setAnchorDetailModel:(XQ_AnchorDetailModel *)anchorDetailModel {
    if (_anchorDetailModel != anchorDetailModel) {
        _anchorDetailModel = anchorDetailModel;
    }
    
    [_imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:anchorDetailModel.smallLogo] placeholderImage:[UIImage imageNamed:@"live_btn_image"]];
    _labelName.text = anchorDetailModel.nickname;
    _labelTitle.text = anchorDetailModel.verifyTitle;

    
}

@end
