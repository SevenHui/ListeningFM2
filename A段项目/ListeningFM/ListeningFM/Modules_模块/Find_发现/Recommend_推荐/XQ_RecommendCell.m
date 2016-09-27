//
//  XQ_RecommendCell.m
//  ListeningFM
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_RecommendCell.h"
// 轮播图
#import "SDCycleScrollView.h"
// 圆CollectionView
#import "XQ_DisModel.h"
#import "XQ_DisCollectionViewCell.h"
// 小编推荐
#import "XQ_SmallEditorModel.h"
#import "XQ_SmallEditorTableViewCell.h"
#import "XQ_SmallEditorViewController.h"
// 听大连
#import "XQ_LocalCityModel.h"
#import "XQ_LocalCityTableViewCell.h"
// 精品听单
#import "XQ_SpecialHearModel.h"
#import "XQ_SpecialHearTableViewCell.h"
// 热门推荐
#import "XQ_HotRecModel.h"
#import "XQ_HotRecommendsTableViewCell.h"

@interface XQ_RecommendCell ()
<
UITableViewDataSource, UITableViewDelegate,
SDCycleScrollViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegate
>

/**主界面的视图*/
@property (nonatomic, retain) UITableView *tableView;
/**头视图*/
@property (nonatomic, retain) UIView *headerView;
/**轮播图*/
@property (nonatomic, retain) SDCycleScrollView *sdCycleScrollView;
/**轮播图数据*/
@property (nonatomic, retain) NSMutableArray *arrCycleScrollView;
/**圆collectionView*/
@property (nonatomic, retain) UICollectionView *disCollectionView;
/**圆collectionView数据*/
@property (nonatomic, retain) NSMutableArray *arrDisCollectionView;
/**小编推荐Title*/
@property (nonatomic, retain) NSString *strSmallEditor;
/**小编推荐数据*/
@property (nonatomic, retain) NSMutableArray *arrSmallEditor;
/**听大连Title*/
@property (nonatomic, retain) NSString *strLocalCity;
/**听大连数据*/
@property (nonatomic, retain) NSMutableArray *arrLocalCity;
/**精品听单Title*/
@property (nonatomic, retain) NSString *strSpecialHear;
/**精品听单数据*/
@property (nonatomic, retain) NSMutableArray *arrSpecialHear;
/**热门推荐数据*/
@property (nonatomic, retain) NSMutableArray *arrHotRecommends;

@end

@implementation XQ_RecommendCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.arrCycleScrollView = [NSMutableArray array];
        self.arrDisCollectionView = [NSMutableArray array];
        self.arrSmallEditor = [NSMutableArray array];
        self.arrLocalCity = [NSMutableArray array];
        self.arrSpecialHear = [NSMutableArray array];
        self.arrHotRecommends = [NSMutableArray array];
        
        [self getDataFromJsonOfEditorAndImagesAndSpecial];
        [self getDataFromJsonOfDiscoveryHeader];
        
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 - 49) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self addSubview:_tableView];
    // 不显示线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.bounces = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    
    // 小编推荐
    [_tableView registerClass:[XQ_SmallEditorTableViewCell class] forCellReuseIdentifier:@"smallEditorCell"];
    // 听大连
    [_tableView registerClass:[XQ_LocalCityTableViewCell class] forCellReuseIdentifier:@"localCityCell"];
    // 精品听单
    [_tableView registerClass:[XQ_SpecialHearTableViewCell class] forCellReuseIdentifier:@"specialHearCell"];
    // 热门推荐
    [_tableView registerClass:[XQ_HotRecommendsTableViewCell class] forCellReuseIdentifier:@"hotRecommendsCell"];
    
    
    [self createTableHeaderView];
    
    
}


