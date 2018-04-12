//
//  ViewController.m
//  YFDemo_TagView
//
//  Created by 亚飞 on 2018/4/12.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import "ViewController.h"
#import "YFTagCustomView.h"

@interface ViewController ()

@property (strong, nonatomic) YFTagCustomView *customView;

@property (nonatomic, strong) UILabel *textLbl;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUI];
}

- (void)initUI {

    self.textLbl = [[UILabel alloc] init];
    NSArray *tagsArray = @[@"1231123", @"8e794987",@"123123", @"8794987",@"123123", @"8794qweqwe987",@"123123", @"987",@"123123", @"814987",@"2123", @"8794987",@"123q123", @"8794987",];
    self.textLbl.text = tagsArray[0];

    self.customView = [[YFTagCustomView alloc] initWithTagsArray:tagsArray];
    self.customView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, self.customView.viewH);

    __weak typeof(self) weakSelf = self;
    self.customView.tapTagIndex = ^(NSString *tagName) {
        NSLog(@"%@", tagName);
        weakSelf.textLbl.text = tagName;
    };
    self.customView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.customView];

    self.textLbl.frame = CGRectMake(0, CGRectGetMaxY(self.customView.frame) + 20, [UIScreen mainScreen].bounds.size.width, 30);
    self.textLbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.textLbl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
