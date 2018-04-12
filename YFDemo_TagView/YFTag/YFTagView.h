//
//  YFTagView.h
//  YFDemo_TagView
//
//  Created by 亚飞 on 2018/4/12.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTag.h"
#import "YFTagButton.h"


@interface YFTagView : UIView

@property (assign, nonatomic) UIEdgeInsets padding;
@property (assign, nonatomic) CGFloat lineSpacing;
@property (assign, nonatomic) CGFloat interitemSpacing;
@property (assign, nonatomic) CGFloat preferredMaxLayoutWidth;
@property (assign, nonatomic) CGFloat regularWidth; //!< 固定宽度
@property (nonatomic,assign ) CGFloat regularHeight; //!< 固定高度
@property (assign, nonatomic) BOOL singleLine;
@property (copy, nonatomic, nullable) void (^didTapTagAtIndex)(NSUInteger index);

- (void)addTag: (nonnull YFTag *)tag;
- (void)insertTag: (nonnull YFTag *)tag atIndex:(NSUInteger)index;
- (void)removeTag: (nonnull YFTag *)tag;
- (void)removeTagAtIndex: (NSUInteger)index;
- (void)removeAllTags;


@end
