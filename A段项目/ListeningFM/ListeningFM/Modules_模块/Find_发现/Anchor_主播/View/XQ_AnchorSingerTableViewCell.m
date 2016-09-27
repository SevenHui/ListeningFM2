//
//  XQ_AnchorSingerTableViewCell.m
//  ListeningFM
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_AnchorSingerTableViewCell.h"

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
        [self addSubview:_labelDescribe];
        
        self.imageViewTracksCounts = [[UIImageView alloc] init];
        _imageViewTracksCounts.image = [UIImage imageNamed:@"find_hotUser_sounds"];
        [self addSubview:_imageViewTracksCounts];
        
        self.labelTracksCounts = [[UILabel alloc] init];
        [self addSubview:_labelTracksCounts];
        
        self.imageViewFollowersCounts = [[UIImageView alloc] init];
        _imageViewFollowersCounts.image = [UIImage imageNamed:@"find_hotUser_fans"];
        [self addSubview:_imageViewFollowersCounts];
        
        self.labelFollowersCounts = [[UILabel alloc] init];
        [self addSubview:_labelFollowersCounts];
        
        self.buttonAdd = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_buttonAdd];
        
        
    }
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _imageViewPhoto.backgroundColor = [UIColor redColor];
    _imageViewPhoto.frame = CGRectMake(WIDTH * 0.05, HEIGHT * 0.05, WIDTH * 0.15, HEIGHT * 0.9);
    
    _labelTitle.backgroundColor = [UIColor yellowColor];
    _labelTitle.frame = CGRectMake(_imageViewPhoto.frame.origin.x * 2 +_imageViewPhoto.frame.size.width, _imageViewPhoto.frame.origin.y, _imageViewPhoto.frame.size.width * 4, _imageViewPhoto.frame.size.height * 0.3);
    
    
}



@end
