//
// Created by Dmitry Zozulya on 02.06.14.
// Copyright (c) 2014 Dmitry Zozulya. All rights reserved.
//

#import "DZImageEditingController.h"
#import "DZImageHelper.h"
#import "DZImageEditingControllerDelegate.h"

@interface DZImageEditingController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) UIImageView *imageView;
@end

@implementation DZImageEditingController

#pragma mark - view lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //adding image to scrollView
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.image.size;
    self.scrollView.scrollEnabled = YES;

    [self setScrollViewOffset];
    self.scrollView.minimumZoomScale = self.minimumScale;
    self.scrollView.maximumZoomScale = self.maximumScale;
    self.scrollView.zoomScale = self.defaultScale;

    if (self.overlayView) {
        [self.view addSubview:self.overlayView];
    }
}

#pragma mark - getters

- (CGRect)cropRect
{
    if (CGRectEqualToRect(_cropRect, CGRectZero)) {
        _cropRect = [UIScreen mainScreen].bounds;
    }
    return _cropRect;
}

- (CGFloat)minimumScale
{
    if (! _minimumScale) {
        _minimumScale = [DZImageHelper minimumScaleFromSize:self.image.size
                                            toFitTargetSize:self.cropRect.size];
    }
    return _minimumScale;
}

- (CGFloat)maximumScale
{
    if (! _maximumScale) {
        _maximumScale = 2 * [DZImageHelper minimumScaleFromSize:self.image.size
                                                toFitTargetSize:[UIScreen mainScreen].bounds.size];
    }
    return _maximumScale;
}

- (CGFloat)defaultScale
{
    if (! _defaultScale) {
        _defaultScale = [DZImageHelper minimumScaleFromSize:self.image.size
                                            toFitTargetSize:[UIScreen mainScreen].bounds.size];
    }
    return _defaultScale;
}

#pragma mark - actions

- (IBAction)cancelEditing
{
    if ([self.delegate respondsToSelector:@selector(imageEditingControllerDidCancel:)]) {
        [self.delegate imageEditingControllerDidCancel:self];
    }
}

- (IBAction)endedEditing
{
    if ([self.delegate respondsToSelector:@selector(imageEditingController:didFinishEditingWithImage:)]) {
        UIImage *croppedImage = [DZImageHelper cropImage:self.image
                                          fromScrollView:self.scrollView
                                                withSize:self.cropRect.size];
        [self.delegate imageEditingController:self
                    didFinishEditingWithImage:croppedImage];
    }
}

#pragma mark - delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

#pragma mark - private

- (void)setScrollViewOffset
{
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGFloat bottom = screenBounds.size.height - self.cropRect.size.height - self.cropRect.origin.y;
    CGFloat right = screenBounds.size.width - self.cropRect.size.width - self.cropRect.origin.x;
    CGFloat top = self.cropRect.origin.y;
    CGFloat left = self.cropRect.origin.x;
    [self.scrollView setContentInset:UIEdgeInsetsMake(top, left, bottom, right)];
}

@end