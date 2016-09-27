//
//  XQ_LiveCell.m
//  ListeningFM
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_LiveCell.h"

@interface XQ_LiveCell ()
<UITableViewDataSource, UITableViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegate>

/**主界面视图*/
@property (nonatomic, retain) UITableView *tableView;
/**头视图*/
@property (nonatomic, retain) UIView *headerView;
/**最上面电台*/
@property (nonatomic, retain) UICollectionView *upCollectionView;

@end

@implementation XQ_LiveCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 - 49) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 100;
    [self addSubview:_tableView];
    // 不显示线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.bounces = NO;
    _tableView.showsVerticalScrollIndicator = NO;

    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
    
    [self createHeaderView];
    
    
}

#pragma mark - 头视图
- (void)createHeaderView {
    // 头视图
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN * 0.47)];
    _headerView.backgroundColor = [UIColor whiteColor];
    _tableView.tableHeaderView = _headerView;
    
    [self createUpLiveCollectionView];
    
}
- (void)createUpLiveCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(WIDTHSCREEN / 5, _headerView.bounds.size.height * 0.35);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 20;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.upCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, _headerView.bounds.size.height * 0.35) collectionViewLayout:flowLayout];
    _upCollectionView.backgroundColor = [UIColor whiteColor];
    _upCollectionView.dataSource = self;
    _upCollectionView.delegate = self;
    [_headerView addSubview:_upCollectionView];
    
    _upCollectionView.pagingEnabled = YES;
    _upCollectionView.showsHorizontalScrollIndicator = NO;
    
    // 圆CollectionView
    [_upCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"upCollectionView"];

    
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"upCollectionView" forIndexPath:indexPath];
    cell.backgroundColor = COLOR;
    return cell;
}
#pragma mark - 分区头标题高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return WIDTHSCREEN * 0.15;
}
#pragma mark - 自定义分区头标题
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, WIDTHSCREEN * 0.15)];
    view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.91 alpha:1.00];
    // 分界面
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, view.bounds.size.height * 0.25, WIDTHSCREEN, view.bounds.size.height * 0.75)];
    lineView.backgroundColor = [UIColor whiteColor];
    [view addSubview:lineView];
    // 三角
    UIImageView *imageViewAngle = [[UIImageView alloc] initWithFrame:CGRectMake(lineView.bounds.size.width * 0.02, lineView.bounds.size.height * 0.3, lineView.bounds.size.width * 0.04, lineView.bounds.size.height * 0.4)];
    //    imageViewAngle.backgroundColor = [UIColor blueColor];
    imageViewAngle.image = [UIImage imageNamed:@"liveRadioCellPoint"];
    [lineView addSubview:imageViewAngle];
    // 分区标题
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(imageViewAngle.bounds.size.width * 2, lineView.bounds.size.height * 0.2, imageViewAngle.bounds.size.width * 7, lineView.bounds.size.height * 0.6)];
    //    labelTitle.backgroundColor = [UIColor whiteColor];
    [lineView addSubview:labelTitle];
    // 本地头标题
    if (section == 0) {
        
    }
    // 排行榜头标题
    else {
        
    }
    // 更多
    UIButton *buttonMore = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonMore.frame = CGRectMake(lineView.bounds.size.width * 0.85, lineView.bounds.size.height * 0.2, lineView.bounds.size.width * 0.15, lineView.bounds.size.height * 0.6);
    [buttonMore setTitle:@"更多 〉" forState:UIControlStateNormal];
    [buttonMore setTitle:@"更多 〉" forState:UIControlStateHighlighted];
    [buttonMore setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [buttonMore setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [lineView addSubview:buttonMore];
    // 本地
    if (section == 0) {
        [buttonMore addTarget:self action:@selector(localCityButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    // 排行榜
    else {
        [buttonMore addTarget:self action:@selector(rankingButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return view;
    
}

#pragma mark - 分区的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
    
}
#pragma mark - Cell的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
#pragma mark - Cell赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    cell.backgroundColor = COLOR;
    
    return cell;
    
}


#pragma mark - 跳转界面点击事件
- (void)localCityButtonAction:(UIButton *)localCityButton {
    [localCityButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [localCityButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    NSLog(@"本地更多");
}
- (void)rankingButtonAction:(UIButton *)rankingButton {
    [rankingButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [rankingButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    NSLog(@"排行榜更多");
}





@end
