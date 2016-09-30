//
//  XQ_LiveMoreViewController.m
//  ListeningFM
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_LiveMoreViewController.h"
// 更多
#import "XQ_LiveRadiosModel.h"
#import "XQ_LiveTableViewCell.h"

@interface XQ_LiveMoreViewController ()
<UITableViewDataSource, UITableViewDelegate>

/**主界面视图*/
@property (nonatomic, retain) UITableView *tableView;
/**更多数据*/
@property (nonatomic, retain) NSMutableArray *arrMore;
/**page*/
@property (nonatomic, assign) NSInteger page;

@end

@implementation XQ_LiveMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page = 1;
    
    self.navigationItem.title = _name;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.91 alpha:1.00];
    
    [self createNavigation];
    
    self.arrMore = [NSMutableArray array];
    
    [self getDataFromJsonOfMore:1];
    
    [self createTableView];

}

- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN - 64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.rowHeight = 120;
    
    [_tableView registerClass:[XQ_LiveTableViewCell class] forCellReuseIdentifier:@"cell"];
    
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
    
        XQ_LiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
        if (_arrMore.count != 0) {
            
            cell.liveRadiosModel = _arrMore[indexPath.row];
            
        }
        
        return cell;

}

#pragma mark - 下拉刷新
- (void)getUpData {
    [_arrMore removeAllObjects];
    [_tableView reloadData];
    [self getDataFromJsonOfMore :1];
}
#pragma mark - 上拉加载
- (void)getDownData {
    _page++;
    [self getDataFromJsonOfMore:_page];
    
}

#pragma mark - 更多数据
- (void)getDataFromJsonOfMore:(NSInteger)page {
    NSString *string = [NSString stringWithFormat:_string, page];
    [XQNetTool GET:string Body:nil HeaderFile:nil Response:XQJSON Success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        NSDictionary *dict = dic[@"data"];
        NSMutableArray *arrData = dict[@"data"];
        for (NSDictionary *dic in arrData) {
            XQ_LiveRadiosModel *model = [[XQ_LiveRadiosModel alloc] initWithDic:dic];
            [_arrMore addObject:model];
        }
        
        [_tableView reloadData];
        
    } Failure:^(NSError *error) {
        
        
        
    }];
    
    
}







@end
