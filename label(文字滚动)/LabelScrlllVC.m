//
//  LabelScrlllVC.m
//  testbutton
//
//  Created by lmcqc on 2020/10/22.
//  Copyright © 2020 大碗豆. All rights reserved.
//

#import "LabelScrlllVC.h"
#import "TXScrollLabelView.h"

@interface LabelScrlllVC ()<TXScrollLabelViewDelegate>
@property (assign, nonatomic) IBInspectable BOOL isArray;
@end

@implementation LabelScrlllVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //label文字滚动
    self.isArray = YES;
    [self setViewInfos];
    [self setSubviews];
}

- (void)setViewInfos {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"TXScrollLabelView";
}

- (void)setSubviews {
    
    [self addWith:TXScrollLabelViewTypeLeftRight velocity:1 isArray:_isArray];
    
    [self addWith:TXScrollLabelViewTypeUpDown velocity:2 isArray:_isArray];
    
    [self addWith:TXScrollLabelViewTypeFlipRepeat velocity:2 isArray:_isArray];
    
    [self addWith:TXScrollLabelViewTypeFlipNoRepeat velocity:2 isArray:_isArray];
}

- (void)addWith:(TXScrollLabelViewType)type velocity:(CGFloat)velocity isArray:(BOOL)isArray {
    /** Step1: 滚动文字 */
    
    NSString *scrollTitle = @"如果在";
    
    NSArray *scrollTexts = @[@"If you need help or ask general question,",
                             @"just @tingxins in Weibo or Twitter, ofcourse, you can follow me. Welcome access to my blog.",
                             @"If you found a bug, just open an issue.",
                             @"If you have a feature request, just open an issue.",
                             @"If you want to contribute, fork this repository, and then submit a pull request.",
                             @"Blog : https://tingxins.com",
                             @"简书 ：http://www.jianshu.com/u/5141561e4d59",
                             @"GitHub : https://github.com/tingxins",
                             @"Weibo : http://weibo.com/tingxins",
                             @"Twitter : http://twitter.com/tingxins"];
    
    /** Step2: 创建 ScrollLabelView */
    TXScrollLabelView *scrollLabelView = nil;
    if (isArray) {
        scrollLabelView = [TXScrollLabelView scrollWithTextArray:scrollTexts type:type velocity:velocity options:UIViewAnimationOptionCurveEaseInOut inset:UIEdgeInsetsZero];
    }else {
        scrollLabelView = [TXScrollLabelView scrollWithTitle:scrollTitle type:type velocity:velocity options:UIViewAnimationOptionCurveEaseInOut];
    }
    
    /** Step3: 设置代理进行回调 */
    scrollLabelView.scrollLabelViewDelegate = self;
    
    /** Step4: 布局(Required) */
    scrollLabelView.frame = CGRectMake(50, 100 * (type + 0.7), 300, 30);
    
    [self.view addSubview:scrollLabelView];
    
    //偏好(Optional), Preference,if you want.
    scrollLabelView.tx_centerX  = [UIScreen mainScreen].bounds.size.width * 0.5;
    scrollLabelView.scrollInset = UIEdgeInsetsMake(0, 10 , 0, 10);
    scrollLabelView.scrollSpace = 10;
    scrollLabelView.font = [UIFont systemFontOfSize:15];
    scrollLabelView.textAlignment = NSTextAlignmentCenter;
    scrollLabelView.backgroundColor = [UIColor blackColor];
    scrollLabelView.layer.cornerRadius = 5;
    
    /** Step5: 开始滚动(Start scrolling!) */
    [scrollLabelView beginScrolling];
}

- (void)scrollLabelView:(TXScrollLabelView *)scrollLabelView didClickWithText:(NSString *)text atIndex:(NSInteger)index{
    NSLog(@"%@--%ld",text, index);
}

@end
