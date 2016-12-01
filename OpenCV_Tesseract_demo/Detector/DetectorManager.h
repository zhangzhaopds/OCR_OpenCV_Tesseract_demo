//
//  DetectorManager.h
//  OpenCV_Tesseract_demo
//
//  Created by 张昭 on 29/11/2016.
//  Copyright © 2016 张昭. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;
@class UIView;

typedef void (^CompleteBlock)(NSString *result);

@interface DetectorManager : NSObject

+ (instancetype)shareInstance;
- (void)detecteCardWithImage:(UIImage *)cardImage compleate:(CompleteBlock)complete;

// 测试
- (UIImage *)opencvScanCard:(UIImage *)image withBlack:(int)black withWhite:(int)white;

@end
