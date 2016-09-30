//
//  XQ_AudioPlayVC.m
//  ListeningFM
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "XQ_AudioPlayVC.h"
#import "AppDelegate.h"

@interface XQ_AudioPlayVC ()

@end

@implementation XQ_AudioPlayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createButton];
    
}

- (void)createButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonAction:(UIButton *)button {
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    [app.tabBar showCenterViewController:NO animated:YES];
    
}






@end
