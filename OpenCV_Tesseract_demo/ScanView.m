//
//  ScanView.m
//  OpenCV_Tesseract_demo
//
//  Created by 张昭 on 30/11/2016.
//  Copyright © 2016 张昭. All rights reserved.
//

#import "ScanView.h"

@interface ScanView ()


@end

@implementation ScanView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        // 1.59
        if (frame.size.width > 100.0 && frame.size.height > 30.0) {
            self.backgroundColor = [UIColor blackColor];
            self.alpha = 0.5;
            CGFloat width = frame.size.width * 0.8;
            MIN(frame.size.width, frame.size.height);
            UIView *sView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width/1.59)];
            sView.backgroundColor = [UIColor clearColor];
            sView.layer.masksToBounds = YES;
            sView.layer.cornerRadius = 10;
            [self addSubview:sView];
            sView.center = self.center;
        }
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGFloat width = rect.size.width * 0.8;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect centerRect = CGRectMake((rect.size.width - width) / 2, (rect.size.height - width/1.59) / 2, width, width / 1.59);
//    CGContextClearRect(context, centerRect);
//    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
//    CGContextFillRect(context, centerRect);
    
    float rb_x = centerRect.origin.x + centerRect.size.width;
    float rb_y = centerRect.origin.y + centerRect.size.height;
    
    float lb_x = centerRect.origin.x;
    float lb_y = rb_y;
    
    CGContextMoveToPoint(context, rb_x, rb_y-20);
    CGContextAddArcToPoint(context, rb_x, rb_y, rb_x-20, rb_y, 10);
    CGContextAddArcToPoint(context, lb_x, lb_y, lb_x, lb_y-20, 10);
    CGContextAddArcToPoint(context, centerRect.origin.x, centerRect.origin.y, centerRect.origin.x + 20, centerRect.origin.y, 10);
    CGContextAddArcToPoint(context, rb_x, centerRect.origin.y, rb_x, centerRect.origin.y+20, 10);
    CGContextSetRGBFillColor(context, 1, 1, 1, 0.6);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
}

@end
