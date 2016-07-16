//
//  UIView+Adddtion.h
//  UIButtonAnimation
//
//  Created by whq on 16/7/16.
//  Copyright © 2016年 DaCaiXie. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PROPERTY_DECLEAR_FLOAT(P_NAME) @property (assign ,nonatomic)CGFloat P_NAME
#define PROPERTY_DECLEAR_RECT(P_NAME) @property (assign,nonatomic)CGRect P_NAME
#define PROPERTY_DECLEAR_SIZE(P_NAME) @property (assign,nonatomic)CGSize P_NAME
#define PROPERTY_DECLEAR_POINT(P_NAME) @property (assign,nonatomic)CGPoint P_NAME

@interface UIView (Adddtion)

PROPERTY_DECLEAR_FLOAT(ntm_Left);
PROPERTY_DECLEAR_FLOAT(ntm_Right);
PROPERTY_DECLEAR_FLOAT(ntm_Top);
PROPERTY_DECLEAR_FLOAT(ntm_Bottom);

PROPERTY_DECLEAR_FLOAT(ntm_CenterX);
PROPERTY_DECLEAR_FLOAT(ntm_CenterY);
PROPERTY_DECLEAR_POINT(ntm_Center);
PROPERTY_DECLEAR_FLOAT(ntm_BoundsCenterX);
PROPERTY_DECLEAR_FLOAT(ntm_BoundsCenterY);

PROPERTY_DECLEAR_SIZE(ntm_Size);
PROPERTY_DECLEAR_FLOAT(ntm_Width);
PROPERTY_DECLEAR_FLOAT(ntm_Height);
PROPERTY_DECLEAR_RECT(ntm_Frame);


#pragma mark - Property
- (void)setNtm_Left:(CGFloat)ntm_Left;
- (void)setNtm_Right:(CGFloat)ntm_Right;
- (void)setNtm_Bottom:(CGFloat)ntm_Bottom;
- (void)setNtm_Top:(CGFloat)ntm_Top;

- (void)setNtm_CenterX:(CGFloat)ntm_CenterX;
- (void)setNtm_CenterY:(CGFloat)ntm_CenterY;
- (void)setNtm_Center:(CGPoint)ntm_Center;

- (void)setNtm_Width:(CGFloat)ntm_Width;
- (void)setNtm_Height:(CGFloat)ntm_Height;
- (void)setNtm_Size:(CGSize)ntm_Size;
- (void)setNtm_Frame:(CGRect)ntm_Frame;

#pragma mark - CornerRadius


@end
