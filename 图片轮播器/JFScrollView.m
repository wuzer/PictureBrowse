//
//  JFScrollView.m
//  图片轮播器
//
//  Created by Jefferson on 15/9/22.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFScrollView.h"

@interface JFScrollView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation JFScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = false;
    [self loadImage];
    [self addPageControl];
    
    self.delegate = self;
    return self;
}

// 添加图片
- (void)loadImage {
    
    NSArray *images = @[@"bbqner", @"zghsy", @"mmgw", @"jxtz", @"ertsd"];
    
    CGFloat height = 200; //[UIScreen mainScreen].bounds.size.height;
    CGFloat width = [UIScreen mainScreen].bounds.size.width ;
    // 添加图片
    for (int i=0; i < images.count; ++i) {
        self.contentSize = CGSizeMake(width * i + width, height);
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(width * i , 0, width, height)];
        imageView.image = [UIImage imageNamed:images[i]];

        [self addSubview:imageView];
    }
}

// 添加pageControl
- (void)addPageControl {
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(280, 170, 80, 30);
    //    pageControl.backgroundColor = [UIColor redColor];
    
    pageControl.numberOfPages = 5;
    
    [self addSubview:pageControl];
//    [self bringSubviewToFront:pageControl];
    
}


@end