#pragma mark - 头视图
- (void)createTableHeaderView {
    // 头视图
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN * 0.45)];
    _headerView.backgroundColor = [UIColor whiteColor];
    _tableView.tableHeaderView = _headerView;
    // 轮播图
    self.sdCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WIDTHSCREEN, _headerView.bounds.size.height * 0.65) delegate:self placeholderImage:[UIImage imageNamed:@"live_btn_image"]];
    [_headerView addSubview:_sdCycleScrollView];
    // 圆CollectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(WIDTHSCREEN / 5, (_headerView.bounds.size.height - _sdCycleScrollView.bounds.size.height) * 0.86);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(8, 10, 8, 10);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.disCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _sdCycleScrollView.bounds.size.height, WIDTHSCREEN, _headerView.bounds.size.height - _sdCycleScrollView.bounds.size.height) collectionViewLayout:flowLayout];
    _disCollectionView.backgroundColor = [UIColor whiteColor];
    _disCollectionView.dataSource = self;
    _disCollectionView.delegate = self;
    [_headerView addSubview:_disCollectionView];
    
    _disCollectionView.pagingEnabled = YES;
    _disCollectionView.showsHorizontalScrollIndicator = NO;
    
    // 圆CollectionView
    [_disCollectionView registerClass:[XQ_DisCollectionViewCell class] forCellWithReuseIdentifier:@"disCell"];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrDisCollectionView.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XQ_DisCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"disCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.disModel = _arrDisCollectionView[indexPath.item];
    return cell;
}

