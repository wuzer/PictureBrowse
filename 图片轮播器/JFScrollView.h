//
//  JFScrollView.h
//  图片轮播器
//
//  Created by Jefferson on 15/9/22.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFScrollView : UIScrollView

@property (nonatomic, assign) NSInteger page;

@property(copy,nonatomic) void(^pagBlock)(NSInteger page);

@end
