//
//  XQ_AnchorFamousMoreViewController.m
//  ListeningFM
//
//  Created by apple on 16/9/30.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_AnchorFamousMoreViewController.h"
#import "XQ_AnchorModel.h"
#import "XQ_AnchorSingerTableViewCell.h"

@interface XQ_AnchorFamousMoreViewController ()
<UITableViewDataSource, UITableViewDelegate>

/**<#注释#>*/
@property (nonatomic, retain) UITableView *tableView;
/**<#注释#>*/
@property (nonatomic, assign) NSInteger page;
/**更多数据*/
@property (nonatomic, retain) NSMutableArray *arrMore;

@end

@implementation XQ_AnchorFamousMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page = 1;
    self.navigationItem.title = _model.title;
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.91 alpha:1.00];
    
    [self createNavigation];
    
    [self getDataFromJsonOfFamousMore:1];
    
    [self createTableView];
    
}

- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN - 64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.rowHeight = 120;
    
    [_tableView registerClass:[XQ_AnchorSingerTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    // 下拉刷新
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self getUpData];
        [_tableView.mj_header endRefreshing];
        
    }];
    // 上拉加载
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [self getDownData];
        [_tableView.mj_footer endRefreshing];
        
    }];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrMore.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XQ_AnchorSingerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (_arrMore.count != 0) {
        
        cell.anchorDetailModel = _arrMore[indexPath.row];
        
    }
    
    return cell;
    
}

#pragma mark - 下拉刷新
- (void)getUpData {
    [_arrMore removeAllObjects];
    [_tableView reloadData];
    [self getDataFromJsonOfFamousMore:1];
}
#pragma mark - 上拉加载
- (void)getDownData {
    _page++;
    [self getDataFromJsonOfFamousMore:_page];
    
}

- (void)getDataFromJsonOfFamousMore:(NSInteger)page {
    self.arrMore = [NSMutableArray array];
    NSString *string = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/discovery/v1/anchor/famous?category_id=%@&device=iPhone&page=%ld&per_page=20", _model.ID, _page];
    [XQNetTool GET:string Body:nil HeaderFile:nil Response:XQJSON Success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        NSMutableArray *arrList = dic[@"list"];
        for (NSDictionary *dic in arrList) {
            XQ_AnchorDetailModel *model = [[XQ_AnchorDetailModel alloc] initWithDic:dic];
            [_arrMore addObject:model];
        }
        
        [_tableView reloadData];
        
    } Failure:^(NSError *error) {
        
        
        
    }];
    
    
}

@end
