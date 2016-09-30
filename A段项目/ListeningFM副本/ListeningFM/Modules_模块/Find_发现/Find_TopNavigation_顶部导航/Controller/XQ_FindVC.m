//
//  XQ_FindVC.m
//  ListeningFM
//
//  Created by apple on 16/9/20.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_FindVC.h"
// 顶部导航栏cell
#import "XQ_TopCollectionViewCell.h"
#import "XQ_TopModel.h"
// 推荐
#import "XQ_RecommendCell.h"
// 分类
#import "XQ_CategoryCell.h"
// 广播
#import "XQ_LiveCell.h"
// 榜单
#import "XQ_RankingCell.h"
// 主播
#import "XQ_AnchorCell.h"

@interface XQ_FindVC ()
<UICollectionViewDataSource, UICollectionViewDelegate>

/**顶部导航栏数据数组*/
@property (nonatomic, retain) NSMutableArray *arrTopNavigation;
/**顶部导航栏*/
@property (nonatomic, retain) UICollectionView *topCollectionView;
/**切换视图*/
@property (nonatomic, retain) UICollectionView *changeCollectionView;
/**<#注释#>*/
@property (nonatomic, assign) NSInteger numIndexPath;


@end

@implementation XQ_FindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00];

    self.arrTopNavigation = [NSMutableArray array];
    [self getDataFromJsonOfTopNavigation];
    
    [self createTopCollectionView];
    [self createChangeCollectionView];
    
    
}

#pragma mark - 顶部导航栏视图
- (void)createTopCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(WIDTHSCREEN / 5, HEIGHTSCREEN * 0.06);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.topCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN * 0.06)collectionViewLayout:flowLayout];
    _topCollectionView.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00];
    _topCollectionView.delegate = self;
    _topCollectionView.dataSource = self;
    _topCollectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_topCollectionView];
    
    [_topCollectionView registerClass:[XQ_TopCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
    
    
}
#pragma mark - 切换视图
- (void)createChangeCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(WIDTHSCREEN, HEIGHTSCREEN - _topCollectionView.frame.origin.y - _topCollectionView.frame.size.height);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.changeCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, _topCollectionView.frame.origin.y + _topCollectionView.frame.size.height, WIDTHSCREEN, HEIGHTSCREEN - _topCollectionView.frame.origin.y - _topCollectionView.frame.size.height) collectionViewLayout:flowLayout];
    _changeCollectionView.backgroundColor = [UIColor whiteColor];
    _changeCollectionView.dataSource = self;
    _changeCollectionView.delegate = self;
    _changeCollectionView.pagingEnabled = YES;
    [self.view addSubview:_changeCollectionView];

    // 推荐
    [_changeCollectionView registerClass:[XQ_RecommendCell class] forCellWithReuseIdentifier:@"recommendCell"];
    // 分类
    [_changeCollectionView registerClass:[XQ_CategoryCell class] forCellWithReuseIdentifier:@"categoryCell"];
    // 广播
    [_changeCollectionView registerClass:[XQ_LiveCell class] forCellWithReuseIdentifier:@"liveCell"];
    // 榜单
    [_changeCollectionView registerClass:[XQ_RankingCell class] forCellWithReuseIdentifier:@"rankingCell"];
    // 主播
    [_changeCollectionView registerClass:[XQ_AnchorCell class] forCellWithReuseIdentifier:@"anchorCell"];
    
    
}

#pragma mark - item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrTopNavigation.count;
}
#pragma mark - Cell赋值
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == _topCollectionView) {
        XQ_TopCollectionViewCell *findCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
        
        if (_arrTopNavigation.count != 0) {
            findCell.topModel = _arrTopNavigation[indexPath.item];
        }
        
        if (_numIndexPath == indexPath.item) {
            [findCell setDidSelected:YES];
        }
        else{
            [findCell setDidSelected:NO];
        }

        return findCell;
        
    }
    // 推荐Cell
    if (indexPath.item == 0) {
        XQ_RecommendCell *recommendVC = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommendCell" forIndexPath:indexPath];
        recommendVC.backgroundColor = [UIColor whiteColor];
        return recommendVC;
        
    }
    // 分类Cell
    if (indexPath.item == 1) {
        XQ_CategoryCell *classVC = [collectionView dequeueReusableCellWithReuseIdentifier:@"categoryCell" forIndexPath:indexPath];
        classVC.backgroundColor = [UIColor whiteColor];
        return classVC;
    }
    // 广播
    if (indexPath.item == 2) {
        XQ_LiveCell *broadcastVC = [collectionView dequeueReusableCellWithReuseIdentifier:@"liveCell" forIndexPath:indexPath];
        broadcastVC.backgroundColor = [UIColor whiteColor];
        return broadcastVC;
    }
    // 榜单Cell
    if (indexPath.item == 3) {
        XQ_RankingCell *listVC = [collectionView dequeueReusableCellWithReuseIdentifier:@"rankingCell" forIndexPath:indexPath];
        listVC.backgroundColor = [UIColor grayColor];
        
        return listVC;
    }
    // 主播Cell
    else {
        XQ_AnchorCell *anchorVC = [collectionView dequeueReusableCellWithReuseIdentifier:@"anchorCell" forIndexPath:indexPath];
        anchorVC.backgroundColor = [UIColor whiteColor];
        return anchorVC;
    }
    
}


#pragma mark - 切换视图
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == _topCollectionView) {
        // 将前一个item还原
        XQ_TopCollectionViewCell *cell = (XQ_TopCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_numIndexPath inSection:0]];
        [cell setDidSelected:NO];
        // 获取当前的item
        XQ_TopCollectionViewCell *secondcell = (XQ_TopCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [secondcell setDidSelected:YES];
        _numIndexPath = indexPath.item;
        
        _changeCollectionView.contentOffset = CGPointMake(WIDTHSCREEN * _numIndexPath, 0);
        
    }
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _changeCollectionView) {
        
        [self.topCollectionView setContentOffset:CGPointMake(scrollView.contentOffset.x / WIDTHSCREEN, 0)];
        
        NSIndexPath *inin = [NSIndexPath indexPathForItem:scrollView.contentOffset.x / WIDTHSCREEN inSection:0];
        XQ_TopCollectionViewCell *cell = (XQ_TopCollectionViewCell *)[_topCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_numIndexPath inSection:0]];
        [cell setDidSelected:NO];
        
        XQ_TopCollectionViewCell *secondcell = (XQ_TopCollectionViewCell *)[_topCollectionView cellForItemAtIndexPath:inin];
        [secondcell setDidSelected:YES];
        _numIndexPath = inin.item;
        
        _changeCollectionView.contentOffset = CGPointMake(WIDTHSCREEN * _numIndexPath, 0);
        
        
    }
    
}


#pragma mark - 发现顶部导航栏的数据
- (void)getDataFromJsonOfTopNavigation {
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v1/tabs?device=android";
    [XQNetTool GET:string Body:nil HeaderFile:nil Response:XQJSON Success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        NSDictionary *dicTabs = dic[@"tabs"];
        NSMutableArray *arrList = dicTabs[@"list"];
        for (NSDictionary *dic in arrList) {
            XQ_TopModel *model = [[XQ_TopModel alloc] initWithDic:dic];
            [_arrTopNavigation addObject:model];
        }
        
        [_topCollectionView reloadData];
        [_changeCollectionView reloadData];
        
    } Failure:^(NSError *error) {
        
        
        
    }];
    
}


@end





