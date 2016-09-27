//
//  XQ_BaseViewController.m
//  ListeningFM
//
//  Created by apple on 16/9/20.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_BaseViewController.h"
#import "XQNetTool.h"

@interface XQ_BaseViewController ()

@end

@implementation XQ_BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
}



@end
