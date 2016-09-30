//
//  XQ_AnchorTableViewCell.m
//  ListeningFM
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_AnchorTableViewCell.h"
#import "XQ_AnchorCollectionViewCell.h"
#import "XQ_AnchorModel.h"

@interface XQ_AnchorTableViewCell ()
<UICollectionViewDataSource, UICollectionViewDelegate>

/**嵌套的collectionView*/
@property (nonatomic, retain) UICollectionView *collectionView;

@end

@implementation XQ_AnchorTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
    }
    return self;
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(WIDTH / 3.5, 210);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 14, 0, 14);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.contentView addSubview:_collectionView];
    // 关闭滑动功能
    self.collectionView.scrollEnabled = NO;
    _collectionView.pagingEnabled = YES;
    _collectionView.showsHorizontalScrollIndicator = NO;
    
    [_collectionView registerClass:[XQ_AnchorCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _anchorModel.listArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XQ_AnchorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    cell.anchorDetailModel = _anchorModel.listArray[indexPath.item];
    
    return cell;
    
}

- (void)setAnchorModel:(XQ_AnchorModel *)anchorModel {
    if (_anchorModel != anchorModel) {
        _anchorModel = anchorModel;
    }
    
    [_collectionView reloadData];
    
    
}




@end
