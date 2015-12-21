//
// Created by Dmitry Zozulya on 03.04.14.
// Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DZImageHelper : NSObject

+ (UIImage *)cropImage:(UIImage *)image
        fromScrollView:(UIScrollView *)scrollView
              withSize:(CGSize)size;
+ (CGFloat)minimumScaleFromSize:(CGSize)size toFitTargetSize:(CGSize)targetSize;
@end