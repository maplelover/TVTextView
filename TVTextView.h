//
//  TVTextView.h
//  Sword
//
//  Created by zhoujinrui on 15/12/22.
//  Copyright © 2015年 Topvogues. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TVTextView : UITextView

@property (nonatomic, copy) IBInspectable NSString *placeholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

@end
