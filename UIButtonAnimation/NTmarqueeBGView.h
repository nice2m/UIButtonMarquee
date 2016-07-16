//
//  NTmarqueeBGView.h
//  UIButtonAnimation
//
//  Created by whq on 16/7/15.
//  Copyright © 2016年 DaCaiXie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClickedHandler)(UIButton * sender);

@interface NTmarqueeBGView : UIView

@property (copy ,nonatomic)NSString * title;

@property (assign ,nonatomic)CGFloat itemHeight;

@property (assign ,nonatomic)CGFloat itemWidth;

+ (instancetype)marqueeView:(CGRect)rect title:(NSString *)title itemWidth:(CGFloat)itemWidth itemHeight:(CGFloat)itemHeight btnHandler:(ButtonClickedHandler)btnHandler;

- (void)animateView;

- (void)stopAnimateView;

@end
