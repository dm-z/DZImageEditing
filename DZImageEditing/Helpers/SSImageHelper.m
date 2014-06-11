//
// Created by Dmitry Zozulya on 03.04.14.
// Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "SSImageHelper.h"


@implementation SSImageHelper

+ (UIImage *)cropImage:(UIImage *)image
              WithRect:(CGRect)rect
{
    UIImage *resizedImage = [SSImageHelper resizeImage:image];
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGRect rectWithScale = CGRectMake(rect.origin.x * scale, rect.origin.y * scale, rect.size.width * scale, rect.size.height * scale);
    CGImageRef imageRef = CGImageCreateWithImageInRect([resizedImage CGImage], rectWithScale);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}

+ (UIImage *)cropImage:(UIImage *)image
        fromScrollView:(UIScrollView *)scrollView
              withSize:(CGSize)size
{
    CGSize scaledSize = CGSizeMake(image.size.width * scrollView.zoomScale, image.size.height * scrollView.zoomScale);
    UIImage *scaledImage = [self imageWithImage:image
                                   scaledToSize:scaledSize];
    CGFloat x = scrollView.contentOffset.x + scrollView.contentInset.left;
    CGFloat y = scrollView.contentOffset.y + scrollView.contentInset.top;
    CGRect cropRect = CGRectMake(x, y, size.width, size.height);
    return [self cropImage:scaledImage withRect:cropRect];
}

+ (CGFloat)minimumScaleFromSize:(CGSize)size toFitTargetSize:(CGSize)targetSize
{
    CGFloat widthScale = targetSize.width / size.width;
    CGFloat heightScale = targetSize.height / size.height;
    return (widthScale > heightScale) ? widthScale : heightScale;
}

#pragma mark - private

+ (UIImage *)maskImage:(UIImage *)image
              withMask:(UIImage *)maskImage
{

    CGImageRef maskRef = maskImage.CGImage;

    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
            CGImageGetHeight(maskRef),
            CGImageGetBitsPerComponent(maskRef),
            CGImageGetBitsPerPixel(maskRef),
            CGImageGetBytesPerRow(maskRef),
            CGImageGetDataProvider(maskRef), NULL, false);

    CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
    UIImage *maskedImage = [UIImage imageWithCGImage:masked];
    CGImageRelease(mask);
    CGImageRelease(masked);
    return maskedImage;
}

+ (UIImage *)resizeImage:(UIImage *)image
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.height * screenScale, screenBounds.size.width * screenScale);
    UIImage *newImage = [self imageWithImage:image scaledToSize:screenSize];

    return newImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)cropImage:(UIImage *)image withRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
    UIImage *resultImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return resultImage;
}

@end