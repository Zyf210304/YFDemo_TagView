//
//  YFTagButton.m
//  YFDemo_TagView
//
//  Created by 亚飞 on 2018/4/12.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import "YFTagButton.h"
#import "YFTag.h"


@implementation YFTagButton

+ (instancetype)buttonWithTag: (YFTag *)tag {
    YFTagButton *btn = [super buttonWithType:UIButtonTypeCustom];

    if (tag.attributedText) {
        [btn setAttributedTitle: tag.attributedText forState: UIControlStateNormal];
    } else {
        [btn setTitle: tag.text forState:UIControlStateNormal];
        [btn setTitleColor: tag.textColor forState: UIControlStateNormal];
        btn.titleLabel.font = tag.font ?: [UIFont systemFontOfSize: tag.fontSize];
    }

    btn.backgroundColor = tag.bgColor;
    btn.contentEdgeInsets = tag.padding;
    btn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;

    if (tag.bgImg) {
        [btn setBackgroundImage: tag.bgImg forState: UIControlStateNormal];
    }

    if (tag.borderColor) {
        btn.layer.borderColor = tag.borderColor.CGColor;
    }

    if (tag.borderWidth) {
        btn.layer.borderWidth = tag.borderWidth;
    }

    btn.userInteractionEnabled = tag.enable;
    if (tag.enable) {
        UIColor *highlightedBgColor = tag.highlightedBgColor ?: [self darkerColor:btn.backgroundColor];
        [btn setBackgroundImage:[self imageWithColor:highlightedBgColor] forState:UIControlStateHighlighted];
    }

    btn.layer.cornerRadius = tag.cornerRadius;
    btn.layer.masksToBounds = YES;

    return btn;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

+ (UIColor *)darkerColor:(UIColor *)color {
    CGFloat h, s, b, a;
    if ([color getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:b * 0.85
                               alpha:a];
    return color;
}

@end
