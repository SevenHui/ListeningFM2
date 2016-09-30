//
//  XQ_AnchorSingerTableViewCell.m
//  ListeningFM
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_AnchorSingerTableViewCell.h"
//#import "XQ_AnchorDetailModel.h"

@interface XQ_AnchorSingerTableViewCell ()

/**封面图片*/
@property (nonatomic, retain) UIImageView *imageViewPhoto;
/**标题*/
@property (nonatomic, retain) UILabel *labelTitle;
/**简介*/
@property (nonatomic, retain) UILabel *labelDescribe;
/**声音数量图标*/
@property (nonatomic, retain) UIImageView *imageViewTracksCounts;
/**声音数量*/
@property (nonatomic, retain) UILabel *labelTracksCounts;
/**粉丝数量图标*/
@property (nonatomic, retain) UIImageView *imageViewFollowersCounts;
/**粉丝数量*/
@property (nonatomic, retain) UILabel *labelFollowersCounts;
/**加关注*/
@property (nonatomic, retain) UIButton *buttonAdd;

@end

@implementation XQ_AnchorSingerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self addSubview:_imageViewPhoto];
        
        self.labelTitle = [[UILabel alloc] init];
        [self addSubview:_labelTitle];
        
        self.labelDescribe = [[UILabel alloc] init];
        _labelDescribe.textColor = [UIColor grayColor];
        [self addSubview:_labelDescribe];
        
        self.imageViewTracksCounts = [[UIImageView alloc] init];
        _imageViewTracksCounts.image = [UIImage imageNamed:@"find_hotUser_sounds"];
        [self addSubview:_imageViewTracksCounts];
        
        self.labelTracksCounts = [[UILabel alloc] init];
        _labelTracksCounts.textColor = [UIColor grayColor];
        [self addSubview:_labelTracksCounts];
        
        self.imageViewFollowersCounts = [[UIImageView alloc] init];
        _imageViewFollowersCounts.image = [UIImage imageNamed:@"find_hotUser_fans"];
        [self addSubview:_imageViewFollowersCounts];
        
        self.labelFollowersCounts = [[UILabel alloc] init];
        _labelFollowersCounts.textColor = [UIColor grayColor];
        [self addSubview:_labelFollowersCounts];
        
        self.buttonAdd = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonAdd setImage:[UIImage imageNamed:@"np_headview_nofollow_n"] forState:UIControlStateNormal];
        [self addSubview:_buttonAdd];
        
        
    }
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    _imageViewPhoto.backgroundColor = [UIColor redColor];
    _imageViewPhoto.frame = CGRectMake(WIDTH * 0.05, HEIGHT * 0.2, WIDTH * 0.15, HEIGHT * 0.6);
    
//    _labelTitle.backgroundColor = [UIColor yellowColor];
    _labelTitle.frame = CGRectMake(_imageViewPhoto.frame.origin.x * 2 +_imageViewPhoto.frame.size.width, _imageViewPhoto.frame.origin.y, _imageViewPhoto.frame.size.width * 3.8, _imageViewPhoto.frame.size.height * 0.35);
    
//    _labelDescribe.backgroundColor = [UIColor orangeColor];
    _labelDescribe.frame = CGRectMake(_labelTitle.frame.origin.x, _labelTitle.frame.origin.y + _labelTitle.frame.size.height * 1.2, _labelTitle.frame.size.width, _labelTitle.frame.size.height * 0.8);
    
//    _imageViewTracksCounts.backgroundColor = [UIColor whiteColor];
    _imageViewTracksCounts.frame =
    CGRectMake(_labelDescribe.frame.origin.x,
               _labelDescribe.frame.origin.y * 1.1 + _labelDescribe.frame.size.height * 1.4,
               _labelDescribe.frame.size.width * 0.05,
               _labelDescribe.frame.size.height * 0.6);
    
//    _labelTracksCounts.backgroundColor = [UIColor greenColor];
    _labelTracksCounts.frame = CGRectMake(_imageViewTracksCounts.frame.origin.x + _imageViewTracksCounts.frame.size.width, _imageViewTracksCounts.frame.origin.y, _imageViewTracksCounts.frame.size.width, _imageViewTracksCounts.frame.size.height * 1.2);
    
//    _imageViewFollowersCounts.backgroundColor = [UIColor whiteColor];
    _imageViewFollowersCounts.frame =
    CGRectMake(_labelTracksCounts.frame.origin.x * 1.1+ _labelTracksCounts.frame.size.width * 2,
               _imageViewTracksCounts.frame.origin.y,
               _imageViewTracksCounts.frame.size.width * 1.2,
               _imageViewTracksCounts.frame.size.height * 1.1);
    
//    _labelFollowersCounts.backgroundColor = [UIColor blueColor];
    _labelFollowersCounts.frame = CGRectMake(_imageViewFollowersCounts.frame.origin.x + _imageViewFollowersCounts.frame.size.width, _imageViewFollowersCounts.frame.origin.y, _imageViewFollowersCounts.frame.size.width * 4, _imageViewFollowersCounts.frame.size.height * 1.2);
    
//    _buttonAdd.backgroundColor = [UIColor whiteColor];
    _buttonAdd.frame = CGRectMake(WIDTH * 0.89, HEIGHT * 0.35, WIDTH * 0.05, HEIGHT * 0.3);
    
    
}


- (void)setAnchorDetailModel:(XQ_AnchorDetailModel *)anchorDetailModel {
    if (_anchorDetailModel != anchorDetailModel) {
        _anchorDetailModel = anchorDetailModel;
    }
    
    
    [_imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:anchorDetailModel.smallLogo] placeholderImage:[UIImage imageNamed:@"live_btn_image"]];
    _labelTitle.text = anchorDetailModel.nickname;
    _labelTracksCounts.text = [NSString stringWithFormat:@"%ld",anchorDetailModel.tracksCounts];
    _labelDescribe.text = anchorDetailModel.personDescribe;
    _labelFollowersCounts.text = [NSString stringWithFormat:@"%ld万", (anchorDetailModel.followersCounts) / 10000 ];
    
}

@end
