//
//  XQ_SmallEditorTableViewCell.m
//  ListeningFM
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_SmallEditorTableViewCell.h"
#import "XQ_SmallEditorCollectionViewCell.h"
#import "XQ_SmallEditorModel.h"

@interface XQ_SmallEditorTableViewCell ()
<UICollectionViewDataSource, UICollectionViewDelegate>

/**嵌套的collectionView*/
@property (nonatomic, retain) UICollectionView *collectionView;

@end

@implementation XQ_SmallEditorTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(WIDTH / 3.5, HEIGHT);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 14, 0, 14);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self addSubview:_collectionView];
    // 关闭滑动功能
    self.collectionView.scrollEnabled = NO;
    _collectionView.pagingEnabled = YES;
    _collectionView.showsHorizontalScrollIndicator = NO;
    
    [_collectionView registerClass:[XQ_SmallEditorCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];

    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrSmallEditor.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XQ_SmallEditorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor cyanColor];
    
    
    XQ_SmallEditorModel *model = _arrSmallEditor[indexPath.item];
    
    [cell.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:model.coverSmall] placeholderImage:[UIImage imageNamed:@"live_btn_image"]];
    cell.labelTrackTitle.text = model.trackTitle;
    cell.labelTitle.text = model.title;
    
    
    return cell;
    
}
- (void)setArrSmallEditor:(NSMutableArray *)arrSmallEditor {
    if (_arrSmallEditor != arrSmallEditor) {
        _arrSmallEditor = arrSmallEditor;
    }
    
    [_collectionView reloadData];
    
}






@end
