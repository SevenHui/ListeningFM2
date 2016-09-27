//
//  XQ_AnchorCell.m
//  ListeningFM
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_AnchorCell.h"
#import "XQ_AnchorModel.h"
#import "XQ_AnchorSingerTableViewCell.h"

@interface XQ_AnchorCell ()
<UITableViewDataSource, UITableViewDelegate>

/**主界面视图*/
@property (nonatomic, retain) UITableView *tableView;
/**前四分区头标题数据*/
@property (nonatomic, retain) NSMutableArray *arrFamousTitle;
/**前四个分区数据*/
@property (nonatomic, retain) NSMutableArray *arrFamous;
/**后面分区头标题数据*/
@property (nonatomic, retain) NSMutableArray *arrNormalTitle;
/**后面分区数据*/
@property (nonatomic, retain) NSMutableArray *arrNormal;

@end

@implementation XQ_AnchorCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.arrFamousTitle = [NSMutableArray array];
        self.arrFamous = [NSMutableArray array];
        self.arrNormalTitle = [NSMutableArray array];
        self.arrNormal = [NSMutableArray array];
        
        [self getDataFromJsonOfAnchor];
        
    }
    return self;
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 - 49) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self addSubview:_tableView];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.bounces = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    
    // 注册前三分区cell
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"famousThirdCell"];
    // 注册第四分区cell
    [_tableView registerClass:[XQ_AnchorSingerTableViewCell class] forCellReuseIdentifier:@"famousOfSingerCell"];
    // 注册后面分区cell
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"normalCell"];
    
    
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
    // 前四个分区的头标题
    if (section < 4) {
        if (_arrFamousTitle.count != 0) {
            XQ_AnchorModel *model = _arrFamousTitle[section];
            labelTitle.text = model.title;
        }
    }
    else {
        if (_arrNormalTitle.count != 0) {
            XQ_AnchorModel *model = _arrNormalTitle[section - 4];
            labelTitle.text = model.title;
        }
    }
    // 更多
    UIButton *buttonMore = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonMore.frame = CGRectMake(lineView.bounds.size.width * 0.85, lineView.bounds.size.height * 0.2, lineView.bounds.size.width * 0.15, lineView.bounds.size.height * 0.6);
    [buttonMore setTitle:@"更多 〉" forState:UIControlStateNormal];
    [buttonMore setTitle:@"更多 〉" forState:UIControlStateHighlighted];
    [buttonMore setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [buttonMore setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [lineView addSubview:buttonMore];

    [buttonMore addTarget:self action:@selector(moreButtonAction:) forControlEvents:UIControlEventTouchUpInside];

    return view;
    
}

#pragma mark - 分区的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _arrFamousTitle.count + _arrNormalTitle.count;
    
}
#pragma mark - Cell的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) {
        XQ_AnchorModel *model = _arrFamousTitle[3];
        return model.list.count;
    }
    return 1;
}
#pragma mark - Cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < 3) {
        return 450;
    }
   else if (indexPath.section == 3) {
        return 640 / 6;
    }
   else {
       return 210;
   }
}
#pragma mark - Cell赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 前三分区Cell
    if (indexPath.section < 3) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"famousThirdCell"];
        cell.backgroundColor = [UIColor redColor];
        
        return cell;
        
    }
    // 第四分区Cell
    if (indexPath.section == 3) {
        XQ_AnchorSingerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"famousOfSingerCell"];
        cell.backgroundColor = COLOR;
        
        return cell;
        
    }
    // 后面分区Cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"normalCell"];
    cell.backgroundColor = [UIColor yellowColor];
    
    if (_arrNormal.count != 0) {
        
    }
    
    return cell;
    
}


#pragma mark - 跳转界面点击事件
- (void)moreButtonAction:(UIButton *)buttonMore {
    [buttonMore setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [buttonMore setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    NSLog(@"主播更多");
}


#pragma mark - 主播数据
- (void)getDataFromJsonOfAnchor {
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v1/anchor/recommend?device=iPhone&version=5.4.33";
    [XQNetTool GET:string Body:nil HeaderFile:nil Response:XQJSON Success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        // 主播前四个分区数据
        NSMutableArray *arrFamous = dic[@"famous"];
        for (NSDictionary *dic in arrFamous) {
            XQ_AnchorModel *model = [[XQ_AnchorModel alloc] initWithDic:dic];
            [_arrFamousTitle addObject:model];
            NSMutableArray *arrFamousList = dic[@"list"];
            for (NSDictionary *dic in arrFamousList) {
                XQ_AnchorModel *model = [[XQ_AnchorModel alloc] initWithDic:dic];
                [_arrFamous addObject:model];
            }
        }
        // 主播后面分区数据
        NSMutableArray *arrNormal = dic[@"normal"];
        for (NSDictionary *dic in arrNormal) {
            XQ_AnchorModel *model = [[XQ_AnchorModel alloc] initWithDic:dic];
            [_arrNormalTitle addObject:model];
            NSMutableArray *arrNormalList = dic[@"list"];
            for (NSDictionary *dic in arrNormalList) {
                XQ_AnchorModel *model = [[XQ_AnchorModel alloc] initWithDic:dic];
                [_arrNormal addObject:model];
            }
        }

        [_tableView reloadData];
        
    } Failure:^(NSError *error) {
        
        
        
    }];
    
    
}


@end
