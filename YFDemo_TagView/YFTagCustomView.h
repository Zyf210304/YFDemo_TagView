//
//  YFTagCustomView.h
//  YFDemo_TagView
//
//  Created by 亚飞 on 2018/4/12.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFTagCustomView : UIView

@property (nonatomic ,assign) CGFloat viewH;

@property (nonatomic ,strong) NSArray *tagsArray;

@property (nonatomic ,copy) void(^tapTagIndex)(NSString *tagName);


/**
 初始化带有title 的taglist
 */
- (instancetype)initWithTagsArray:(NSArray *)tagsArray;


/**
 移除所有的tag
 */
- (void)removeAllTags;


@end
