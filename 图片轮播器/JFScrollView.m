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
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation JFScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];

    [self setScrollView];
    [self loadImage];
    return self;
}

// 设置scrollView
- (void)setScrollView {
    
    self.delegate = self;
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = false;
    self.contentSize = CGSizeMake(self.bounds.size.width * 5, 200);
    self.bounces = false;
}

// 添加图片
- (void)loadImage {
    
    NSArray *images = @[@"bbqner", @"zghsy", @"mmgw", @"jxtz", @"ertsd"];
    
//    CGFloat height = 200; //[UIScreen mainScreen].bounds.size.height;
//    CGFloat width = [UIScreen mainScreen].bounds.size.width ;
    CGRect imageViewFrame = self.bounds;
    
    // 添加图片
    for (int i=0; i < images.count; ++i) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:images[i]];
        
        CGFloat imagex = imageViewFrame.size.width * i;
        imageViewFrame.origin.x = imagex;
        imageView.frame = imageViewFrame;
        
        [self addSubview:imageView];
    }
}

#pragma mark - 代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offSetX = self.contentOffset.x;
    
    NSInteger page = round(offSetX / self.bounds.size.width);
    
    if (self.pagBlock) {
        self.pagBlock(page);
    }
//    NSLog(@"%zd",self.page);
    
}



@end
