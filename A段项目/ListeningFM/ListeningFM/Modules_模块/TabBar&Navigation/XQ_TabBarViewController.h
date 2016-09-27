//
//  XQ_TabBarViewController.h
//  ListeningFM
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//  

#import <UIKit/UIKit.h>

@protocol XQ_TabBarViewControllerDelegate <NSObject>

@optional
-(void)XQ_selectedViewController:(UIViewController *)viewController;

@end


@interface XQ_TabBarViewController : UITabBarController

@property (nonatomic, assign) NSInteger selectedItem;

/** 是否显示中间按钮，默认为NO */
@property (nonatomic, assign) BOOL showCenterItem;

/** 中间按钮的图片 */
@property (nonatomic, strong) UIImage * centerItemImage;

/** 中间按钮控制的试图控制器 */
@property (nonatomic, strong) UIViewController * XQ_centerViewController;

/** 文字颜色 */
@property (nonatomic, strong) UIColor * textColor;

@property (nonatomic, weak) id<XQ_TabBarViewControllerDelegate>XQDelegate;


/**
 *  指定item设置badgeValue
 */
-(void)tabBarBadgeValue:(NSUInteger)value item:(NSInteger)index;

/**
 *  隐藏或显示TabBar
 */
-(void)XQTabBarHidden:(BOOL)hidden animated:(BOOL)animated;

/**
 *  隐藏或显示中间试图控制器
 */
-(void)showCenterViewController:(BOOL)show animated:(BOOL)animated;

- (id)initWithTabBarSelectedImages:(NSMutableArray *)selected
                      normalImages:(NSMutableArray *)normal
                            titles:(NSMutableArray *)titles;

@end

@interface XQButton : UIButton

@property (nonatomic, assign) NSUInteger badgeValue;

+ (instancetype)XQ_shareButton;

@end


