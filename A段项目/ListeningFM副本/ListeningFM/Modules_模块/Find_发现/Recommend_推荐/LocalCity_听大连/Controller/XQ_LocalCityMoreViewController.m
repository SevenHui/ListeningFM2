//
//  XQ_LocalCityMoreViewController.m
//  ListeningFM
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_LocalCityMoreViewController.h"
// 最上面
#import "XQ_LocalCityMoreTopModel.h"
#import "XQ_LocalCityMoreTopCollectionViewCell.h"
// 切换
#import "XQ_LocalCityMoreMainModel.h"
#import "XQ_LocalCityReconmmendCollectionViewCell.h"
#import "XQ_LocalCityMainCollectionViewCell.h"

@interface XQ_LocalCityMoreViewController ()
<UICollectionViewDataSource, UICollectionViewDelegate>

/**顶部视图*/
@property (nonatomic, retain) UICollectionView *upCollectionView;
/**顶部数据*/
@property (nonatomic, retain) NSMutableArray *arrTop;
/**切换视图*/
@property (nonatomic, retain) UICollectionView *changeCollectionView;

@end

@implementation XQ_LocalCityMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00];
    self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.91 alpha:1.00];
    self.navigationItem.title = _strTitle;
    
    [self createNavigation];
    [self createSearchBar];
    
    
    self.arrTop = [NSMutableArray array];
    [self getDataFromJsonOfTop];
    
    [self createUpCollectionView];
    [self createChangeCollectionView];
    
    
}

#pragma mark - 导航栏搜索按钮
- (void)createSearchBar {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(leftBarButtonAction:)];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
}
- (void)leftBarButtonAction:(UIBarButtonItem *)sender {
    NSLog(@"跳转至搜索界面");
}

#pragma mark - 顶部视图
- (void)createUpCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(WIDTHSCREEN / 5, HEIGHTSCREEN * 0.06);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.upCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, HEIGHTSCREEN * 0.002, WIDTHSCREEN, HEIGHTSCREEN * 0.06)collectionViewLayout:flowLayout];
    _upCollectionView.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00];
    _upCollectionView.delegate = self;
    _upCollectionView.dataSource = self;
    _upCollectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_upCollectionView];
    
    [_upCollectionView registerClass:[XQ_LocalCityMoreTopCollectionViewCell class] forCellWithReuseIdentifier:@"upCollectionViewCell"];

}
#pragma mark - 切换视图
- (void)createChangeCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(WIDTHSCREEN, HEIGHTSCREEN - _upCollectionView.frame.origin.y - _upCollectionView.frame.size.height);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.changeCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, _upCollectionView.frame.origin.y + _upCollectionView.frame.size.height, WIDTHSCREEN, HEIGHTSCREEN - _upCollectionView.frame.origin.y - _upCollectionView.frame.size.height) collectionViewLayout:flowLayout];
    _changeCollectionView.backgroundColor = [UIColor redColor];
    _changeCollectionView.dataSource = self;
    _changeCollectionView.delegate = self;
    _changeCollectionView.pagingEnabled = YES;
    [self.view addSubview:_changeCollectionView];
    
    [_changeCollectionView registerClass:[XQ_LocalCityReconmmendCollectionViewCell class] forCellWithReuseIdentifier:@"recommendCell"];
    [_changeCollectionView registerClass:[XQ_LocalCityMainCollectionViewCell class] forCellWithReuseIdentifier:@"mainCell"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrTop.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
#pragma mark - 顶部导航栏视图赋值
    if (collectionView == _upCollectionView) {
        
        XQ_LocalCityMoreTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"upCollectionViewCell" forIndexPath:indexPath];
        if (_arrTop.count != 0) {
            XQ_LocalCityMoreTopModel *model = [_arrTop objectAtIndex:indexPath.item];
            cell.model = model;
        }
                
        return cell;
        
    }
    
#pragma mark - 切换视图赋值
   else if (collectionView == _changeCollectionView) {
        // 推荐
        if (indexPath.item == 0) {
            XQ_LocalCityReconmmendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommendCell" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor orangeColor];
            return cell;
        }
        // 其他
        else if (indexPath.item != 0) {
            XQ_LocalCityMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mainCell" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor magentaColor];
            
            return cell;
            
        }
    }
    
    return nil;
    
}


#pragma mark - 顶部导航栏数据
- (void)getDataFromJsonOfTop {
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v1/city/tab?code=43_210000_2102&device=android&statEvent=pageview&version=5.4.27";
    [XQNetTool GET:string Body:nil HeaderFile:nil Response:XQJSON Success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        NSMutableArray *arrTab = dic[@"tab"];
        for (NSDictionary *dic in arrTab) {
            XQ_LocalCityMoreTopModel *model = [[XQ_LocalCityMoreTopModel alloc] initWithDic:dic];
            [_arrTop addObject:model];
        }
        
        [_upCollectionView reloadData];
        
    } Failure:^(NSError *error) {
        
        
        
    }];
}



@end
