//
//  WYAlertHUD.m
//  WYProgressHUD
//
//  Created by wyman on 2017/12/22.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "WYAlertHUD.h"
#import "Masonry.h"
@interface WYAlertHUD()

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,strong)NSArray *alertTitles;
@property(nonatomic,copy)completedHandle handle;

@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *messageLb;
@end
@implementation WYAlertHUD
+(void)show:(NSString *)title message:(NSString *)message alertTitles:(NSArray *)titles handle:(completedHandle)handle{
    
    WYAlertHUD *hud = [[WYAlertHUD alloc]initWithFrame:[UIScreen mainScreen].bounds title:title message:message alertTitles:titles handle:handle];
    
    [hud show];
}

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)titles message:(NSString *)message alertTitles:(NSArray *)alertTitles handle:(completedHandle)handle{
    _title = titles;
    _message = message;
    _alertTitles = alertTitles;
    _handle = handle;
    if (self = [super initWithFrame:frame]) {
        [self loadSubViews];
    }
    return self;
}

# pragma mark - Event
-(void)btnClicked:(UIButton *)btn{
    [UIView animateWithDuration:0.3f animations:^{
        _bgView.transform = CGAffineTransformMakeScale(1.21f, 1.21f);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        _bgView.transform = CGAffineTransformMakeScale(1, 1);

        [self removeFromSuperview];
    }];
    if (self.handle) {
        self.handle(btn.tag);
    }
}

-(void)show{
    [mainWindow() addSubview:self];
    _bgView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:0.25f animations:^{
        _bgView.transform = CGAffineTransformMakeScale(1, 1);
        [self layoutIfNeeded];
        [UIView commitAnimations];
    } completion:^(BOOL finished) {

    }];
}

# pragma mark - UI
-(void)loadSubViews{
    
    self.backgroundColor = [[UIColor colorWithRed:134/255.0 green:134/255.0 blue:134/255.0 alpha:1] colorWithAlphaComponent:0.4];
    _bgView = [[UIView alloc]init];
    _bgView.backgroundColor = [UIColor whiteColor];

    _titleLb = [[UILabel alloc]init];
    _titleLb.font = [UIFont systemFontOfSize:20];
    _titleLb.text =  _title.length==0 ? @"通知" :_title;
    
    _messageLb = [[UILabel alloc]init];
    _messageLb.font = [UIFont systemFontOfSize:16];
    _messageLb.textAlignment = NSTextAlignmentCenter;
    _messageLb.text =   _message.length==0? @"通知内容":_message;
    _messageLb.numberOfLines = 0;
     UIColor *DDthemeColor = [UIColor redColor];
    NSInteger alertBtnCount = _alertTitles.count;
    NSMutableArray *btns = [NSMutableArray array];
    for (int i=0; i<alertBtnCount; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:DDthemeColor];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitle:_alertTitles[i] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [btns addObject:btn];
    }
    
    [self addSubview:_bgView];
    [_bgView addSubview:_titleLb];
    [_bgView addSubview:_messageLb];
    for (UIButton *btn in btns) {
        [_bgView addSubview:btn];
    }
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(264, 169));
        make.center.equalTo(self);
//        make.bottom.equalTo(self);
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgView);
        make.top.equalTo(_bgView).offset(19);
    }];
    
    [_messageLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_titleLb);
        make.top.equalTo(_titleLb.mas_bottom).offset(11);
        make.left.equalTo(_bgView).offset(15);
        make.right.equalTo(_bgView).offset(-15);
    }];
    
    CGSize btnSize = CGSizeMake(110, 30);
    if (btns.count == 1) {
        for (UIButton *btn in btns) {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(_bgView.mas_bottom).offset(-23);
                make.size.mas_equalTo(btnSize);
                make.centerX.equalTo(_bgView);
            }];
        }
    }
    
    if (btns.count == 2) {
        for (UIButton *btn in btns) {
            if (btn.tag == 0) {
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(_bgView.mas_bottom).offset(-23);
                    make.size.mas_equalTo(btnSize);
                    make.left.equalTo(_bgView).offset(15);
                }];
            }else{
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(_bgView.mas_bottom).offset(-23);
                    make.size.mas_equalTo(btnSize);
                    make.right.equalTo(_bgView).offset(-15);
                }];
            }
        }
    }
    
}

@end
