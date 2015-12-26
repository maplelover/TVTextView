//
//  TVTextView.m
//  Sword
//
//  Created by zhoujinrui on 15/12/22.
//  Copyright © 2015年 Topvogues. All rights reserved.
//

#import "TVTextView.h"

@interface TVTextView ()

@property (nonatomic, strong) UITextView* placeholderView;

@end

@implementation TVTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveTextChangeNotification:) name:UITextViewTextDidChangeNotification object:self];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Setter/Getters
- (UITextView *)placeholderView
{
    if (!_placeholderView
        && self.placeholder.length > 0)
    {
        _placeholderView = [[UITextView alloc] initWithFrame:self.bounds];
        [self insertSubview:_placeholderView atIndex:0];
        
        [self updatePlaceholderHiddenState];
        
        _placeholderView.userInteractionEnabled = NO;
        _placeholderView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _placeholderView.backgroundColor = [UIColor clearColor];
        
        _placeholderView.text = self.placeholder;
        _placeholderView.textColor = self.placeholderColor;
        _placeholderView.font = self.font;
        _placeholderView.textAlignment = self.textAlignment;
    }
    return _placeholderView;
}

- (UIColor *)placeholderColor
{
    if (!_placeholderColor)
    {
        _placeholderColor = [UIColor colorWithHexValue:0xd5d5d5];
    }
    return _placeholderColor;
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderView.font = font;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    [super setTextAlignment:textAlignment];
    self.placeholderView.textAlignment = textAlignment;
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self updatePlaceholderHiddenState];
}

#pragma mark - Notification
- (void)didReceiveTextChangeNotification:(NSNotification*)notification
{
    [self updatePlaceholderHiddenState];
}

#pragma mark - Layout
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.placeholderView sendToBack];
}

- (void)updatePlaceholderHiddenState
{
    self.placeholderView.hidden = self.text.length > 0;
}

@end
