//
//  LLEntryViewController.m
//
//  Copyright (c) 2018 LLDebugTool Software Foundation (https://github.com/HDB-Li/LLDebugTool)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "LLEntryViewController.h"
#import "LLEntryBallView.h"
#import "LLConfig.h"
#import "UIView+LL_Utils.h"

@interface LLEntryViewController ()

@property (nonatomic, strong) LLEntryBallView *ballView;

@property (nonatomic, assign) LLConfigWindowStyle style;

@end

@implementation LLEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initial];
}

#pragma mark - Primary
- (void)initial {
    
}

- (void)updateStyle:(LLConfigWindowStyle)style {
    switch (style) {
        case LLConfigWindowSuspensionBall: {
            [self.view addSubview:self.ballView];
        }
            break;
        case LLConfigWindowNetBar: {
            [_ballView removeFromSuperview];
        }
            break;
        case LLConfigWindowPowerBar: {
            [_ballView removeFromSuperview];
        }
            break;
        default:
            break;
    }
}

#pragma mark - Lazy
- (LLEntryBallView *)ballView {
    if (!_ballView) {
        CGFloat logoImageViewWidth = [LLConfig sharedConfig].suspensionBallWidth / 2;
        _ballView = [[LLEntryBallView alloc] initWithFrame:CGRectMake((self.view.LL_width - logoImageViewWidth) / 2, (self.view.LL_height - logoImageViewWidth) / 2, logoImageViewWidth, logoImageViewWidth)];
    }
    return _ballView;
}

@end
