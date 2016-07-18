//
//  ViewController.m
//  UIButtonAnimation
//
//  Created by whq on 16/7/15.
//  Copyright © 2016年 DaCaiXie. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Adddtion.h"

#import "NTmarqueeBGView.h"

@interface ViewController ()

@property (strong ,nonatomic)NTmarqueeBGView * marqueeiew;

@property (assign ,nonatomic)BOOL marqueeOn;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.marqueeOn = YES;
    // Do any additional setup after loading the view, typically from a nib.
    _marqueeiew = [NTmarqueeBGView marqueeView:CGRectMake(0, 200, self.view.frame.size.width, 49) title:@"进行中" itemWidth:16.f itemHeight:4.f btnHandler:^(UIButton *sender) {
        if (self.marqueeOn) {
            [_marqueeiew stopAnimateView];
            _marqueeiew.title = @"结束";
            _marqueeOn = NO;
        }else{
            [_marqueeiew animateView];
            _marqueeiew.title = @"进行中";
            _marqueeOn = YES;
        }
    }];
    //_marqueeiew.frame = ;
    [self.view addSubview:_marqueeiew];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
