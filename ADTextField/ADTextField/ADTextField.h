//
//  ADTextField.h
//  courier
//
//  Created by andehang on 2017/9/15.
//  Copyright © 2017年 jinlinbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADTextField : UITextField

/**键盘弹出回调*/
@property (copy, nonatomic) void(^keyboardWillShowCallBackBlock)(CGFloat keyboardHeight);

/**键盘收回回调*/
@property (copy, nonatomic) void(^keyboardWillHideCallBackBlock)(CGFloat keyboardHeight);

/**Return按钮回调*/
@property (copy, nonatomic) void(^returnCallBacBlock)();

/**Return按钮是否回收键盘*/

@property (nonatomic, assign) IBInspectable BOOL isReturnHideKeyboard;

/**回收键盘*/
+ (void)hideKeyboard;

/**
 给多个ADTextField对象设置键盘回调和return按钮回调
 @param textFields ADTextField对象集合
 @param keyboardWillShowCallBackBlock 键盘弹出回调
 @param keyboardWillHideCallBackBlock 键盘收回回调
 @param returnCallBacBlock Return按钮回调
 */
+ (void)setTextFields:(NSArray<ADTextField *> *)textFields keyboardWillShowCallBackBlock:(void(^)(CGFloat keyboardHeight))keyboardWillShowCallBackBlock keyboardWillHideCallBackBlock:(void(^)(CGFloat keyboardHeight))keyboardWillHideCallBackBlock returnCallBacBlock:(void(^)())returnCallBacBlock;

- (void)setKeyboardWillShowCallBackBlock:(void(^)(CGFloat keyboardHeight))keyboardWillShowCallBackBlock keyboardWillHideCallBackBlock:(void(^)(CGFloat keyboardHeight))keyboardWillHideCallBackBlock returnCallBacBlock:(void(^)())returnCallBacBlock;

@end
