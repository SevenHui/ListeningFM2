//
//  XQ_SmallEditorMoreTableViewCell.m
//  ListeningFM
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_SmallEditorMoreTableViewCell.h"
#import "XQ_SmallEditorMoreModel.h"

@interface XQ_SmallEditorMoreTableViewCell ()

/**封面图片*/
@property (nonatomic, retain) UIImageView *imageViewPhoto;
/**标题*/
@property (nonatomic, retain) UILabel *labelTitle;
/**副标题*/
@property (nonatomic, retain) UILabel *labelSubtitle;
/**<#注释#>*/
@property (nonatomic, retain) UIImageView *imageViewCount;
/**<#注释#>*/
@property (nonatomic, retain) UILabel *labelCount;
/**<#注释#>*/
@property (nonatomic, retain) UIImageView *imageViewNum;
/**<#注释#>*/
@property (nonatomic, retain) UILabel *labelNum;


@end

@implementation XQ_SmallEditorMoreTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self addSubview:_imageViewPhoto];
        
        self.labelTitle = [[UILabel alloc] init];
        _labelTitle.numberOfLines = 0;
        _labelTitle.font = [UIFont systemFontOfSize:18];
        [self addSubview:_labelTitle];
        
        self.labelSubtitle = [[UILabel alloc] init];
        _labelSubtitle.numberOfLines = 0;
        _labelSubtitle.font = [UIFont systemFontOfSize:15.5];
        _labelSubtitle.textColor = [UIColor grayColor];
        [self addSubview:_labelSubtitle];
        
        self.imageViewCount = [[UIImageView alloc] init];
        _imageViewCount.image = [UIImage imageNamed:@"find_albumcell_play"];
        [self addSubview:_imageViewCount];
        
        self.labelCount = [[UILabel alloc] init];
        _labelCount.font = [UIFont systemFontOfSize:15];
        _labelCount.textColor = [UIColor grayColor];
        [self addSubview:_labelCount];
        
        self.imageViewNum = [[UIImageView alloc] init];
        _imageViewNum.image = [UIImage imageNamed:@"find_hotUser_sounds"];
        [self addSubview:_imageViewNum];
        
        self.labelNum = [[UILabel alloc] init];
        _labelNum.font = [UIFont systemFontOfSize:15];
        _labelNum.textColor = [UIColor grayColor];
        [self addSubview:_labelNum];
        
        
    }
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//        _imageViewPhoto.backgroundColor = [UIColor redColor];
    _imageViewPhoto.frame = CGRectMake(WIDTH * 0.03, HEIGHT * 0.15, WIDTH * 0.18, HEIGHT * 0.7);
    
//        _labelTitle.backgroundColor = [UIColor magentaColor];
    _labelTitle.frame = CGRectMake(_imageViewPhoto.frame.origin.x * 2 + _imageViewPhoto.frame.size.width , _imageViewPhoto.frame.origin.y * 0.6, _imageViewPhoto.frame.size.width * 3.8, _imageViewPhoto.frame.size.height * 0.45);
    
//        _labelSubtitle.backgroundColor = [UIColor yellowColor];
    _labelSubtitle.frame = CGRectMake(_labelTitle.frame.origin.x, _labelTitle.frame.size.height * 0.7 + _labelTitle.frame.origin.y , _labelTitle.frame.size.width, _imageViewPhoto.frame.size.height - _labelTitle.frame.size.height);
    
//        _imageViewCount.backgroundColor = [UIColor whiteColor];
    _imageViewCount.frame =
    CGRectMake(_labelSubtitle.frame.origin.x,
               _labelSubtitle.frame.origin.y * 1.1 + _labelSubtitle.frame.size.height,
               _imageViewPhoto.frame.size.width * 0.1,
               _imageViewPhoto.frame.size.height * 0.1);
    
//        _labelCount.backgroundColor = [UIColor greenColor];
    _labelCount.frame = CGRectMake(_imageViewCount.frame.origin.x + _imageViewCount.frame.size.width * 1.5, _imageViewCount.frame.origin.y, _imageViewCount.frame.size.width * 10, _imageViewCount.frame.size.height * 1.2);
    
//        _imageViewNum.backgroundColor = [UIColor whiteColor];
    _imageViewNum.frame =
    CGRectMake(_labelCount.frame.origin.x + _labelCount.frame.size.width + _imageViewCount.frame.size.width,
               _labelCount.frame.origin.y,
               _imageViewCount.frame.size.width,
               _imageViewCount.frame.size.height);
    
//        _labelNum.backgroundColor = [UIColor blueColor];
    _labelNum.frame = CGRectMake(_imageViewNum.frame.origin.x + _imageViewNum.frame.size.width * 1.5, _imageViewNum.frame.origin.y, _imageViewNum.frame.size.width * 7, _imageViewNum.frame.size.height * 1.2);
    
    
}

-(void)setModel:(XQ_SmallEditorMoreModel *)model {
    if (_model != model) {
        _model = model;
    }
    
    [_imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:model.coverSmall] placeholderImage:[UIImage imageNamed:@"live_btn_image"]];
    _labelTitle.text = model.title;
    _labelSubtitle.text = model.intro;
    _labelCount.text = [NSString stringWithFormat:@"%ld万", (model.playsCounts) / 10000];
    _labelNum.text = [NSString stringWithFormat:@"%ld集", model.tracks];
    
    
}





@end
