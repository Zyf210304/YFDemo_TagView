//
//  YFTagButton.h
//  YFDemo_TagView
//
//  Created by 亚飞 on 2018/4/12.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFTag;

@interface YFTagButton : UIButton

+ (nonnull instancetype)buttonWithTag: (nonnull YFTag *)tag;

@end
