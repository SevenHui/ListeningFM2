//
//  XQ_HotRecommendsTableViewCell.m
//  ListeningFM
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_HotRecommendsTableViewCell.h"
#import "XQ_HotRecommendsCollectionViewCell.h"
#import "XQ_HotRecModel.h"

@interface XQ_HotRecommendsTableViewCell ()
<UICollectionViewDataSource, UICollectionViewDelegate>

/**嵌套的CollectionView*/
@property (nonatomic, retain) UICollectionView *collectionView;
/**接收小Model的数组*/
@property (nonatomic, retain) NSMutableArray *arrHotRecList;

@end

@implementation XQ_HotRecommendsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.arrHotRecList = [NSMutableArray array];
        
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
    
    [_collectionView registerClass:[XQ_HotRecommendsCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrHotRecList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XQ_HotRecommendsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor cyanColor];
    
    cell.hotRecListModel = _arrHotRecList[indexPath.item];
    
    return cell;
    
}

- (void)setHotRecModel:(XQ_HotRecModel *)hotRecModel {
    if (_hotRecModel != hotRecModel) {
        _hotRecModel = hotRecModel;
    }
    
    _arrHotRecList = hotRecModel.arrayList;
    [_collectionView reloadData];
    
    
}


@end
