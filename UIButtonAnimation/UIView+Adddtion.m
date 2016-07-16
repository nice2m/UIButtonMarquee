//
//  UIView+Adddtion.m
//  UIButtonAnimation
//
//  Created by whq on 16/7/16.
//  Copyright © 2016年 DaCaiXie. All rights reserved.
//

#import "UIView+Adddtion.h"

@implementation UIView (Adddtion)

@dynamic ntm_BoundsCenterX;
@dynamic ntm_BoundsCenterY;

#pragma mark -

-(CGFloat)ntm_Top
{
    return CGRectGetMinY(self.frame);
}

- (void)setNtm_Top:(CGFloat)ntm_Top
{
    CGRect rt = self.frame;
    rt.origin.y = ntm_Top;
    self.frame = rt;
}

- (CGFloat)ntm_Bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setNtm_Bottom:(CGFloat)ntm_Bottom
{
    CGRect rt = self.frame;
    rt.origin.y = ntm_Bottom - CGRectGetHeight(rt);
    
    self.frame = rt;
}

- (CGFloat)ntm_Left
{
    return CGRectGetMinX(self.frame);
}

- (void)setNtm_Left:(CGFloat)ntm_Left
{
    CGRect rt = self.frame;
    rt.origin.x = ntm_Left;
    
    self.frame = rt;
}

- (CGFloat)ntm_Right
{
    return CGRectGetMaxX(self.frame);
}

-(void)setNtm_Right:(CGFloat)ntm_Right
{
    CGRect rt = self.frame;
    rt.origin.x = ntm_Right - CGRectGetWidth(rt);
    self.frame = rt;
}

- (CGFloat)ntm_Width
{
    return CGRectGetWidth(self.frame);
}

- (void)setNtm_Width:(CGFloat)ntm_Width
{
    CGRect rt =self.frame;
    rt.size.width = ntm_Width;
    
    self.frame = rt;
}

- (CGFloat)ntm_Height
{
    return CGRectGetHeight(self.frame);
}

- (void)setNtm_Height:(CGFloat)ntm_Height
{
    CGRect rt = self.frame;
    rt.size.height = ntm_Height;
    
    self.frame = rt;
}

- (CGSize)ntm_Size
{
    return CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

- (void)setNtm_Size:(CGSize)ntm_Size
{
    CGRect rt = self.frame;
    rt.size = ntm_Size;
    
    self.frame = rt;
    
}

- (CGRect)ntm_Frame
{
    return self.frame;
}

- (void)setNtm_Frame:(CGRect)ntm_Frame
{
    self.frame = ntm_Frame;
}

- (CGFloat)ntm_CenterX
{
    return CGRectGetMidX(self.frame);
}

- (void)setNtm_CenterX:(CGFloat)ntm_CenterX
{
    CGPoint pt = self.center;
    pt.x = ntm_CenterX;
    
    self.center = pt;
}

- (CGFloat)ntm_CenterY
{
    return CGRectGetMidY(self.frame);
}

- (void)setNtm_CenterY:(CGFloat)ntm_CenterY
{
    CGPoint pt = self.center;
    pt.y = ntm_CenterY;
    
    self.center = pt;
}

- (void)setNtm_Center:(CGPoint)ntm_Center
{
    self.center = ntm_Center;
}

- (CGPoint)ntm_Center
{
    return self.center;
}

-(CGFloat)ntm_BoundsCenterX
{
    return CGRectGetMidX(self.bounds);
}

- (CGFloat)ntm_BoundsCenterY
{
    return CGRectGetMidY(self.bounds);
}

@end
