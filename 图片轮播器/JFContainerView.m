//
//  JFContainerView.m
//  图片轮播器
//
//  Created by Jefferson on 15/9/22.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFContainerView.h"
#import "JFScrollView.h"

@interface JFContainerView ()

@property (nonatomic, strong) JFScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation JFContainerView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview];
    [self nextImage];
    return self;
}

- (void)addSubview {
    
    // 添加scrollView
    JFScrollView *scrollView = [[JFScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];

    [scrollView setPagBlock:^(NSInteger page) {
        NSLog(@"%zd",page);
        self.pageControl.currentPage = page;
    }];
    self.scrollView = scrollView;
    [self addSubview:scrollView];
    
    // 添加pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    self.pageControl = pageControl;
    pageControl.currentPageIndicatorTintColor = [UIColor yellowColor];
    pageControl.frame = CGRectMake(280, 170, 80, 30);
    //    pageControl.backgroundColor = [UIColor redColor];

    pageControl.numberOfPages = 5;
    
    [self addSubview:pageControl];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 220, 80, 80)];
    button.backgroundColor = [UIColor redColor];
    [self addSubview:button];
    [button addTarget:self action:@selector(nextImage) forControlEvents:UIControlEventTouchUpInside];
}

- (void)nextImage {
    
    NSInteger page = self.pageControl.currentPage;
    
    CGFloat offSetX = self.frame.size.width * page;
    
    if (page == 4) {
        page = 0;
    } else {
        page ++;
        NSLog(@"%zd",page);
    }
    
    NSLog(@"%f",self.scrollView.frame.origin.y);
    
    [UIView animateWithDuration:1 animations:^{

        self.scrollView.contentOffset = CGPointMake(offSetX, 0);
    }];
}


@end
