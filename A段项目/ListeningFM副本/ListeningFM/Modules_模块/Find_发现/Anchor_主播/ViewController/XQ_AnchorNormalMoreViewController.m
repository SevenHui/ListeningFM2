//
//  XQ_AnchorNormalMoreViewController.m
//  ListeningFM
//
//  Created by apple on 16/9/30.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_AnchorNormalMoreViewController.h"
#import "XQ_AnchorModel.h"
#import "XQ_AnchorSingerTableViewCell.h"

@interface XQ_AnchorNormalMoreViewController ()
<UITableViewDataSource, UITableViewDelegate>

/**backView*/
@property (nonatomic, retain) UIView *backView;
/**segmentControl*/
@property (nonatomic, retain) UISegmentedControl *segmentControl;
/**tableView*/
@property (nonatomic, retain) UITableView *tableView;
/**页数*/
@property (nonatomic, assign) NSInteger page;
/**更多数据*/
@property (nonatomic, retain) NSMutableArray *arrMore;

@end

@implementation XQ_AnchorNormalMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page = 1;
    self.navigationItem.title = _model.title;
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.91 alpha:1.00];
    
    [self createNavigation];
    
    [self getDataFromJsonOfNormalMore:@"hot" Page:1];
    
    [self createSegment];
    [self createTableView];
    

}
#pragma mark - segment
- (void)createSegment {
    self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN * 0.06)];
    _backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_backView];
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"最火",@"最新"]];
    _segmentControl.frame = CGRectMake(_backView.frame.size.width * 0.05, _backView.frame.size.height * 0.1, _backView.frame.size.width - _backView.frame.size.width * 0.1, _backView.frame.size.height * 0.8);
    _segmentControl.backgroundColor = [UIColor whiteColor];
    _segmentControl.tintColor = [UIColor redColor];
    _segmentControl.selectedSegmentIndex = 0;
    [_backView addSubview:_segmentControl];
    [_segmentControl addTarget:self action:@selector(segmentControlAction:) forControlEvents:UIControlEventValueChanged];
    
}
- (void)segmentControlAction:(UISegmentedControl *)segmentControl {
    if (_segmentControl.selectedSegmentIndex == 0) {
        [self getDataFromJsonOfNormalMore:@"hot" Page:1];
    }
    else if (_segmentControl.selectedSegmentIndex == 1) {
        [self getDataFromJsonOfNormalMore:@"new" Page:1];
    }
    
}
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _backView.frame.size.height, WIDTHSCREEN, HEIGHTSCREEN - 64) style:UITableViewStylePlain];
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
    if (_segmentControl.selectedSegmentIndex == 0) {
        [self getDataFromJsonOfNormalMore:@"hot" Page:1];
    }
    else if (_segmentControl.selectedSegmentIndex == 1) {
        [self getDataFromJsonOfNormalMore:@"new" Page:1];
    }
}
#pragma mark - 上拉加载
- (void)getDownData {
    _page++;
    if (_segmentControl.selectedSegmentIndex == 0) {
        [self getDataFromJsonOfNormalMore:@"hot" Page:_page];
    }
    else if (_segmentControl.selectedSegmentIndex == 1) {
        [self getDataFromJsonOfNormalMore:@"new" Page:_page];
    }
}

#pragma mark - 后面更多数据
- (void)getDataFromJsonOfNormalMore:(NSString *)str Page:(NSInteger)page {
    if (page == 1) {
        self.arrMore = [NSMutableArray array];
    }
    NSString *string = [NSString stringWithFormat:@"http://mobile.ximalaya.com/m/explore_user_list?category_name=%@&condition=%@&device=android&page=%ld&per_page=20", _model.name, str, page];
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
