//
//  NTmarqueeBGView.m
//  UIButtonAnimation
//
//  Created by whq on 16/7/15.
//  Copyright © 2016年 DaCaiXie. All rights reserved.
//

#import "NTmarqueeBGView.h"
//#import "UIView+Adddtion.h"
#import "Masonry.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
@interface NTmarqueeBGView ()

@property (strong ,nonatomic)UIView * firstView;
@property (strong ,nonatomic)UIView * secondView;
@property (strong ,nonatomic)UIView * marqueePlayGround;
@property (strong ,nonatomic)UIButton * btn;

@property (copy ,nonatomic)ButtonClickedHandler buttonClickedHandler;

@end
@implementation NTmarqueeBGView
{
    NSTimer * _timer;
    CGFloat _centerX;
    NSArray *_colorArr;
    CGFloat _rgbR;
    CGFloat _rgbG;
    CGFloat _rgbB;
}

+ (instancetype)marqueeView:(CGRect)rect title:(NSString *)title itemWidth:(CGFloat) itemWidth itemHeight:(CGFloat)itemHeight btnHandler:(ButtonClickedHandler)btnHandler
{
    NTmarqueeBGView * marqueeView = [[NTmarqueeBGView alloc]initWithFrame:rect];
    marqueeView.itemHeight = itemHeight;
    marqueeView.itemWidth = itemWidth;
    marqueeView.buttonClickedHandler = btnHandler;
    marqueeView.title = title;
    
    [marqueeView addUI];
    [marqueeView configuration];
    
    return marqueeView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        /*
        [self addUI];
        [self configuration];
        [self animateView];
         */
        
    }
    return self;
}
- (void)addUI
{
    _centerX = CGRectGetMidX(self.frame);
    
    self.marqueePlayGround = [UIView new];
    //self.marqueePlayGround.backgroundColor = [UIColor lightGrayColor];
    self.marqueePlayGround.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.marqueePlayGround];
    
    [self.marqueePlayGround mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.height.equalTo(@(self.itemHeight));
    }];
    
    self.firstView = [UIView new];
    self.firstView.backgroundColor = [UIColor lightGrayColor];
    [self.marqueePlayGround addSubview:self.firstView];
    
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.itemWidth, self.itemHeight));
        //make.leading.equalTo(self.marquePlayground);
        make.right.equalTo(self.marqueePlayGround.mas_centerX);
        make.top.equalTo(self.marqueePlayGround.mas_top);
        
    }];
    
    self.secondView = [UIView new];
    self.secondView.backgroundColor = [UIColor lightGrayColor];
    [self.marqueePlayGround addSubview:self.secondView];
    [self.secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.firstView);
        make.top.equalTo(self.marqueePlayGround.mas_top);
        make.left.equalTo(self.marqueePlayGround.mas_centerX);
    }];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn setTitle:_title forState:UIControlStateNormal];
    //51A5DE
    [self.btn setBackgroundColor:UIColorFromRGB(0x51A5DE)];
    [self addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(self.itemHeight, 0, 0, 0));
    }];
    
}

-(void)configuration
{
    _timer = [NSTimer timerWithTimeInterval:0.01f target:self selector:@selector(moveIndicator) userInfo:nil  repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    [self.btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Action

- (void)animateView
{
    self.marqueePlayGround.hidden = NO;
    [_timer setFireDate:[NSDate distantPast]];
}

- (void)stopAnimateView
{
    self.marqueePlayGround.hidden = YES;
    [_timer setFireDate:[NSDate distantFuture]];
}

static CGFloat stepWidth = 1.f;

- (void)moveIndicator
{
    _rgbB = arc4random() % 255;
    _rgbG = arc4random() % 255;
    _rgbR = arc4random() % 255;
    //self.firstView.backgroundColor = RGBCOLOR(_rgbR, _rgbG, _rgbB);
    
    _rgbR = 255 - _rgbR;
    _rgbG = 255 - _rgbG;
    _rgbB = 255 - _rgbB;
    
    //self.secondView.backgroundColor = RGBCOLOR(_rgbR, _rgbG, _rgbB);
    
    CGRect rect1 = self.firstView.frame;
    rect1.origin.x -= stepWidth;
    self.firstView.frame = rect1;
    if (CGRectGetMinX(self.firstView.frame) <= 0)
    {
        rect1.origin.x = _centerX - rect1.size.width;
        self.firstView.frame = rect1;
    }
    
    CGRect rect2 = self.secondView.frame;
    rect2.origin.x += stepWidth;
    self.secondView.frame = rect2;
    if (CGRectGetMaxX(self.secondView.frame) >= CGRectGetWidth(self.frame))
    {
        rect2.origin.x = _centerX;
        self.secondView.frame = rect2;
    }
}
- (void)btnClicked:(UIButton *)sender
{
    self.buttonClickedHandler ? self.buttonClickedHandler (sender): nil;
}
#pragma mark - Setter

- (void)setTitle:(NSString *)title
{
    _title = title;
    [self.btn setTitle:_title forState:UIControlStateNormal];
}
- (void)setItemHeight:(CGFloat)itemHeight
{
    _itemHeight = itemHeight <= 0 ? 5 :itemHeight;
}
- (void)setItemWidth:(CGFloat)itemWidth
{
    _itemWidth = itemWidth <= 0 ? 10 :itemWidth;
}


@end
