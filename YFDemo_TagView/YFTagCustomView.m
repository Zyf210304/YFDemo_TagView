//
//  YFTagCustomView.m
//  YFDemo_TagView
//
//  Created by 亚飞 on 2018/4/12.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import "YFTagCustomView.h"
#import "YFTagView.h"

@interface YFTagCustomView()

@property (strong, nonatomic) YFTagView *tagView;

@end


@implementation YFTagCustomView

- (instancetype)initWithTagsArray:(NSArray *)tagsArray{

    if (self = [super init]) {

        self.tagsArray = tagsArray;
        //initUI
        [self initUI];
    }
    return self;
}


- (void)initUI {
    [self.tagView removeAllTags];
    //taglist
    self.tagView = [[YFTagView alloc] init];
    // 整个tagView对应其SuperView的上左下右距离
    self.tagView.padding = UIEdgeInsetsMake(0, 15, 0, 15);
    // 上下行之间的距离
    self.tagView.lineSpacing = 10;
    // item之间的距离
    self.tagView.interitemSpacing = 20;
    // 最大宽度
    self.tagView.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width;
    //固定高度
    //    self.tagView.regularHeight = 30;

    NSArray *tagsArray = @[@"1231123", @"8e794987",@"123123", @"8794987",@"123123", @"8794qweqwe987",@"123123", @"987",@"123123", @"814987",@"2123", @"8794987",@"123q123", @"8794987",];
    [tagsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        // 初始化标签
        YFTag *tag = [[YFTag alloc] initWithText:tagsArray[idx]];
        // 标签相对于自己容器的上左下右的距离
        tag.padding = UIEdgeInsetsMake(5, 5, 5, 5);
        // 弧度
        tag.cornerRadius = 4.f;
        // 字体
        tag.font = [UIFont systemFontOfSize:14];
        // 边框宽度
        tag.borderWidth = 1.f;
        // 边框颜色
        tag.borderColor = [UIColor lightGrayColor];
        // 字体颜色
        tag.textColor = [UIColor orangeColor];
        //选中背景色
        tag.highlightedBgColor = [UIColor redColor];
        // 是否可点击
        tag.enable = YES;
        // 加入到tagView
        [self.tagView addTag:tag];

    }];

    __weak typeof(self) weakSelf = self;
    self.tagView.didTapTagAtIndex = ^(NSUInteger idx){

        weakSelf.tapTagIndex(weakSelf.tagsArray[idx]);
    };

    // 获取刚才加入所有tag之后的内在高度
    CGFloat tagHeight = self.tagView.intrinsicContentSize.height;
    self.tagView.frame = CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, tagHeight);
    [self.tagView layoutSubviews];
    [self addSubview:self.tagView];

    self.viewH = tagHeight?(CGRectGetMaxY(self.tagView.frame) + 20):0;
}

- (void)removeAllTags{

    [self.tagView removeAllTags];
    self.viewH = 0;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