#pragma mark - 自定义分区头标题高度
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
    
    // 小编推荐
    if (section == 0) {
        labelTitle.text = _strSmallEditor;
    }
    // 听大连
    else if (section == 1) {
        labelTitle.text = _strLocalCity;
    }
    // 精品听单
    else if (section == 2) {
        labelTitle.text = _strSpecialHear;
    }
    // 热门推荐
    else if (_arrHotRecommends.count != 0) {
        XQ_HotRecModel *model = [_arrHotRecommends objectAtIndex:section - 3];
        labelTitle.text = model.title;
    }
    
    // 更多
    UIButton *buttonMore = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonMore.frame = CGRectMake(lineView.bounds.size.width * 0.85, lineView.bounds.size.height * 0.2, lineView.bounds.size.width * 0.15, lineView.bounds.size.height * 0.6);
    [buttonMore setTitle:@"更多 〉" forState:UIControlStateNormal];
    [buttonMore setTitle:@"更多 〉" forState:UIControlStateHighlighted];
    [buttonMore setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [buttonMore setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [lineView addSubview:buttonMore];
    // 小编推荐
    if (section == 0) {
        [buttonMore addTarget:self action:@selector(smallEditorButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    // 听大连
    if (section == 1) {
        [buttonMore addTarget:self action:@selector(localCityButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    // 精品听单
    if (section == 2) {
        [buttonMore addTarget:self action:@selector(specialHearButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    // 热门推荐
    if (_arrHotRecommends.count != 0) {
        [buttonMore addTarget:self action:@selector(hotRecommendsButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return view;
    
}

#pragma mark - 分区的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _arrHotRecommends.count + 3;
    
}
#pragma mark - Cell的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 精品听单
    if (section == 2) {
        return 2;
    }
    return 1;
}
#pragma mark - Cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 精品听单
    if (indexPath.section == 2) {
        return 110;
    }
    return 210;
}
#pragma mark - Cell赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 小编推荐
    if (indexPath.section == 0) {
        XQ_SmallEditorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"smallEditorCell"];
        //        cell.backgroundColor = [UIColor redColor];
        cell.arrSmallEditor = _arrSmallEditor;
        return cell;
    }
    // 听大连
    if (indexPath.section == 1) {
        XQ_LocalCityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"localCityCell"];
        //        cell.backgroundColor = [UIColor orangeColor];
        cell.arrLocalCity = _arrLocalCity;
        return cell;
    }
    // 精品听单
    if (indexPath.section == 2) {
        XQ_SpecialHearTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"specialHearCell"];
        //        cell.backgroundColor = COLOR;
        cell.specialHearModel = _arrSpecialHear[indexPath.row];
        return cell;
    }
    // 热门推荐
    XQ_HotRecommendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotRecommendsCell"];
    //    cell.backgroundColor = COLOR;
    if (_arrHotRecommends.count != 0) {
        cell.hotRecModel = _arrHotRecommends[indexPath.section - 3];
    }
    return cell;
    
    
}


#pragma mark - 跳转界面点击事件
// 小编推荐更多
-(void)smallEditorButtonAction:(UIButton *)smallEditorButton {
    [smallEditorButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [smallEditorButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    NSLog(@"小编推荐");
//    XQ_SmallEditorViewController *smallEditorVC = [[XQ_SmallEditorViewController alloc] init];
    
    
    
}
// 听大连更多
- (void)localCityButtonAction:(UIButton *)localCityButton {
    [localCityButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [localCityButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    NSLog(@"听大连");
    
}
// 精品听单更多
- (void)specialHearButtonAction:(UIButton *)specialHearButton {
    [specialHearButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [specialHearButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    NSLog(@"精品听单");
}
// 热门推荐更多
- (void)hotRecommendsButtonAction:(UIButton *)hotRecommendsButton {
    [hotRecommendsButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [hotRecommendsButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    NSLog(@"热门推荐");
    
}

#pragma mark - 数据解析
// 轮播图&小编推荐&精品听单的数据
- (void)getDataFromJsonOfEditorAndImagesAndSpecial {
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v4/recommends?channel=and-d8&device=android&includeActivity=true&includeSpecial=true&scale=2&version=5.4.27";
    [XQNetTool GET:string Body:nil HeaderFile:nil Response:XQJSON Success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        // 轮播图数据
        NSDictionary *dicFocusImages = dic[@"focusImages"];
        NSArray *arrFocusList = dicFocusImages[@"list"];
        for (NSDictionary *dic in arrFocusList) {
            [self.arrCycleScrollView addObject:[dic objectForKey:@"pic"]];
            _sdCycleScrollView.imageURLStringsGroup = _arrCycleScrollView;
        }
        // 小编推荐数据
        NSDictionary *dicEditor = dic[@"editorRecommendAlbums"];
        self.strSmallEditor = dicEditor[@"title"];
        NSMutableArray *arrEditorList = dicEditor[@"list"];
        for (NSDictionary *dic in arrEditorList) {
            XQ_SmallEditorModel *model = [[XQ_SmallEditorModel alloc] initWithDic:dic];
            [_arrSmallEditor addObject:model];
            //            NSLog(@"小编%ld", _arrSmallEditor.count);
        }
        // 精品听单数据
        NSDictionary *dicSpecialColumn = dic[@"specialColumn"];
        self.strSpecialHear = dicSpecialColumn[@"title"];
        NSMutableArray *arrSpecialList = dicSpecialColumn[@"list"];
        for (NSDictionary *dic in arrSpecialList) {
            XQ_SpecialHearModel *model = [[XQ_SpecialHearModel alloc] initWithDic:dic];
            [_arrSpecialHear addObject:model];
            //            NSLog(@"精品%ld", _arrSpecialHear.count);
        }
        
        [_tableView reloadData];
        
    } Failure:^(NSError *error) {
        
        
        
    }];
    
}
// 榜单_发现新奇&猜你喜欢&听大连&付费会员&热门推荐
- (void)getDataFromJsonOfDiscoveryHeader {
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v2/recommend/hotAndGuess?code=43_210000_2102&device=android&version=5.4.27";
    [XQNetTool GET:string Body:nil HeaderFile:nil Response:XQJSON Success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        // 发现新奇
        NSDictionary *dicDiscoveryColumns = dic[@"discoveryColumns"];
        NSMutableArray *arrDisList = dicDiscoveryColumns[@"list"];
        for (NSDictionary *dic in arrDisList) {
            XQ_DisModel *model = [[XQ_DisModel alloc] initWithDic:dic];
            [_arrDisCollectionView addObject:model];
            //            NSLog(@"圆%ld", _arrDisCollectionView.count);
        }
        // 听大连
        NSDictionary *dicCity = dic[@"cityColumn"];
        self.strLocalCity = dicCity[@"title"];
        NSMutableArray *arrCityList = dicCity[@"list"];
        for (NSDictionary *dic in arrCityList) {
            XQ_LocalCityModel *model = [[XQ_LocalCityModel alloc] initWithDic:dic];
            [_arrLocalCity addObject:model];
            //            NSLog(@"听大连%ld", _arrLocalCity.count);
        }
        // 热门推荐
        NSDictionary *dicHotRecommends = dic[@"hotRecommends"];
        NSMutableArray *arrHotList = dicHotRecommends[@"list"];
        for (NSDictionary *dic in arrHotList) {
            XQ_HotRecModel *model = [[XQ_HotRecModel alloc] initWithDic:dic];
            [_arrHotRecommends addObject:model];
            //            NSLog(@"热门推荐%ld", _arrHotRecommends.count);
            
        }
        
        [_disCollectionView reloadData];
        [_tableView reloadData];
        
    } Failure:^(NSError *error) {
        
        
    }];
    
}




@end
