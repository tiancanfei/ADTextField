//
//  ADTextField.m
//  courier
//
//  Created by andehang on 2017/9/15.
//  Copyright © 2017年 jinlinbao. All rights reserved.
//

#import "ADTextField.h"

#define kADTextFieldDismissKeyboardNotification @"kADTextFieldDismissKeyboardNotification"

@interface ADTextField()<UITextFieldDelegate>

@end

@implementation ADTextField
{
    CGFloat _keyboardHeight;
}

#pragma mark - 生命周期

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUp];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
     NSLog(@"ADTextField销毁");
}

#pragma mark - 私有方法

#pragma mark 给多个ADTextField对象设置键盘回调和return按钮回调

+ (void)setTextFields:(NSArray<ADTextField *> *)textFields keyboardWillShowCallBackBlock:(void(^)(CGFloat keyboardHeight))keyboardWillShowCallBackBlock keyboardWillHideCallBackBlock:(void(^)(CGFloat keyboardHeight))keyboardWillHideCallBackBlock returnCallBacBlock:(void(^)())returnCallBacBlock
{
    [textFields enumerateObjectsUsingBlock:^(ADTextField * _Nonnull textField, NSUInteger idx, BOOL * _Nonnull stop) {
        [textField setKeyboardWillShowCallBackBlock:keyboardWillShowCallBackBlock keyboardWillHideCallBackBlock:keyboardWillHideCallBackBlock returnCallBacBlock:returnCallBacBlock];
    }];
}

#pragma mark 给单个ADTextField对象设置键盘回调和return按钮回调

- (void)setKeyboardWillShowCallBackBlock:(void(^)(CGFloat keyboardHeight))keyboardWillShowCallBackBlock keyboardWillHideCallBackBlock:(void(^)(CGFloat keyboardHeight))keyboardWillHideCallBackBlock returnCallBacBlock:(void(^)())returnCallBacBlock
{
    self.keyboardWillShowCallBackBlock = keyboardWillShowCallBackBlock;
    self.keyboardWillHideCallBackBlock = keyboardWillHideCallBackBlock;
    self.returnCallBacBlock = returnCallBacBlock;
}

#pragma mark 回收键盘工厂方法
+ (void)hideKeyboard
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kADTextFieldDismissKeyboardNotification object:nil];
}

#pragma mark 基础设置
- (void)setUp{
    [self addUIKeyboardNotification];
    self.delegate = self;
}

#pragma mark 回收键盘

- (void)hideKeyboard
{
    [self resignFirstResponder];
}

#pragma mark 添加键盘通知
- (void)addUIKeyboardNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideKeyboard) name:kADTextFieldDismissKeyboardNotification object:nil];
}

#pragma mark 键盘弹出响应
- (void)keyboardWillShow:(NSNotification *)notification
{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _keyboardHeight = keyboardFrame.size.height;
    if (self.keyboardWillShowCallBackBlock) {
        self.keyboardWillShowCallBackBlock(_keyboardHeight);
    }
}

#pragma mark 键盘收回响应
- (void)keyboardWillHide:(NSNotification *)notification
{
    if (self.keyboardWillHideCallBackBlock) {
        self.keyboardWillHideCallBackBlock(_keyboardHeight);
    }
}

#pragma mark - 代理回调 UITextFieldDelegate

#pragma mark return按钮回调
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.isReturnHideKeyboard)
    {
        [self hideKeyboard];
    }
    if (self.returnCallBacBlock) {
        self.returnCallBacBlock();
    }
    return YES;
}

@end
